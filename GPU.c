#include "GPU.h"
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <math.h>
#include <stdlib.h>
#include <stdbool.h>

//NOTE: the memory timings uses the μPD4811650 SGRAM at 100MHz as a reference


#define REGCOUNT 32//should we get 32?
#define MEMSIZE 1024*1024*4
#define L1CACHE_ADDR_MASK 0xffffffe0
//#define L1CACHE_ENTRY_MASK 0x00000000 //with two way assoc, and 2 entries entry mask is zero, and unneeded
#define L1CACHE_ENTRIES 2
#define L2CACHE_ADDR_MASK  0xffff0fc0 //we offset cache lines 4096 bytes apart, even though they are only 64 bits wide. This makes sense in a 2d grid.
#define L2CACHE_ENTRY_MASK 0x0000f000
#define L2CACHE_ENTRY_SHIFT 12
#define L2CACHE_ENTRIES 32
//for dram
#define ROW_MASK  0xffffe800	//ignore bit selecting bank when choosing row
#define BANK_MASK 0x80001000	//switch banks on multiples of 4096, also select upper bit for quick detection of invalid addresses (bank swap on invalid)
//memory timing stuff
#define GPU_CL 3
#define GPU_TRCD 3
#define GPU_TRP 3
#define GPU_TRAS (GPU_TRCD+GPU_CL)//TRCD+CL = 5
#define GPU_TRDL 1//data in to row precharge
#define GPU_TCDL 1//data in to new col address
//#define GPU_TBDL 1//data in to burst abort. unused and assumed to be equal to TCDL
//internal GPU memory
GPU_REGISTER gpu_registers[REGCOUNT*GPU_CORE_COUNT] __attribute__((aligned(16)));
uint8_t memory[1024*1024*4];//4 megabyte memory
uint8_t gpu_command_buffer[GPU_COMMAND_BUFFER_SIZE];
uint32_t gpu_l1_cache[L1CACHE_ENTRIES*GPU_CORE_COUNT];
uint32_t gpu_l1_entry_select = 0;
uint32_t gpu_l2_cache[L2CACHE_ENTRIES];
uint32_t gpu_l2_entry_select = 0;
uint32_t gpu_cache_read[GPU_CORE_COUNT*2];//used to determine cycle count for memory reads

//signals and etc
volatile uint32_t GPU_EXIT_CODE;
volatile uint32_t GPU_EXIT_PC;
volatile uint32_t GPU_EXIT_MESSAGE;

//video output, expected to be HDMI
#define VOUT_LINES_TOTAL 1125
#define VOUT_LINES_DRAWN 1080
#define VOUT_CYCLES_PER_LINE 44445 //50000000 / 1125 rounded up
uint32_t vout_line_counter = 0;//current line
unsigned long long vout_next_line_at_cycle = 0;
uint32_t vout_data_size = 4;//data per pixel in bytes
uint32_t vout_fraction = 3;//number of times each pixel and line is drawn, minimum 2
uint32_t vout_data_per_line = 4*1080/3;//vout_data_size*1080/vout_fraction, rounded up

//needed data structures
typedef union {
	uint32_t i;
	float f;
} bitcast;

typedef struct __es {
	struct __es* next;
	uint32_t PC;
	int count;
	uint8_t index[32];
} execSpan;

typedef float v4f __attribute__ ((vector_size (16)));
typedef int32_t v4si __attribute__ ((vector_size (16)));
typedef uint32_t v4ui __attribute__ ((vector_size (16)));

//initialisation
void gpu_init() {
	memset(memory, 0, MEMSIZE);
	memset(gpu_registers, 0, REGCOUNT*GPU_CORE_COUNT*sizeof(uint32_t));
	memset(gpu_l1_cache, -1, L1CACHE_ENTRIES*GPU_CORE_COUNT*sizeof(uint32_t));
	memset(gpu_l2_cache, -1, L2CACHE_ENTRIES*sizeof(uint32_t));
}
uint32_t gpu_parameters[32];
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
			currentRegisters[r].i = params[i];
		}
	}
}

//maintain which threads are active or not
int GPU_ACTIVE_THREAD_INDEXES[GPU_CORE_COUNT] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
int GPU_ACTIVE_THREADS = GPU_CORE_COUNT;
execSpan *NEXT_EXEC_SPAN = 0;

void insertExecSpan(execSpan *span) {
	if(NEXT_EXEC_SPAN == 0 || NEXT_EXEC_SPAN->PC > span->PC) {
		span->next = NEXT_EXEC_SPAN;
		NEXT_EXEC_SPAN = span;
	} else {
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
			next = next->next;
		}
		if(next->PC == span->PC) {
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
				next->index[next->count++] = span->index[--span->count];
			}
			free(span);
		} else {
			span->next = next->next;
			next->next = span;
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
	}
	execSpan *tmp = NEXT_EXEC_SPAN;
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
	free(tmp);
}

execSpan* getEmptySpan(uint32_t PC) {
	execSpan *ret = (execSpan*)malloc(sizeof(execSpan));
	ret->PC = PC;
	ret->next = 0;
	ret->count = 0;
	return ret;
}

uint8_t *gpu_get_mem() {
    return memory;
}

unsigned long long mem_busy_until = 0;

__attribute__((optimize("unroll-loops")))
unsigned long long gpu_run() {
	unsigned long long cycles = 0;
	mem_busy_until = 0;
	uint32_t numThreadsRunning = GPU_ACTIVE_THREADS;
	//uint32_t numThreadsActive  = GPU_ACTIVE_THREADS;//TODO: change all references to GPU_ACTIVE_THREADS in this function to numThreadsActive to ensure that there's no wierd interference from multithreading etc.
	uint32_t currentPC = 0;
	if(currentPC == 0x0000ffff) {
		numThreadsRunning = 0;
		GPU_EXIT_CODE = GPU_EXIT_CODE_EXIT;
		GPU_EXIT_PC = currentPC;
		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOOP;
	}

	while(numThreadsRunning) {
		//abort execution if address exceeds some amount
		if(currentPC >= GPU_COMMAND_BUFFER_SIZE) {
			numThreadsRunning = 0;
			GPU_EXIT_CODE = GPU_EXIT_CODE_ABORT;
			GPU_EXIT_PC = currentPC;
			GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_CODEBOUNDS;
			break;
		}

		//send data for video out
		if(cycles >= vout_next_line_at_cycle) {
			if(mem_busy_until > cycles) {//TODO: this isn't accurate enough. Figure out what happens when read line in memory operation
										//		problem: we might not have enough cycles to let the previous memory operation terminate.
										//				 We might not be able to terminate last operation (precharge)
				mem_busy_until += GPU_TRCD+GPU_TRP+GPU_CL;//close and open bank
			}
			if(vout_line_counter < 1080 && (vout_line_counter % vout_fraction) == 0) {//TODO: can we optimize away this modulo operation?
				mem_busy_until += (GPU_TRCD+GPU_CL+GPU_TRP)*2+((vout_data_per_line+63)/64);//approximate time to read one line
			}
			//TODO: write to output data here
			vout_next_line_at_cycle += VOUT_CYCLES_PER_LINE;
			vout_line_counter += 1;
			if(vout_line_counter == VOUT_LINES_TOTAL) {
				vout_line_counter = 0;
			}
		}

		//memory refresh


		//sleep(1);
		//printf("%i\n",currentPC);
		if(NEXT_EXEC_SPAN && NEXT_EXEC_SPAN->PC == currentPC) {
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
	      		}
				break;
			case GPUOP_SUB:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i - C[indx].i;
	      		}
				break;
			case GPUOP_MUL16:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
	      		}
				break;
			case GPUOP_SL:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i << C[indx].i;
	      		}
				break;
			case GPUOP_SR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i >> C[indx].i;
	      		}
				break;
			case GPUOP_AND:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i & C[indx].i;
	      		}
				break;
			case GPUOP_OR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i | C[indx].i;
	      		}
				break;
			case GPUOP_XOR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i ^ C[indx].i;
	      		}
				break;
			case GPUOP_CMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i < C[indx].i ? -1 : (B[indx].i > C[indx].i ? 1 : 0);
	      		}
				break;
			case GPUOP_END:
				cycles += 1+numThreadsRunning-GPU_ACTIVE_THREADS;
				if(NEXT_EXEC_SPAN == 0) {
					GPU_EXIT_CODE = GPU_EXIT_CODE_EXIT;
					GPU_EXIT_PC = currentPC;
					GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_ENDOP;
					numThreadsRunning = 0;
				} else {
					numThreadsRunning -= GPU_ACTIVE_THREADS;
					GPU_ACTIVE_THREADS = 0;
					currentPC = NEXT_EXEC_SPAN->PC;
					mergeNextSpan();
				}
				break;
			case GPUOP_WR8:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
	      		}
				break;
			case GPUOP_WR16:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD8:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD16:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_MOVIL:
				{
					cycles += 1;
					uint32_t tmp = ((inst & 0xffff0000)>>16);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = (B[indx].i & 0xffff0000)+tmp;
					}
				}
				break;
			case GPUOP_MOVIH:
				{
					cycles += 1;
					uint32_t tmp = (inst&0xffff0000);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = tmp;
					}
				}
				break;
			case GPUOP_SEL:
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = indx;
				}
				break;
			case GPUOP_CEND:
				cycles += 1;//TODO
				break;
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
						A[i].i = (B[i].i >> shift) & mask;
					}
				}
				break;
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
				}
		    	break;
			case GPUOP_ITOF://int to float
				cycles += 3;//3/1 on pentium
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = (float)B[indx].i;
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
				}
				break;
			case GPUOP_FSUB://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f - C[indx].f;
	      		}
	      		break;
			case GPUOP_FMUL://float mul
				{
					int i = 0;
					cycles += 1;
					v4f * restrict Av = (v4f*)A;
					v4f * restrict Bv = (v4f*)B;
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
	      			}
				}
	      		break;
			case GPUOP_FSUB1://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = 1.0f-B[indx].f;
	      		}
	      		break;
			case GPUOP_FMAX:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FMIN:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FCMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].f < C[indx].f ? -1 : (B[indx].f > C[indx].f ? 1 : 0);
				}
				break;
			case GPUOP_BR://branch
				cycles += 2+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						if(A[indx].i != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
						--GPU_ACTIVE_THREADS;
	        		}
					insertExecSpan(span);
				}
				GPU_ACTIVE_THREADS = 0;
				currentPC = NEXT_EXEC_SPAN->PC;
				mergeNextSpan();
				break;
			case GPUOP_BRZ://branch on zero
				cycles += 3+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
						if(tmpPC != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
						--GPU_ACTIVE_THREADS;
	              	}
					insertExecSpan(span);
				}
				GPU_ACTIVE_THREADS = 0;
				currentPC = NEXT_EXEC_SPAN->PC;
				mergeNextSpan();
				break;
			case GPUOP_WR32:
				{
					if (cycles < mem_busy_until) {
						cycles = mem_busy_until;
					}
					uint32_t tmpCycles = 0;
					uint32_t cyclesAccum = 0;
					uint32_t lastAddr = -1;
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
						if(first) {
							first = false;
							tmpCycles += GPU_TRCD+1;
						} else if(((addr^lastAddr) & 0xfffffff8) == lastAddr) {//both were merged into one write
							if(merged) {
								merged = false;
								tmpCycles += 1;
							} else {
								merged = true;
							}
						} else if((addr ^ lastAddr) & BANK_MASK) {
							merged = false;
							if(tmpCycles < (GPU_TRAS-1)) tmpCycles = GPU_TRAS-1;//we load the row in the other bank first, so we can delay precharge one cycle.
							cyclesAccum += tmpCycles;
							tmpCycles = GPU_TRCD+1;
						} else if(((addr ^ lastAddr) & ROW_MASK) != 0) {
							merged = false;
							if(tmpCycles < GPU_TRAS) tmpCycles = GPU_TRAS;
							cyclesAccum += tmpCycles+GPU_TRP;
							tmpCycles = GPU_TRCD+1;//TRCD and TRAS overlap
						} else {
							merged = false;
							tmpCycles += 1;
						}
						lastAddr = addr;

						*(uint32_t*)(memory+addr) = A[indx].i;
		      		}
					mem_busy_until = ((tmpCycles+cyclesAccum+1+GPU_TRP)>>1)+cycles+1;
					cycles += 8+1;
				}
				break;
			case GPUOP_RD32:
				{
				uint32_t tmpCycles = 6;//3*2, minimum time for instruction
				uint32_t tmp = 0;
				uint32_t lastAddr = -1;
				bool lastCache = false;//did the last memory read come from L2 cache
				bool lastMem = false;//did the last memory read come from memory
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
					if(gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK) && gpu_l1_cache[(indx<<1)+1] != (addr & L1CACHE_ADDR_MASK)) {
						gpu_l1_cache[(indx<<1)+((gpu_l1_entry_select&(1<<indx))>>indx)] = addr & L1CACHE_ADDR_MASK;
						gpu_l1_entry_select^=(1<<indx);
						//if we have already streamed this address somewhere, skip cycle addition
						for(int i = 0; i < tmp; ++i) {
							if(gpu_cache_read[i] == (addr & L1CACHE_ADDR_MASK)) {
								goto noadd_rd32;
							}
						}
						gpu_cache_read[tmp++] =  addr & L1CACHE_ADDR_MASK;	//we should mask the next cache line also
																			//because L1 is 8 words long, but L2 is 16 words long
																			//so if anyone else requested the other L1 line on the L2 line, they also get the data
																			//but only if we stream the whole L2 entry into memory, otherwise we only send the requested data, since the overhead is very low
																			//check l2 cache, if there is an entry, add 4 cycles
						if(	(gpu_l2_cache[(addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1)] != (addr & L2CACHE_ADDR_MASK)) &&
								(gpu_l2_cache[1+((addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1))] != (addr & L2CACHE_ADDR_MASK)) ) {
							//update second data cache in L1, since we are streaming the whole L2 line at this point
							gpu_cache_read[tmp++] =  (addr^(8*4)) & L1CACHE_ADDR_MASK;
							//update l2 cache entry
							uint32_t L2Entry = ((addr & L2CACHE_ENTRY_MASK)>>L2CACHE_ENTRY_SHIFT);
							gpu_l2_cache[((gpu_l2_entry_select&(1<<L2Entry))>>L2Entry)+(L2Entry<<1)] = (addr & L2CACHE_ADDR_MASK);
							gpu_l2_entry_select ^= 1 << L2Entry;
							//otherwise, add word count + latency + row miss
							//							 8,           3,        8 cycles respectively (3-4-4-7 ram)
							if((cycles + (tmpCycles>>1)) < mem_busy_until) {//TODO: look over this, doesn't seem quite right
								cycles += (mem_busy_until-(tmpCycles>>1))-cycles;//wait for memory controller to be free
								tmpCycles = 0;//already added
							}
							//		ACTION:					DELAY:
							//	first action				TRCD+CL
							//	same row burst				0 //operations masked during previous burst
							//	different row burst			TRCD+CL = 6 //mask row precharge latency with the burst
							//	different bank burst		0 //operations masked during previous burst
							//	L2 to first action			TRCD+CL-3
							//	L2 to same row burst		CL-3 = 0
							//	L2 to different row burst	TRCD+TRP+CL-3 = 6
							//	L2 to different bank burst	TRCD+CL-3 = 3
							//	post read precharge			set mem_busy_until to (cycles*2+TRP+1)>>1
							tmpCycles += 8;
							if((lastMem && ((addr ^ lastAddr) & ROW_MASK) != 0) && !((addr ^ lastAddr) & BANK_MASK)) {
								tmpCycles += GPU_TRCD+GPU_CL;
							} else if(lastCache) {
								if(lastAddr == -1) {
									tmpCycles += GPU_TRCD+GPU_CL-3;//first read from memory
								} else if(((addr ^ lastAddr) & BANK_MASK) != 0) {//different banks
									tmpCycles += GPU_TRCD+GPU_CL-3;
								} else if(((addr ^ lastAddr) & ROW_MASK) != 0) {//different rows, same bank
									tmpCycles += GPU_TRCD+GPU_TRP+GPU_CL-3;
								} else {
									tmpCycles += GPU_CL-3;//read from RAM, same row.
								}
							} else {//first read
								tmpCycles += GPU_TRCD+GPU_CL;
							}
							lastAddr = addr;
							lastMem = true;
							lastCache = false;
						} else {//data in L2 CACHE
							tmpCycles += 4;//4 cycles to bring 8 words from L2 to L1 cache, last 3 cycles used to hide SGRAM delays
							lastCache = true;
							lastMem = false;
						}
					} else {
						//update cache replacement policy
						gpu_l1_entry_select = (gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK)) ? gpu_l1_entry_select&(0xffffffff^(1<<indx)): gpu_l1_entry_select|(1<<indx);
						//expensive and does basically nothing cycle-wise 42.05M cycles without vs 42.03M cycles with in tests
						//however, I think it might have a large impact on patelleted colors; a 4-bit texture with lookup tables might get expensive without this
					}
					noadd_rd32://the goto in the loop above lands here

					//if(i == 0) {
					//	printf("%i = [%i(%i),%i(%i) (%i)] (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,addr,*(uint32_t*)(memory+addr));
					//}
					A[indx].i = *(uint32_t*)(memory+addr);
	      		}
				if(lastAddr != -1) {//memory access during operation
					mem_busy_until = cycles + (tmpCycles+1+GPU_TRP)>>1;//row precharge post-operation
				}
				cycles += (tmpCycles+1)>>1;
				}
				break;
			case GPUOP_TILE:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
					uint32_t outx = tmpx&0x0000000c;
					uint32_t outy = tmpy&0x00000003;

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
	      		}
				break;
			case GPUOP_FMOD:
				cycles += 3;
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = modff(C[indx].f,&B[indx].f);
				}
				break;
	    	default:
	      		numThreadsRunning = 0;
	      		cycles += 4;
				//throw error
				GPU_EXIT_CODE = GPU_EXIT_CODE_ABORT;
				GPU_EXIT_PC = currentPC;
	      		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOSUCHINSTR;
		      	break;
    	}
  	}
  	return cycles;
}
