
//which external libraries do we need?
#include "CPU.h"
#include <stdbool.h>
#include <stdio.h>

/*******************************************************************************
Global variables describind the state of the cpu
*******************************************************************************/
//core cpu functions and memory
uint8_t CPU_MEMORY[8*1024*1024];
uint32_t PC = 0x00000200;
unsigned long long CPU_CYCLES = 0;
bool CPU_RUNNING = true;
const uint32_t CPU_MAX_ADDRESS = 8*1024*1024-1;

#define CPU_STATUS_IENABLED 1
#define CPU_STATUS_MMUENABLED 2
#define CPU_STATUS_PRIVILEGED 4
#define CPU_STATUS_INTERRUPTED 8
uint32_t CPU_STATUS = 0;
typedef union{
	uint32_t r32;
	uint16_t r16;
	uint8_t  r8;
} reg;
reg CPU_REGISTERS[32];//16 registers + temporary hidden registers used by microops for intermediate values

//CPU cache
uint32_t CPU_CACHE_DATA_TAGS[128];
uint32_t CPU_CACHE_DATA_REPLACE[64];
uint32_t CPU_CACHE_INST_TAGS[128];
uint32_t CPU_CACHE_INST_REPLACE[64];
uint32_t cpu_mem_busy_cycles = 0;
uint32_t cpu_mem_open_row = 0xffffffff;//invalid open line
#define CPU_CACHE_ENTRY_MASK 0x07c0
#define CPU_CACHE_ENTRY_SHIFT 6
#define CPU_CACHE_ADDR_MASK 0xfffff800
#define CPU_CACHE_ADDR_MASK_INV 0x000007ff
#define CPU_CACHE_ASSOC_WRAP 128
#define CPU_CACHE_ENTRY_VALID 1
#define CPU_CACHE_ENTRY_ALTERED 2
#define CPU_CACHE_ENTRY_AND_MASK_FOR_INVALIDATE 0xfffffffe

//software controlled TLB
//uses 4k pages
uint32_t TLB[32];
uint32_t TLB_PADDR[32];
uint32_t MTLBI[2];
uint32_t MTLBI_PADDR[2];
uint32_t MTLBD[2];
uint32_t MTLBD_PADDR[2];
const uint32_t TLB_PAGE_MASK = 0xfffff000;//address mask
const uint32_t TLB_RESIDUAL_MASK = 0xfff;//process entry belongs to, generally
uint32_t MTLBI_REPLACE = 0;
uint32_t MTLBD_REPLACE = 0;

//microcode format 1
typedef struct {
	uint8_t opcode;//operation specifier
	uint8_t res;//result register
	uint32_t PC;//at which PC value was this instruction issued from?
	uint32_t par0;//parameters for operation
	uint32_t par1;
} microop_execute;
//microcode format 2
typedef struct {
	uint8_t opcode;			//8
	uint8_t res;			//16
	uint32_t PC;			//48
	uint32_t par0;			//80
	uint32_t par1;			//112
	uint32_t immediate0;	//144
	uint32_t immediate1;	//176
	uint8_t shift0;			//184
} microop_decode;

/*******************************************************************************
Below are support functions for memory: TLB and cache management
*******************************************************************************/
void dcache_invalidate(uint32_t address) {
	//mask the cache index from the address
	uint32_t entry = (address & CPU_CACHE_ENTRY_MASK) >> CPU_CACHE_ENTRY_SHIFT;
	uint32_t address_tag = address & CPU_CACHE_ADDR_MASK;
	//check first entry
	if(address_tag == (CPU_CACHE_DATA_TAGS[entry]&CPU_CACHE_ADDR_MASK) && (CPU_CACHE_DATA_TAGS[entry]&CPU_CACHE_ENTRY_VALID)) {
		CPU_CACHE_DATA_TAGS[entry] &= CPU_CACHE_ENTRY_AND_MASK_FOR_INVALIDATE;
		CPU_CACHE_DATA_REPLACE[entry] = 0;//replace other entry on next cache miss
		return;
	}
	//check second entry
	if(address_tag == (CPU_CACHE_DATA_TAGS[entry+CPU_CACHE_ASSOC_WRAP]&CPU_CACHE_ADDR_MASK) && (CPU_CACHE_DATA_TAGS[entry+CPU_CACHE_ASSOC_WRAP]&CPU_CACHE_ENTRY_VALID)) {
		CPU_CACHE_DATA_TAGS[entry+CPU_CACHE_ASSOC_WRAP] &= CPU_CACHE_ENTRY_AND_MASK_FOR_INVALIDATE;
		CPU_CACHE_DATA_REPLACE[entry] = CPU_CACHE_ASSOC_WRAP;//replace other entry on next cache miss
		return;
	}
	//TODO: we must write back the cache line before invalidating, which means we need to update cpu_mem_busy_cycles to 7 or 11 cycles, and change open row
}

void icache_invalidate(uint32_t address) {
	//mask the cache index from the address
	uint32_t entry = (address & CPU_CACHE_ENTRY_MASK) >> CPU_CACHE_ENTRY_SHIFT;
	uint32_t address_tag = address & CPU_CACHE_ADDR_MASK;
	//check first entry
	if(address_tag == (CPU_CACHE_INST_TAGS[entry]&CPU_CACHE_ADDR_MASK) && (CPU_CACHE_INST_TAGS[entry]&CPU_CACHE_ENTRY_VALID)) {
		CPU_CACHE_INST_TAGS[entry] &= CPU_CACHE_ENTRY_AND_MASK_FOR_INVALIDATE;
		CPU_CACHE_INST_REPLACE[entry] = 0;//replace other entry on next cache miss
		return;
	}
	//check second entry
	if(address_tag == (CPU_CACHE_INST_TAGS[entry+CPU_CACHE_ASSOC_WRAP]&CPU_CACHE_ADDR_MASK) && (CPU_CACHE_INST_TAGS[entry+CPU_CACHE_ASSOC_WRAP]&CPU_CACHE_ENTRY_VALID)) {
		CPU_CACHE_INST_TAGS[entry+CPU_CACHE_ASSOC_WRAP] &= CPU_CACHE_ENTRY_AND_MASK_FOR_INVALIDATE;
		CPU_CACHE_INST_REPLACE[entry] = CPU_CACHE_ASSOC_WRAP;//replace other entry on next cache miss
		return;
	}
}
//data cache load
void load_dcache(uint32_t address, uint32_t *delay, bool mark_altered) {
	//mask the cache index from the address
	uint32_t entry = (address & CPU_CACHE_ENTRY_MASK) >> CPU_CACHE_ENTRY_SHIFT;
	uint32_t address_tag = address & CPU_CACHE_ADDR_MASK;
	//check first entry
	if(address_tag == (CPU_CACHE_DATA_TAGS[entry]&CPU_CACHE_ADDR_MASK) && (CPU_CACHE_DATA_TAGS[entry]&CPU_CACHE_ENTRY_VALID)) {
		CPU_CACHE_DATA_TAGS[entry] |= mark_altered ? CPU_CACHE_ENTRY_ALTERED : 0;
		CPU_CACHE_DATA_REPLACE[entry] = CPU_CACHE_ASSOC_WRAP;//replace other entry on next cache miss
		return;
	}
	//check second entry
	if(address_tag == (CPU_CACHE_DATA_TAGS[entry+CPU_CACHE_ASSOC_WRAP]&CPU_CACHE_ADDR_MASK) && (CPU_CACHE_DATA_TAGS[entry+CPU_CACHE_ASSOC_WRAP]&CPU_CACHE_ENTRY_VALID)) {
		CPU_CACHE_DATA_TAGS[entry+CPU_CACHE_ASSOC_WRAP] |= mark_altered ? CPU_CACHE_ENTRY_ALTERED : 0;
		CPU_CACHE_DATA_REPLACE[entry] = 0;//replace other entry on next cache miss
		return;
	}
	//if neither entry is valid, use LRU replacement policy to determine which slot to replace
	uint32_t replace = CPU_CACHE_DATA_REPLACE[entry];//should be 0 or 64
	replace += entry;
	CPU_CACHE_DATA_REPLACE[entry] ^= CPU_CACHE_ASSOC_WRAP;//select other entry for replacement next

	uint32_t entry_tag = CPU_CACHE_DATA_TAGS[replace];//get cache entry tags for line we are replacing
	bool validAndAltered = (entry_tag & CPU_CACHE_ENTRY_VALID) && (entry_tag & CPU_CACHE_ENTRY_ALTERED);
	//add appropriate delay
	//calculation 4 cycles to transfer data+CL, + TRCD+TRP if we are on a different row
	//assuming CL = 3, TRCD = 2, TRP = 2 timing is 7/11 cycles, so 14,18 or 22 cycles if we needed to re-write a line
	//7 cycles if on current row, 11 cycles if on different rows
	uint32_t totalDelay = cpu_mem_busy_cycles;
	if(validAndAltered) {//write back altered row into memory
		if((entry_tag & CPU_CACHE_ADDR_MASK) == cpu_mem_open_row) {//CPU_CACHE_ADDR_MASK incidentally also gives us dram row when masking
			totalDelay += 7;
		} else {
			totalDelay += 11;
			cpu_mem_open_row = entry_tag & CPU_CACHE_ADDR_MASK;//change currently open row
		}
	}
	totalDelay += (address & CPU_CACHE_ADDR_MASK) == cpu_mem_open_row ? 7 : 11;
	cpu_mem_open_row = address & CPU_CACHE_ADDR_MASK;//change currently open line

	CPU_CACHE_DATA_TAGS[replace] = (address & CPU_CACHE_ADDR_MASK) | CPU_CACHE_ENTRY_VALID | mark_altered?CPU_CACHE_ENTRY_ALTERED:0;//replace cache entry
	totalDelay -= 1;//account for current cycle
	cpu_mem_busy_cycles = totalDelay;//remember how long the memory was busy for
	*delay += totalDelay;//tell caller how long the delay was
	return;
}

//instruction cache load
void load_icache(uint32_t address, uint32_t *delay) {
	//mask the cache index from the address
	uint32_t entry = (address & CPU_CACHE_ENTRY_MASK) >> CPU_CACHE_ENTRY_SHIFT;
	uint32_t address_tag = address & CPU_CACHE_ADDR_MASK;
	//check first entry
	if(address_tag == (CPU_CACHE_INST_TAGS[entry]&CPU_CACHE_ADDR_MASK) && (CPU_CACHE_INST_TAGS[entry]&CPU_CACHE_ENTRY_VALID)) {
		CPU_CACHE_INST_REPLACE[entry] = CPU_CACHE_ASSOC_WRAP;//replace other entry on next cache miss
		return;
	}
	//check second entry
	if(address_tag == (CPU_CACHE_INST_TAGS[entry+CPU_CACHE_ASSOC_WRAP]&CPU_CACHE_ADDR_MASK) && (CPU_CACHE_INST_TAGS[entry+CPU_CACHE_ASSOC_WRAP]&CPU_CACHE_ENTRY_VALID)) {
		CPU_CACHE_INST_REPLACE[entry] = 0;//replace other entry on next cache miss
		return;
	}
	//if neither entry is valid, use LRU replacement policy to determine which slot to replace
	uint32_t replace = CPU_CACHE_INST_REPLACE[entry];//should be 0 or 64
	replace += entry;
	CPU_CACHE_INST_REPLACE[entry] ^= CPU_CACHE_ASSOC_WRAP;//select other entry for replacement next

	//add appropriate delay
	//calculation 4 cycles to transfer data+CL, + TRCD+TRP if we are on a different row
	//assuming CL = 3, TRCD = 2, TRP = 2 timing is 7/11 cycles
	//7 cycles if on current row, 11 cycles if on different rows
	*delay = cpu_mem_busy_cycles;
	uint32_t totalDelay = 0;
	totalDelay += (address & CPU_CACHE_ADDR_MASK) == cpu_mem_open_row ? 7 : 11;
	cpu_mem_open_row = address & CPU_CACHE_ADDR_MASK;//change currently open line

	CPU_CACHE_DATA_TAGS[replace] = (address & CPU_CACHE_ADDR_MASK) | CPU_CACHE_ENTRY_VALID;//replace cache entry
	totalDelay -= 1;//account for current cycle
	cpu_mem_busy_cycles += totalDelay;//remember how long the memory was busy for.
	*delay += totalDelay;//tell caller how long the delay was
	return;
}

uint32_t current_process_id = 0;
uint32_t tlb_translate_iaddr(uint32_t addr, bool *error, uint32_t* delay) {
	//use the MTLBI to decode the correct address of the address
	uint32_t entry = (addr&TLB_PAGE_MASK)+current_process_id;
	if(MTLBI[0] == entry) {
		//translate address and return
		MTLBI_REPLACE = 1;
		return (MTLBI[0]&TLB_PAGE_MASK)+(addr&TLB_RESIDUAL_MASK);
	} else if(MTLBI[1] == entry) {
		//translate address and return
		MTLBI_REPLACE = 0;
		return (MTLBI[1]&TLB_PAGE_MASK)+(addr&TLB_RESIDUAL_MASK);
	} else {
		//if the MTLBI does not contain the address, add 3 cycles and check the TLB
		*delay = 3;
		for(int i = 0; i < 32; ++i) {
			if(TLB[i] == entry) {
				//if the entry is found, put the entry in the MTLBI
				MTLBI[MTLBI_REPLACE] = TLB[i];
				MTLBI_PADDR[MTLBI_REPLACE] = TLB_PADDR[i];
				MTLBI_REPLACE ^= 1;
				//and return the translated address
				return (TLB[i]&TLB_PAGE_MASK)+(PC&TLB_RESIDUAL_MASK);
			}
		}
		//otherwise, raise an exception
		*error = true;
		return -1;
	}
}
uint32_t tlb_translate_daddr(uint32_t addr, bool *error, uint32_t* delay) {
	//use the MTLBI to decode the correct address of the address
	uint32_t entry = (addr&TLB_PAGE_MASK)+current_process_id;
	if(MTLBD[0] == entry) {
		//translate address and return
		MTLBD_REPLACE = 1;
		return (MTLBD[0]&TLB_PAGE_MASK)+(addr&TLB_RESIDUAL_MASK);
	} else if(MTLBD[1] == entry) {
		//translate address and return
		MTLBD_REPLACE = 0;
		return (MTLBD[1]&TLB_PAGE_MASK)+(addr&TLB_RESIDUAL_MASK);
	} else {
		//if the MTLBD does not contain the address, add 3 cycles and check the TLB
		*delay = 3;
		for(int i = 0; i < 32; ++i) {
			if(TLB[i] == entry) {
				//if the entry is found, put the entry in the MTLBD
				MTLBD[MTLBD_REPLACE] = TLB[i];
				MTLBD_PADDR[MTLBD_REPLACE] = TLB_PADDR[i];
				MTLBD_REPLACE ^= 1;
				//and return the translated address
				return (TLB[i]&TLB_PAGE_MASK)+(PC&TLB_RESIDUAL_MASK);
			}
		}
		//otherwise, raise an exception
		*error = true;
		return -1;
	}
}

/**************************************************************
Below is the actual pipeline
**************************************************************/
//instruction prefetch buffer
uint8_t inst_buffer[64];
int inst_buffer_PC = 0;
int inst_buffer_size = 0;
int inst_buffer_size_next = 0;
int inst_buffer_fill_index = 0;
const uint32_t inst_buffer_mask = 63;
uint32_t prefetch_delay = 0;
bool inst_buffer_pending_fill = false;
bool inst_buffer_init = true;
//instruction decode
int instructions_decoded[2] = {0,0};
int next_inst[2] = {0,0};
microop_decode decoded_instruction[2][4];//assuming no instruction is longer than 4 opcodes
//operand fetch
microop_execute opfetch_stage[2];
bool opfetch_ready[2] = {false,false};
//execute
int execute_delay = 0;

void init_CPU() {
	//memory controllers etc.
	cpu_mem_busy_cycles = 0;
	//clear cache
	//TODO
	//clear TLB
	//TODO
	//clear ram
	for(int i = 0; i <= CPU_MAX_ADDRESS; ++i) {
		CPU_MEMORY[i] = 0;
	}
	//exec stage
	execute_delay = 0;
	//opfetch_stage
	opfetch_ready[0] = false;
	opfetch_ready[1] = false;
	//decode stage
	next_inst[0] = 0;
	next_inst[1] = 0;
	instructions_decoded[0] = 0;
	instructions_decoded[1] = 0;
	//prefetch stage
	inst_buffer_init = true;
	prefetch_delay = 0;
	inst_buffer_pending_fill = false;
}

//this function clears all pipelines from the selected stage backwards
void clear_pipeline(int stage) {
	//switch the stage, use fall-through to clear the rest of the pipeline
	switch(stage) {
		case 4:
			//writeback stage, not actually present but represented here nontheless
			//should maybe be taken out as it fills no function and shouldn't be called ever
		case 3://exec
			execute_delay = 0;
		case 2://opfetch
			opfetch_ready[0] = false;
			opfetch_ready[1] = false;
		case 1://decode
			next_inst[0] = 0;
			next_inst[1] = 0;
			instructions_decoded[0] = 0;
			instructions_decoded[1] = 0;
		case 0://fetch
			inst_buffer_init = true;
			inst_buffer_pending_fill = false;//NOTE: resetting prefetch delay here probably shouldnn't matter
			break;
		default://shouldn't be called
			break;
	}
}
//writeback is skipped, as it doesn't have any effects on latency/throughput IIRC
/**************************************************************
Instruction prefetch stage
**************************************************************/
//pupulate the instruction buffer
void fetch_inst() {
	printf("prefetch_stage\n");
	if(prefetch_delay) {
		printf("prefetch busy %u\n",prefetch_delay);
		--prefetch_delay;
		return;
	}

	if(inst_buffer_pending_fill) {//this is the case on a cache miss
		inst_buffer_pending_fill = false;
		inst_buffer_size += 32;
	}
	if(inst_buffer_size >= 32) {
		printf("prefetch buffer full %u\n",inst_buffer_size);
		return;//we don't do anything until we have room in the buffer
	}

	//check for cache misses here
	//if there is a miss: update data cache, set prefetch_delay to the time it took to fetch the memory and return

	if(inst_buffer_init) {
		inst_buffer_init = false;
		inst_buffer_PC = PC & 0xffffffc0;
		inst_buffer_fill_index = PC & 32;
		inst_buffer_size = 32-(PC&31);
	} else {
		inst_buffer_size += 32;
	}
	printf("prefetching %u\n",inst_buffer_PC);
	for(int i = 0; i < 32; ++i) {
		inst_buffer[inst_buffer_fill_index] = CPU_MEMORY[inst_buffer_PC];//TODO: read from and update cpu cache here
		++inst_buffer_fill_index;
		++inst_buffer_PC;
	}
	inst_buffer_fill_index &= 63;

	return;
}
/*******************************************************************************
Instruction decode stage
*******************************************************************************/
uint32_t cpu_register_busy = 0;//two bits for each register encodes wether a register will be overwritten soon or not
void decode_inst() {
	if(instructions_decoded[0] || instructions_decoded[1]) {
		printf("decode_inst waiting for instructions to enter opfetch\n");
		return;
	}
	//decode instructions, create microops
	for(int i = 0; i < 2; ++i) {
		printf("decoding %i, %u\n",i,PC);
		uint32_t PC_before = PC;
		uint32_t inst_buffer_size_before = inst_buffer_size;
		//retrieve opcode
		if(inst_buffer_size == 0) {
			printf("inst buffer empty\n");
			break;
		}
		uint8_t opcode = inst_buffer[PC&63];
		--inst_buffer_size; ++PC;

		if(opcode < 128) {
			printf("simple instruction %u\n",(uint32_t)opcode);
			//0ooo ooLL rrrr rrrr <- simple operation between registers, 32 simple instrs
			//do not pair multiplications and divisions with anything
			if(	i && (opcode&0xf0) == (CPUOP_MUL<<2)) {
				break;
			}

			microop_decode m;
			m.opcode = opcode;
			if(inst_buffer_size == 0) {
				PC = PC_before;
				inst_buffer_size = inst_buffer_size_before;
				break;
			}
			uint8_t next_byte = inst_buffer[PC&63];
			--inst_buffer_size; ++PC;

			int r0 = next_byte & 15;
			int r1 = next_byte >> 4;
			if(	r0 && cpu_register_busy&(1<<r0*2) ||
				r1 && cpu_register_busy&(1<<r1*2)) {
				//do not permit a register to be simulteneously read and written to
				printf("simultaneous modification of register, in simple instruction\n");
				PC = PC_before;
				inst_buffer_size = inst_buffer_size_before;
				break;
			}

			m.par0 = r0;
			m.par1 = r1;
			m.PC = PC_before;
			m.res = m.par0;
			m.shift0 = 0;
			m.immediate0 = 0;
			m.immediate1 = 0;
			decoded_instruction[i][0] = m;
			instructions_decoded[i] = 1;
			next_inst[i] = 0;
		} else if(opcode < (CPUOP_FLD+128)) {
			printf("complex arithmetic instruction %u-ish\n",(uint32_t)((opcode<<2)&255));
			opcode = (opcode & 31);
			//do not pair multiplications and divisions with anything
			if(	i && (opcode&0x7c) == CPUOP_MUL) {
				break;
			}
			//make sure we have enough data in the buffer to read the instruction, immediate values checked for later
			if(inst_buffer_size < 2) {
				printf("inst buffer emptied, aborting\n");
				PC = PC_before;
				inst_buffer_size = inst_buffer_size_before;
				break;
			}

			opcode = opcode << 2;

			uint8_t extension = 0;
			uint8_t r0 = 0;
			uint8_t r1 = 0;
			int immLen = 0;
			//instruction format: 1 bit advanced instruction toggle (AIT), toggles between:
			//1ooo oooo rrrr rrrr IILL MMII iiii iiii .... <- advanced instruction, immediate and
			//fields which affect length are the AIT and immediate toggle/length (ITL) fields
			//D = disregard reg2
			//get second byte, decode registers
			uint8_t next_byte = inst_buffer[PC&63];
			--inst_buffer_size; ++PC;
			r0 = next_byte & 15;
			r1 = next_byte >> 4;

			if(	r0 && cpu_register_busy&(1<<r0*2) ||
				r1 && cpu_register_busy&(1<<r1*2)) {
				printf("simultaneous modification of register, in advanced instruction\n");
				//do not permit a register to be simulteneously read and written to, except register number 0
				PC = PC_before;
				inst_buffer_size = inst_buffer_size_before;
				break;
			}
			//get advanced byte
			extension = inst_buffer[PC&63];
			--inst_buffer_size; ++PC;

			uint32_t immediate0 = 0;
			uint32_t immediate1 = 0;
			//decode immediates if neccessary
			if(extension>>6) {
				immLen = 1<<((extension>>6)-1);
				if(inst_buffer_size < immLen) {
					PC = PC_before;
					inst_buffer_size = inst_buffer_size_before;
					break;
				}
				inst_buffer_size -= immLen;
				printf("reading %i bytes of immediate0 data\n",immLen);
				for(int i = 0; i < immLen; ++i) {
					immediate0 = immediate0 + (inst_buffer[PC&63] << i*8);
					++PC;
				}
			}
			if(extension & 3) {
				immLen = 1<<((extension&3)-1);
				if(inst_buffer_size < immLen) {
					PC = PC_before;
					inst_buffer_size = inst_buffer_size_before;
					break;
				}
				inst_buffer_size -= immLen;
				printf("reading %i bytes of immediate1 data\n",immLen);
				for(int i = 0; i < immLen; ++i) {
					immediate1 = immediate1 + (inst_buffer[PC&63] << i*8);
					++PC;
				}
			}
			//generate Micro-Ops
			microop_decode primary;
			primary.opcode = opcode+((extension>>4)&3);
			//primary.res = r0;
			primary.PC = PC_before;
			primary.shift0 = 0;
			//primary.par0 = r0;//moved later
			primary.par1 = r1;
			//primary.immediate0 = immediate0;
			primary.immediate1 = immediate1;

			int opCount = 0;
			//generate micro-ops for reads, if neccessary
			if(extension & 4) {
				//read from operand 1
				microop_decode m;
				m.opcode = CPUMOP_RD8 | ((extension>>4) & 3);
				//read from a register
				m.res = CPU_REGISTER_INTERMEDIATE0;//two temporary registers, use reg 0
				m.PC = PC_before;
				m.shift0 = 0;
				m.par0 = r1;
				m.par1 = 0;
				m.immediate0 = immediate1;
				m.immediate1 = 0;
				//write to a temporary register
				primary.par1 = m.res;
				primary.immediate1 = 0;
				decoded_instruction[i][opCount++] = m;
			}
			//I hope this is the correct logic
			if (extension & 8) {
				//read from operand 2
				microop_decode m;
				m.opcode = CPUMOP_RD8 | ((extension>>4) & 3);
				//read from a register
				m.res = CPU_REGISTER_INTERMEDIATE1;//two temporary registers, use reg 1
				m.PC = PC_before;
				m.shift0 = 0;
				m.par0 = r0;
				m.par1 = 0;
				m.immediate0 = immediate0;
				m.immediate1 = 0;
				//write to a temporary register
				primary.par0 = m.res;
				primary.res = m.res;
				primary.immediate0 = 0;
				decoded_instruction[i][opCount++] = m;
				//emit primary microop
				decoded_instruction[i][opCount++] = primary;
				//emit operation for write
				//write par2 to par0
				m.opcode = CPUMOP_WR8 | ((extension>>4) & 3);
				//write to a register
				m.res = primary.res;
				m.PC = PC_before;
				m.shift0 = 0;
				m.par0 = r0;
				m.par1 = 0;//use the calculated value in the temporary register
				m.immediate0 = immediate0;
				m.immediate1 = 0;

				decoded_instruction[i][opCount++] = m;
			} else {
				primary.res = r0;
				primary.par0 = r0;
				primary.immediate0 = immediate0;
				//emit primary microop
				decoded_instruction[i][opCount++] = primary;
			}
			instructions_decoded[i] = opCount;
			next_inst[i] = 0;
			break;
		} else if(opcode < (128+CPUOP_LEA)) {//floating point instructions (32)
			if(opcode < (128+CPUOP_MOV8) && i) {
				break;
			}
			microop_decode m;
			m.opcode = opcode;
			if(inst_buffer_size == 0) {
				PC = PC_before;
				inst_buffer_size = inst_buffer_size_before;
				break;
			}
			uint8_t next_byte = inst_buffer[PC&63];
			--inst_buffer_size; ++PC;
			m.par0 = 0;
			m.par1 = next_byte >> 4;
			m.PC = PC_before;
			m.res = next_byte & 15;
			m.shift0 = 0;
			m.immediate0 = 0;
			m.immediate1 = 0;
			decoded_instruction[i][0] = m;
			instructions_decoded[i] = 1;
			next_inst[i] = 0;
		} else if(opcode < (128+CPUOP_BR8)) {//lea type instructions
			//we have load address, store to attress, load from address and swap with address
			printf("lea-type instruction %u\n",(uint32_t)opcode);
			if(inst_buffer_size < 2) {
				printf("inst buffer emptied, aborting\n");
				PC = PC_before;
				inst_buffer_size = inst_buffer_size_before;
				break;
			}

			if(!(opcode&3)) {//lea


				microop_decode m;
				m.opcode = CPUMOP_ADD+
			} else {
				//ld, st and swp
				if(opcode & 1) {
					//load
					if(opcode &2) {
						//if we are swapping make sure to
					}

				}
				if(opcode & 2) {
					//store
				}
				if((opcode&3) == 3) {
					//swap

				}

			}
		} else if(opcode < (128+CPUOP_CDC)) {//random arithmetical instructions
			switch(opcode&31) {
				case 8:
				case 9:
				case 10:
				case 11:
					{
						//branching by adding something to PC
						uint8_t operation = 200+(opcode&3);
						//are we supposed to branch here? check branch predictor

						//if branch is sum of integer and register other than 0, assume not taken unless all condition flags set

						//set PC to the other instruction target
						//

					}
					break;
				default:;
			}
			break;//these instructions are unpairable in u pipe
		} else {
			//system maintenance instructions
			//first, check your privilige
			//otherwise, wait for empty queue and throw an interrupt
		}
		break;
	}
	cpu_register_busy = (cpu_register_busy & 0x55555554) << 1;
}

//fetch operands
void opfetch() {
	//fetch instructions only when both pipes are empty to prevent problems (?)
	if(opfetch_ready[0] || opfetch_ready[1]) return;
	for(int i = 0; i < 2; ++i) {
		if(!instructions_decoded[i]) {
			printf("opfetch pipe %i no instruction\n",i);
			continue;
		}
		printf("opfetch pipe %i\n",i);
		microop_decode m = decoded_instruction[i][next_inst[i]++];//grab the pending operation
		microop_execute m2;
		--instructions_decoded[i];
		m2.opcode = m.opcode;
		m2.res = m.res;
		m2.PC = m.PC;
		m2.par0 = (CPU_REGISTERS[m.par0].r32 << m.shift0)+m.immediate0;
		m2.par1 = CPU_REGISTERS[m.par1].r32+m.immediate1;

		opfetch_stage[i] = m2;
		opfetch_ready[i] = true;
	}
}
//in the following things the instruction format is: opcode, resreg, operand, operand, PC_ORIGIN (8,4,32,32 bits respectively)
//TODO: we need a method to clear the entire pipeline in case of exceptions
void execute() {
	if(execute_delay) {
		printf("execute delayed\n");
		--execute_delay;
		return;
	}
	//execute all instructions
	for(int i = 0; i < 2; ++i) {
		if(!opfetch_ready[i]) {
			printf("exec pipe %i not ready\n",i);
			continue;
		}
		uint32_t delay = 0;
		microop_execute operation = opfetch_stage[i];
		printf("execute microop %u in %i\n",(uint32_t)operation.opcode,i);
		opfetch_ready[i] = false;
		switch(operation.opcode) {
			//case CPUOP_INVALID:
			//	break;
			case CPUMOP_ADD|L8:
				{
					uint16_t res = operation.par0 + operation.par1;
					printf("8res = %u\n",res);
					CPU_REGISTERS[operation.res].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r8 = (uint8_t)(res>>8);
				}
				break;
			case CPUMOP_ADD|L16:
				{
					uint32_t res = operation.par0 + operation.par1;
					printf("16res = %u, %u, %u\n",res,operation.par0,operation.par1);
					CPU_REGISTERS[operation.res].r16 = (uint16_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r16 = (uint16_t)(res>>16);
				}
				break;
			case CPUMOP_ADD|L32:
				{
					uint64_t res = operation.par0 + operation.par1;
					printf("32res = %u, %u, %u\n",res,operation.par0,operation.par1);
					CPU_REGISTERS[operation.res].r32 = (uint32_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r32 = (uint32_t)(res>>32);
				}
				break;
			case CPUMOP_SUB|L8:
				{
					uint16_t res = operation.par0 - operation.par1;
					CPU_REGISTERS[operation.res].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r8 = (uint8_t)(res>>8);
				}
				break;
			case CPUMOP_SUB|L16:
				{
					uint32_t res = operation.par0 - operation.par1;
					CPU_REGISTERS[operation.res].r16 = (uint16_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r16 = (uint16_t)(res>>16);
				}
				break;
			case CPUMOP_SUB|L32:
				{
					uint64_t res = operation.par0 - operation.par1;
					CPU_REGISTERS[operation.res].r32 = (uint32_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r32 = (uint32_t)(res>>32);
				}
				break;
			case CPUMOP_MUL|L8:
				{
					uint16_t res = operation.par0 * operation.par1;
					CPU_REGISTERS[operation.res].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r8 = (uint8_t)(res>>8);
					delay = 10;
				}
				break;
			case CPUMOP_MUL|L16:
				{
					uint32_t res = operation.par0 * operation.par1;
					CPU_REGISTERS[operation.res].r16 = (uint16_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r16 = (uint16_t)(res>>16);
					delay = 10;
				}
				break;
			case CPUMOP_MUL|L32:
				{
					uint64_t res = operation.par0 * (uint64_t)operation.par1;
					CPU_REGISTERS[operation.res].r32 = (uint32_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r32 = (uint32_t)(res>>32);
					delay = 8;
				}
				break;
			case CPUMOP_DIV|L8:
				{
					uint8_t left = operation.par0;
					uint8_t right = (uint8_t)operation.par1;
					CPU_REGISTERS[operation.res].r8 = left / right;
					CPU_REGISTERS[CPU_REGISTER_EX].r8 = left % right;
					delay = 16;
				}
				break;
			case CPUMOP_DIV|L16:
				{
					uint16_t left = operation.par0;
					uint16_t right = operation.par1;
					CPU_REGISTERS[operation.res].r16 = left / right;
					CPU_REGISTERS[CPU_REGISTER_EX].r16 = left % right;
					delay = 24;
				}
				break;
			case CPUMOP_DIV|L32:
				{
					uint32_t left = operation.par0;
					uint32_t right = (uint32_t)operation.par1;
					CPU_REGISTERS[operation.res].r32 = left / right;
					CPU_REGISTERS[CPU_REGISTER_EX].r32 = left % right;
					delay = 40;
				}
				break;
			case CPUMOP_SDIV|L8:
				{
					int8_t left = operation.par0;
					int8_t right = (int8_t)operation.par1;
					CPU_REGISTERS[operation.res].r8 = left / right;
					CPU_REGISTERS[CPU_REGISTER_EX].r8 = left % right;
					delay = 21;
				}
				break;
			case CPUMOP_SDIV|L16:
				{
					int16_t left = operation.par0;
					int16_t right = (int16_t)operation.par1;
					CPU_REGISTERS[operation.res].r16 = left / right;
					CPU_REGISTERS[CPU_REGISTER_EX].r16 = left % right;
					delay = 29;
				}
				break;
			case CPUMOP_SDIV|L32:
				{
					int32_t left = operation.par0;
					int32_t right = (int32_t)operation.par1;
					CPU_REGISTERS[operation.res].r32 = left / right;
					CPU_REGISTERS[CPU_REGISTER_EX].r32 = left % right;
					delay = 45;
				}
				break;
			case CPUMOP_SHR|L8:
				{
					CPU_REGISTERS[operation.res].r8 = (uint8_t)operation.par0 >> (uint8_t)operation.par1;
				}
				break;
			case CPUMOP_SHR|L16:
				{
					CPU_REGISTERS[operation.res].r16 = (uint16_t)operation.par0 >> (uint8_t)operation.par1;
				}
				break;
			case CPUMOP_SHR|L32:
				{
					CPU_REGISTERS[operation.res].r32 = (uint32_t)operation.par0 >> (uint8_t)operation.par1;
				}
				break;
			case CPUMOP_SSHR|L8:
				{
					CPU_REGISTERS[operation.res].r8 = (uint8_t)((int8_t)operation.par0) >> (uint8_t)operation.par1;
				}
				break;
			case CPUMOP_SSHR|L16:
				{
					CPU_REGISTERS[operation.res].r16 = (uint16_t)((int16_t)operation.par0) >> (uint8_t)operation.par1;
				}
				break;
			case CPUMOP_SSHR|L32:
				{
					CPU_REGISTERS[operation.res].r32 = (uint32_t)((int32_t)operation.par0) >> (uint8_t)operation.par1;
				}
				break;
			case CPUMOP_SHL|L8:
				{
					CPU_REGISTERS[operation.res].r8 = (uint8_t)(operation.par0 << (uint8_t)operation.par1);
				}
				break;
			case CPUMOP_SHL|L16:
				{
					CPU_REGISTERS[operation.res].r16 = (uint16_t)(operation.par0 << (uint8_t)operation.par1);
				}
				break;
			case CPUMOP_SHL|L32:
				{
					CPU_REGISTERS[operation.res].r32 = (uint32_t)(operation.par0 << (uint8_t)operation.par1);
				}
				break;
			case CPUMOP_ROL|L8:
				{
					int roll = operation.par1 & 7;
					CPU_REGISTERS[operation.res].r8 = (uint8_t)((operation.par0 << roll) | (uint8_t)(operation.par0 >> (8-roll)));
				}
				break;
			case CPUMOP_ROL|L16:
				{
					int roll = operation.par1 & 15;
					CPU_REGISTERS[operation.res].r16 = (uint16_t)((operation.par0 << roll) | (uint16_t)(operation.par0 >> (16-roll)));
				}
				break;
			case CPUMOP_ROL|L32:
				{
					int roll = operation.par1 & 31;
					CPU_REGISTERS[operation.res].r32 = (uint32_t)((operation.par0 << roll) | (operation.par0 >> (32-roll)));
				}
				break;
			case CPUMOP_ROR|L8:
				{
					int roll = operation.par1 & 7;
					CPU_REGISTERS[operation.res].r8 = (uint8_t)((operation.par0 << roll) | (((uint8_t)operation.par0) >> (8-roll)));
				}
				break;
			case CPUMOP_ROR|L16:
				{
					int roll = operation.par1 & 15;
					CPU_REGISTERS[operation.res].r16 = (uint16_t)((operation.par0 << roll) | (((uint16_t)operation.par0) >> (16-roll)));
				}
				break;
			case CPUMOP_ROR|L32:
				{
					int roll = operation.par1 & 31;
					CPU_REGISTERS[operation.res].r32 = (uint32_t)((operation.par0 << roll) | (operation.par0 >> (32-roll)));
				}
				break;
			case CPUMOP_AND|L8:
				{
					CPU_REGISTERS[operation.res].r8 = operation.par0 & operation.par1;
				}
				break;
			case CPUMOP_AND|L16:
				{
					CPU_REGISTERS[operation.res].r16 = operation.par0 & operation.par1;
				}
				break;
			case CPUMOP_AND|L32:
				{
					CPU_REGISTERS[operation.res].r32 = operation.par0 & operation.par1;
				}
				break;
			case CPUMOP_OR|L8:
				{
					CPU_REGISTERS[operation.res].r8 = operation.par0 | operation.par1;
				}
				break;
			case CPUMOP_OR|L16:
				{
					CPU_REGISTERS[operation.res].r16 = operation.par0 | operation.par1;
				}
				break;
			case CPUMOP_OR|L32:
				{
					CPU_REGISTERS[operation.res].r32 = operation.par0 | operation.par1;
				}
				break;
			case CPUMOP_XOR|L8:
				{
					CPU_REGISTERS[operation.res].r8 = operation.par0 ^ operation.par1;
				}
				break;
			case CPUMOP_XOR|L16:
				{
					CPU_REGISTERS[operation.res].r16 = operation.par0 ^ operation.par1;
				}
				break;
			case CPUMOP_XOR|L32:
				{
					CPU_REGISTERS[operation.res].r32 = operation.par0 ^ operation.par1;
				}
				break;
			case CPUMOP_FFS|L8:
				{
				}
				break;
			case CPUMOP_FFS|L16:
				{
				}
				break;
			case CPUMOP_FFS|L32:
				{
				}
				break;
			case CPUMOP_FFZ|L8:
				{
				}
				break;
			case CPUMOP_FFZ|L16:
				{
				}
				break;
			case CPUMOP_FFZ|L32:
				{
				}
				break;
			case CPUMOP_CLZ|L8:
				{
				}
				break;
			case CPUMOP_CLZ|L16:
				{
				}
				break;
			case CPUMOP_CLZ|L32:
				{
				}
				break;
			case CPUMOP_ADDC|L8:
				{
					uint16_t res = operation.par0 + (uint16_t)((uint8_t)operation.par1) + CPU_REGISTERS[CPU_REGISTER_EX].r8;
					CPU_REGISTERS[operation.res].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r8 = (uint8_t)(res>>8);
				}
				break;
			case CPUMOP_ADDC|L16:
				{
					uint32_t res = ((uint16_t)operation.par0) + (uint32_t)((uint16_t)operation.par1) + CPU_REGISTERS[CPU_REGISTER_EX].r16;
					CPU_REGISTERS[operation.res].r16 = (uint16_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r16 = (uint16_t)(res>>16);
				}
				break;
			case CPUMOP_ADDC|L32:
				{
					uint64_t res = operation.par0 + (uint64_t)(operation.par1) + CPU_REGISTERS[CPU_REGISTER_EX].r32;
					CPU_REGISTERS[operation.res].r32 = (uint32_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r32 = (uint32_t)(res>>32);
				}
				break;
			case CPUMOP_SUBC|L8:
				{
					uint16_t res = ((uint8_t)operation.par0) - ((uint16_t)(uint8_t)operation.par1) + CPU_REGISTERS[CPU_REGISTER_EX].r8;
					CPU_REGISTERS[operation.res].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r8 = (uint8_t)(res>>8);
				}
				break;
			case CPUMOP_SUBC|L16:
				{
					uint32_t res = ((uint16_t)operation.par0) - (uint32_t)((uint16_t)operation.par1) + CPU_REGISTERS[CPU_REGISTER_EX].r16;
					CPU_REGISTERS[operation.res].r16 = (uint16_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r16 = (uint16_t)(res>>16);
				}
				break;
			case CPUMOP_SUBC|L32:
				{
					uint64_t res = operation.par0 - (uint64_t)(operation.par1) + CPU_REGISTERS[CPU_REGISTER_EX].r32;
					CPU_REGISTERS[operation.res].r32 = (uint32_t)res;
					CPU_REGISTERS[CPU_REGISTER_EX].r32 = (uint32_t)(res>>32);
				}
				break;
			case CPUMOP_RD8://must have separate read instruction for each data size
				{
					//step 1: compute address
					uint32_t address = operation.par0+operation.par1; //address (mostly) calculated in operand fetch stage
					//step 2: translate address if neccessary
					if(CPU_STATUS&CPU_STATUS_MMUENABLED) {
						bool fault = false;
						address = tlb_translate_daddr(address, &fault, &delay);
						if(fault) {
							//segment invalid, go to software TLB manager
							//clear all stage up to this one
							//disable interrupts, set interrupted flag
							//set interrupt PC
							//start interrupt handler
							//TODO: interrupts
							continue;
						}
					}
					//step 3: check address validity
					if(address >= 8*1024*1024) {
						//mem range fault
						//TODO: interrupts
						continue;
					}
					//step 4: make sure data is loaded in cache
					load_dcache(address,&delay,false);
					//step 5: read from memory
					CPU_REGISTERS[operation.res].r8 = CPU_MEMORY[address];
					//how do we do legacy memory instructions?
					//implement legacy address calc opcodes. Inflates execution time by one cycle, but it's easier to implement
				}
				break;
			case CPUMOP_RD16://must have separate read instruction for each data size
				{
					//step 1: compute address
					uint32_t address = operation.par0;
					//step 1.1: ensure address is aligned by 2 (TODO: should we just ignore the lowest bit? replaces one if-statement with one mask)
					if(address & 1) {
						//TODO: exception
						continue;
					}
					//step 2: translate address if neccessary
					if(CPU_STATUS&CPU_STATUS_MMUENABLED) {
						bool fault = false;
						address = tlb_translate_daddr(address, &fault, &delay);
						if(fault) {
							//segment invalid, go to software TLB manager
							//clear all stage up to this one
							//disable interrupts, set interrupted flag
							//set interrupt PC
							//start interrupt handler
							//TODO: interrupts
							continue;
						}
					}
					//step 3: check address validity
					if(address >= 8*1024*1024-1) {
						//mem range fault
						//TODO: interrupts
						continue;
					}
					//step 4: make sure data is loaded in cache
					load_dcache(address,&delay,false);
					//step 5: read from memory
					CPU_REGISTERS[operation.res].r16 = *(uint16_t*)&CPU_MEMORY[address];
					//how do we do legacy memory instructions?
					//implement legacy address calc opcodes. Inflates execution time by one cycle, but it's easier to implement
				}
				break;
			case CPUMOP_RD32://must have separate read instruction for each data size
				{
					//step 1: compute address
					uint32_t address = operation.par0;
					//step 1.1: ensure address is aligned by 4 (TODO: should we just ignore the lowest bit? replaces one if-statement with one mask)
					if(address & 3) {
						//TODO: exception, misaligned read
						continue;
					}
					//step 2: translate address if neccessary
					if(CPU_STATUS&CPU_STATUS_MMUENABLED) {
						bool fault = false;
						address = tlb_translate_daddr(address, &fault, &delay);
						if(fault) {
							//segment invalid, go to software TLB manager
							//clear all stage up to this one
							//disable interrupts, set interrupted flag
							//set interrupt PC
							//start interrupt handler
							//TODO: interrupts
							continue;
						}
					}
					//step 3: check address validity
					if(address >= 8*1024*1024-3) {//unsigned, so no need to check less than zero
						//mem range fault
						//interrupt and clear pipeline
						//TODO: interrupts
						continue;
					}
					//step 4: make sure data is loaded in cache
					load_dcache(address,&delay,false);
					//step 5: read from memory
					CPU_REGISTERS[operation.res].r32 = *(uint32_t*)&CPU_MEMORY[address];
					//how do we do legacy memory instructions?
					//implement legacy address calc opcodes. Inflates execution time by one cycle, but it's easier to implement
				}
				break;
			case CPUMOP_WR8://must have separate write instruction for each data size
				{
					//step 1: compute address
					uint32_t address = operation.par0;
					//step 2: translate address if neccessary
					if(CPU_STATUS&CPU_STATUS_MMUENABLED) {
						bool fault = false;
						address = tlb_translate_daddr(address, &fault, &delay);
						if(fault) {
							//segment invalid, go to software TLB manager
							//clear all stage up to this one
							//disable interrupts, set interrupted flag
							//set interrupt PC
							//start interrupt handler
							//TODO: interrupts
							continue;
						}
					}
					//step 3: check address validity
					if(address >= 8*1024*1024) {
						//mem range fault
						//TODO: interrupts
						continue;
					}
					//step 4: make sure data is loaded in cache
					load_dcache(address,&delay,false);

					printf("writing %08x to address %08x", CPU_REGISTERS[operation.res].r8, address);
					//step 5: write to memory
					CPU_MEMORY[address] = CPU_REGISTERS[operation.res].r8;
					//how do we do legacy memory instructions?
					//implement legacy address calc opcodes. Inflates execution time by one cycle, but it's easier to implement
				}
			case CPUMOP_WR16://must have separate write instruction for each data size
				{
					//step 1: compute address
					uint32_t address = operation.par0;
					//step 2: translate address if neccessary
					if(CPU_STATUS&CPU_STATUS_MMUENABLED) {
						bool fault = false;
						address = tlb_translate_daddr(address, &fault, &delay);
						if(fault) {
							//segment invalid, go to software TLB manager
							//clear all stage up to this one
							//disable interrupts, set interrupted flag
							//set interrupt PC
							//start interrupt handler
							//TODO: interrupts
							continue;
						}
					}
					//step 3: check address validity
					if(address >= 8*1024*1024) {
						//mem range fault
						//TODO: interrupts
						continue;
					}
					//step 4: make sure data is loaded in cache
					load_dcache(address,&delay,false);

					printf("writing %08x to address %08x", CPU_REGISTERS[operation.res].r16, address);
					//step 5: write to memory
					*(uint16_t*)&CPU_MEMORY[address] = CPU_REGISTERS[operation.res].r16;
					//how do we do legacy memory instructions?
					//implement legacy address calc opcodes. Inflates execution time by one cycle, but it's easier to implement

				}
			case CPUMOP_WR32://must have separate write instruction for each data size
				{
					//step 1: compute address
					uint32_t address = operation.par0;
					//step 2: translate address if neccessary
					if(CPU_STATUS&CPU_STATUS_MMUENABLED) {
						bool fault = false;
						address = tlb_translate_daddr(address, &fault, &delay);
						if(fault) {
							//segment invalid, go to software TLB manager
							//clear all stage up to this one
							//disable interrupts, set interrupted flag
							//set interrupt PC
							//start interrupt handler
							//TODO: interrupts
							continue;
						}
					}
					//step 3: check address validity
					if(address >= 8*1024*1024-3) {
						//mem range fault
						//TODO: interrupts
						continue;
					}
					//step 4: make sure data is loaded in cache
					load_dcache(address,&delay,false);

					printf("writing %08x to address %08x", CPU_REGISTERS[operation.res].r32, address);
					//step 5: write to memory
					*(uint32_t*)&CPU_MEMORY[address] = CPU_REGISTERS[operation.res].r32;
					//how do we do legacy memory instructions?
					//implement legacy address calc opcodes. Inflates execution time by one cycle, but it's easier to implement
				}
			case CPUMOP_NOP:
				{
					//do nothing
				}
				//create more microops as necessary
			default:
				//no such operation exception: print some stuff to a log and freak the fuck out
				CPU_RUNNING = false;
				break;
		}
		execute_delay = execute_delay >= delay ? execute_delay : delay;
	}
}

unsigned long long cpu_run() {
	PC = 0x200;
	CPU_RUNNING = true;
	int i = 20;
	//pipeline stages are executed in reverse, so that later stages can move out of the way before earlier ones are updated
	//writeback()//not used since I don't think this actually changes anything if emulated. merged with execute
	unsigned long long cycles = 0;
	while(i--) {
		printf("********************************************************\n");
		printf("running cycle %llu\n",cycles);
		printf("********************************************************\n");
		execute();//run ALU operations, perform branches
		opfetch();//perform early memory access for operands to memory
		decode_inst();//decode instruction buffer and get parameters
		fetch_inst();//get instruction data from memory
		--cpu_mem_busy_cycles;
		++cycles;
	}
	for(i = 0; i < 16; ++i) {
		printf("register %i: %08x\n",i,CPU_REGISTERS[i].r32);
	}

	return cycles;//we are currently running in single-cycle mode
}
