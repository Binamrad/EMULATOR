#include "CPU.h"
#include <stdbool.h>
#include <stdio.h>

uint8_t CPU_MEM[8*1024*1024];
uint32_t PC = 0x00000200;
unsigned long long CPU_CYCLES = 0;
bool CPU_RUNNING = true;

typedef union{
	uint32_t r32;
	uint16_t r16;
	uint8_t  r8;
} reg;
reg CPU_REGISTERS[16];
float CPU_FREGS[16];

typedef struct {
	reg A, B;
	uint32_t wb;
} params;

//arithmetic params
uint8_t GET_AROP_8_B(uint8_t specifier) {
	uint8_t operand;
	switch(specifier>>5) {
		case 0:
			operand = CPU_MEM[PC+2];
			if(!(specifier & 16)) {
				operand = CPU_REGISTERS[operand&15].r8;
			}
			PC += 3;
			break;
		case 1:
			//8-bit mem read 8 bits r8:AX8
			operand = CPU_MEM[PC+2];
			if(!(specifier & 16)) {
				operand = CPU_REGISTERS[operand&15].r8;
			}
			operand = CPU_MEM[operand+(((uint16_t)CPU_REGISTERS[CPU_REGISTER_AX].r8)<<8)];
			PC += 3;
			break;
		case 2:
			//16 bit mem read 8 bits r16:AX16
			{
				uint16_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r16;
					PC += 3;
				} else {
					addr_tmp = *(uint16_t*)(CPU_MEM+PC+2);
					PC += 4;
				}
				operand = CPU_MEM[addr_tmp+(((uint32_t)CPU_REGISTERS[CPU_REGISTER_AX].r16)<<16)];
			}
			break;
		case 3:
			//16 bit mem read 8 bits r16+AX16
			{
				uint16_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r16;
					PC += 3;
				} else {
					addr_tmp = *(uint16_t*)(CPU_MEM+PC+2);
					PC += 4;
				}
				operand = CPU_MEM[addr_tmp+(uint32_t)CPU_REGISTERS[CPU_REGISTER_AX].r16];
			}
			break;
		case 4:
			//32 bit mem read 8 bits r32
			{
				uint32_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r32;
					PC += 3;
				} else {
					addr_tmp = *(uint32_t*)(CPU_MEM+PC+2);
					PC += 6;
				}
				operand = CPU_MEM[addr_tmp];
			}
			break;
		case 5:
			//32 bit mem read 8 bits r32+AX32
			{
				uint32_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r32;
					PC += 3;
				} else {
					addr_tmp = *(uint32_t*)(CPU_MEM+PC+2);
					PC += 6;
				}
				operand = CPU_MEM[addr_tmp+CPU_REGISTERS[CPU_REGISTER_AX].r32];
			}
			break;
		default://ILLEGAL INSTRUCTION!!!
			break;
	}
	return operand;
}

uint16_t GET_AROP_16_B(uint8_t specifier) {
	uint16_t operand;
	switch(specifier>>5) {
		case 0:
			operand = CPU_MEM[PC+2];
			if(!(specifier & 16)) {
				operand = CPU_REGISTERS[operand&15].r16;
			}
			PC += 3;
			break;
		case 1:
			//8-bit mem read 8 bits r8:AX8
			operand = CPU_MEM[PC+2];
			if(!(specifier & 16)) {
				operand = CPU_REGISTERS[operand&15].r8;
			}
			operand = *(uint16_t*)(CPU_MEM+operand+(((uint16_t)CPU_REGISTERS[CPU_REGISTER_AX].r8)<<8));
			PC += 3;
			break;
		case 2:
			//16 bit mem read 8 bits r16:AX16
			{
				uint16_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r16;
					PC += 3;
				} else {
					addr_tmp = *(uint16_t*)(CPU_MEM+PC+2);
					PC += 4;
				}
				operand = *(uint16_t*)(CPU_MEM+addr_tmp+(((uint32_t)CPU_REGISTERS[CPU_REGISTER_AX].r16)<<16));
			}
			break;
		case 3:
			//16 bit mem read 8 bits r16+AX16
			{
				uint16_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r16;
					PC += 3;
				} else {
					addr_tmp = *(uint16_t*)(CPU_MEM+PC+2);
					PC += 4;
				}
				operand = *(uint16_t*)(CPU_MEM+addr_tmp+(uint32_t)CPU_REGISTERS[CPU_REGISTER_AX].r16);
			}
			break;
		case 4:
			//32 bit mem read 8 bits r32
			{
				uint32_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r32;
					PC += 3;
				} else {
					addr_tmp = *(uint32_t*)(CPU_MEM+PC+2);
					PC += 6;
				}
				operand = *(uint16_t*)(CPU_MEM+addr_tmp);
			}
			break;
		case 5:
			//32 bit mem read 8 bits r32+AX32
			{
				uint32_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r32;
					PC += 3;
				} else {
					addr_tmp = *(uint32_t*)(CPU_MEM+PC+2);
					PC += 6;
				}
				operand = *(uint16_t*)(CPU_MEM+addr_tmp+CPU_REGISTERS[CPU_REGISTER_AX].r32);
			}
			break;
		default://ILLEGAL INSTRUCTION!!!
			break;
	}
	return operand;
}

uint32_t GET_AROP_32_B(uint8_t specifier) {
	uint32_t operand;
	switch(specifier>>5) {
		case 0:
			operand = CPU_MEM[PC+2];
			if(!(specifier & 16)) {
				operand = CPU_REGISTERS[operand&15].r32;
			}
			PC += 3;
			break;
		case 1:
			//8-bit mem read 8 bits r8:AX8
			operand = CPU_MEM[PC+2];
			if(!(specifier & 16)) {
				operand = CPU_REGISTERS[operand&15].r8;
			}
			operand = *(uint32_t*)(CPU_MEM+operand+(((uint16_t)CPU_REGISTERS[CPU_REGISTER_AX].r8)<<8));
			PC += 3;
			break;
		case 2:
			//16 bit mem read 8 bits r16:AX16
			{
				uint16_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r16;
					PC += 3;
				} else {
					addr_tmp = *(uint16_t*)(CPU_MEM+PC+2);
					PC += 4;
				}
				operand = *(uint32_t*)(CPU_MEM+addr_tmp+(((uint32_t)CPU_REGISTERS[CPU_REGISTER_AX].r16)<<16));
			}
			break;
		case 3:
			//16 bit mem read 8 bits r16+AX16
			{
				uint16_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r16;
					PC += 3;
				} else {
					addr_tmp = *(uint16_t*)(CPU_MEM+PC+2);
					PC += 4;
				}
				operand = *(uint32_t*)(CPU_MEM+addr_tmp+(uint32_t)CPU_REGISTERS[CPU_REGISTER_AX].r16);
			}
			break;
		case 4:
			//32 bit mem read 8 bits r32
			{
				uint32_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r32;
					PC += 3;
				} else {
					addr_tmp = *(uint32_t*)(CPU_MEM+PC+2);
					PC += 6;
				}
				operand = *(uint32_t*)(CPU_MEM+addr_tmp);
			}
			break;
		case 5:
			//32 bit mem read 8 bits r32+AX32
			{
				uint32_t addr_tmp;
				if(!(specifier & 16)) {
					addr_tmp = CPU_REGISTERS[CPU_MEM[PC+2]&15].r32;
					PC += 3;
				} else {
					addr_tmp = *(uint32_t*)(CPU_MEM+PC+2);
					PC += 6;
				}
				operand = *(uint32_t*)(CPU_MEM+addr_tmp+CPU_REGISTERS[CPU_REGISTER_AX].r32);
			}
			break;
		default://ILLEGAL INSTRUCTION!!!
			CPU_RUNNING = false;
			break;
	}
	return operand;
}



unsigned long long cpu_run() {
	unsigned long long instCount = 0;
	PC = 0x200;
	CPU_RUNNING = true;
	while(CPU_RUNNING) {
		//do PC bounds check for byte 0
		//TODO
		uint8_t firstbyte = CPU_MEM[PC];
		//update pipeline flags, where appropriate
		switch(firstbyte) {
			//case CPUOP_INVALID:
			//	break;
			case CPUOP_HALT:
				CPU_RUNNING = false;
				break;
			case CPUOP_NOP:
				CPU_RUNNING = false;
				break;
			case CPUOP_INT:
				CPU_RUNNING = false;
				break;
			case CPUOP_ADD|L8:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint16_t res = CPU_REGISTERS[nextByte&15].r8 + (uint16_t)GET_AROP_8_B(nextByte);
					CPU_REGISTERS[nextByte&15].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r8 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_ADD|L16:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint32_t res = CPU_REGISTERS[nextByte&15].r16 + (uint32_t)GET_AROP_16_B(nextByte);
					CPU_REGISTERS[nextByte&15].r16 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r16 = (uint16_t)(res>>16);
				}
				break;
			case CPUOP_ADD|L32:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint64_t res = CPU_REGISTERS[nextByte&15].r32 + (uint64_t)GET_AROP_32_B(nextByte);
					CPU_REGISTERS[nextByte&15].r32 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r32 = (uint32_t)(res>>32);
				}
				break;
			case CPUOP_SUB|L8:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint16_t res = CPU_REGISTERS[nextByte&15].r8 - (uint16_t)GET_AROP_8_B(nextByte);
					CPU_REGISTERS[nextByte&15].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r8 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_SUB|L16:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint32_t res = CPU_REGISTERS[nextByte&15].r16 - (uint32_t)GET_AROP_16_B(nextByte);
					CPU_REGISTERS[nextByte&15].r16 = (uint16_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r16 = (uint16_t)(res>>16);
				}
				break;
			case CPUOP_SUB|L32:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint64_t res = CPU_REGISTERS[nextByte&15].r32 - (uint64_t)GET_AROP_32_B(nextByte);
					CPU_REGISTERS[nextByte&15].r32 = (uint32_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r32 = (uint32_t)(res>>32);
				}
				break;
			case CPUOP_MUL|L8:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint16_t res = CPU_REGISTERS[nextByte&15].r8 * (uint16_t)GET_AROP_8_B(nextByte);
					CPU_REGISTERS[nextByte&15].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r8 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_MUL|L16:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint32_t res = CPU_REGISTERS[nextByte&15].r16 * (uint32_t)GET_AROP_16_B(nextByte);
					CPU_REGISTERS[nextByte&15].r16 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r16 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_MUL|L32:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint64_t res = CPU_REGISTERS[nextByte&15].r32 * (uint64_t)GET_AROP_32_B(nextByte);
					CPU_REGISTERS[nextByte&15].r32 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r32 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_DIV|L8:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint8_t rightOp = GET_AROP_8_B(nextByte);
					CPU_REGISTERS[nextByte&15].r8 = CPU_REGISTERS[nextByte&15].r8 / rightOp;
					CPU_REGISTERS[CPU_REGISTER_AO].r8 = CPU_REGISTERS[nextByte&15].r8 % rightOp;
				}
				break;
			case CPUOP_DIV|L16:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint16_t rightOp = GET_AROP_16_B(nextByte);
					CPU_REGISTERS[nextByte&15].r16 = CPU_REGISTERS[nextByte&15].r16 / rightOp;
					CPU_REGISTERS[CPU_REGISTER_AO].r16 = CPU_REGISTERS[nextByte&15].r16 % rightOp;
				}
				break;
			case CPUOP_DIV|L32:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint32_t rightOp = GET_AROP_32_B(nextByte);
					CPU_REGISTERS[nextByte&15].r32 = CPU_REGISTERS[nextByte&15].r32 / rightOp;
					CPU_REGISTERS[CPU_REGISTER_AO].r32 = CPU_REGISTERS[nextByte&15].r32 % rightOp;
				}
				break;
			case CPUOP_SDIV|L8:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					int8_t rightOp = GET_AROP_8_B(nextByte);
					CPU_REGISTERS[nextByte&15].r8 = ((int8_t)CPU_REGISTERS[nextByte&15].r8) / rightOp;
					CPU_REGISTERS[CPU_REGISTER_AO].r8 = ((int8_t)CPU_REGISTERS[nextByte&15].r8) % rightOp;
				}
				break;
			case CPUOP_SDIV|L16:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					int16_t rightOp = GET_AROP_16_B(nextByte);
					CPU_REGISTERS[nextByte&15].r16 = ((int16_t)CPU_REGISTERS[nextByte&15].r16) / rightOp;
					CPU_REGISTERS[CPU_REGISTER_AO].r16 = ((int16_t)CPU_REGISTERS[nextByte&15].r16) % rightOp;
				}
				break;
			case CPUOP_SDIV|L32:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					int32_t rightOp = GET_AROP_32_B(nextByte);
					CPU_REGISTERS[nextByte&15].r32 = ((int32_t)CPU_REGISTERS[nextByte&15].r32) / rightOp;
					CPU_REGISTERS[CPU_REGISTER_AO].r32 = ((int32_t)CPU_REGISTERS[nextByte&15].r32) % rightOp;
				}
				break;
			case CPUOP_MOV|L8:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_REGISTERS[nextByte&15].r8 = GET_AROP_8_B(nextByte);
				}
				break;
			case CPUOP_MOV|L16:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_REGISTERS[nextByte&15].r16 = GET_AROP_16_B(nextByte);
				}
				break;
			case CPUOP_MOV|L32:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_REGISTERS[nextByte&15].r32 = GET_AROP_32_B(nextByte);
				}
				break;
			case CPUOP_SHR|L8:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint8_t res = CPU_REGISTERS[nextByte&15].r8 >> GET_AROP_8_B(nextByte);
					CPU_REGISTERS[nextByte&15].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r8 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_SHR|L16:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint16_t res = CPU_REGISTERS[nextByte&15].r16 >> GET_AROP_16_B(nextByte);
					CPU_REGISTERS[nextByte&15].r16 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r16 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_SHR|L32:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint32_t res = CPU_REGISTERS[nextByte&15].r32 >> GET_AROP_32_B(nextByte);
					CPU_REGISTERS[nextByte&15].r32 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r32 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_SSHR|L8:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint16_t res = ((int8_t)CPU_REGISTERS[nextByte&15].r8) >> (int8_t)GET_AROP_8_B(nextByte);
					CPU_REGISTERS[nextByte&15].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r8 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_SSHR|L16:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint32_t res = ((int16_t)CPU_REGISTERS[nextByte&15].r16) >> (int16_t)GET_AROP_16_B(nextByte);
					CPU_REGISTERS[nextByte&15].r16 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r16 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_SSHR|L32:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint64_t res = ((int32_t)CPU_REGISTERS[nextByte&15].r32) >> (int32_t)GET_AROP_32_B(nextByte);
					CPU_REGISTERS[nextByte&15].r32 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r32 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_SHL|L8:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint16_t res = ((uint16_t)CPU_REGISTERS[nextByte&15].r8) << GET_AROP_8_B(nextByte);
					CPU_REGISTERS[nextByte&15].r8 = (uint8_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r8 = (uint8_t)(res>>8);
				}
				break;
			case CPUOP_SHL|L16:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint32_t res = ((uint32_t)CPU_REGISTERS[nextByte&15].r16) << GET_AROP_16_B(nextByte);
					CPU_REGISTERS[nextByte&15].r16 = (uint16_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r16 = (uint16_t)(res>>16);
				}
				break;
			case CPUOP_SHL|L32:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					uint64_t res = ((uint64_t)CPU_REGISTERS[nextByte&15].r32) << GET_AROP_32_B(nextByte);
					CPU_REGISTERS[nextByte&15].r32 = (uint32_t)res;
					CPU_REGISTERS[CPU_REGISTER_AO].r32 = (uint32_t)(res>>32);
				}
				break;
			case CPUOP_ROL|L8:
				{
				}
				break;
			case CPUOP_ROL|L16:
				{
				}
				break;
			case CPUOP_ROL|L32:
				{
				}
				break;
			case CPUOP_ROR|L8:
				{
				}
				break;
			case CPUOP_ROR|L16:
				{
				}
				break;
			case CPUOP_ROR|L32:
				{
				}
				break;
			case CPUOP_SPBC|L8:
				{
				}
				break;
			case CPUOP_SPBC|L16:
				{
				}
				break;
			case CPUOP_SPBC|L32:
				{
				}
				break;
			case CPUOP_SWBP|L8:
				{
				}
				break;
			case CPUOP_SWBP|L16:
				{
				}
				break;
			case CPUOP_SWBP|L32:
				{
				}
				break;
			case CPUOP_AND|L8:
				{
				}
				break;
			case CPUOP_AND|L16:
				{
				}
				break;
			case CPUOP_AND|L32:
				{
				}
				break;
			case CPUOP_OR|L8:
				{
				}
				break;
			case CPUOP_OR|L16:
				{
				}
				break;
			case CPUOP_OR|L32:
				{
				}
				break;
			case CPUOP_XOR|L8:
				{
				}
				break;
			case CPUOP_XOR|L16:
				{
				}
				break;
			case CPUOP_XOR|L32:
				{
				}
				break;
			case CPUOP_FFS|L8:
				{
				}
				break;
			case CPUOP_FFS|L16:
				{
				}
				break;
			case CPUOP_FFS|L32:
				{
				}
				break;
			case CPUOP_FFZ|L8:
				{
				}
				break;
			case CPUOP_FFZ|L16:
				{
				}
				break;
			case CPUOP_FFZ|L32:
				{
				}
				break;
			case CPUOP_CLZ|L8:
				{
				}
				break;
			case CPUOP_CLZ|L16:
				{
				}
				break;
			case CPUOP_CLZ|L32:
				{
				}
				break;
			case CPUOP_SXT|L8:
				{
				}
				break;
			case CPUOP_SXT|L16:
				{
				}
				break;
			case CPUOP_SXT|L32:
				{
				}
				break;
			case CPUOP_ADDC|L8:
				{
				}
				break;
			case CPUOP_ADDC|L16:
				{
				}
				break;
			case CPUOP_ADDC|L32:
				{
				}
				break;
			case CPUOP_SUBC|L8:
				{
				}
				break;
			case CPUOP_SUBC|L16:
				{
				}
				break;
			case CPUOP_SUBC|L32:
				{
				}
				break;
			case CPUOP_LD|L8:
				{
				}
				break;
			case CPUOP_LD|L16:
				{
				}
				break;
			case CPUOP_LD|L32:
				{
					//what does this instruction need to do?
					//use standard instruction format, get address on right,
					//do we need to use indirect+const?
				}
				break;
			case CPUOP_STR|L8:
				{
				}
				break;
			case CPUOP_STR|L16:
				{
				}
				break;
			case CPUOP_STR|L32:
				{
					//store 32 bits of data, but use the AROP_B operand to do it
				}
				break;
			case CPUOP_ST|L8:
				{
				}
				break;
			case CPUOP_ST|L16:
				{
				}
				break;
			case CPUOP_ST|L32://store 32 bits of data
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					int sreg = nextByte&15;
					nextByte >>= 4;
					PC++;
					switch(nextByte) {//Oh god...
						case 0://L8-offset
							{
								uint8_t nb = CPU_MEM[PC+1];
								uint16_t rsp = GET_AROP_8_B(nb);
								uint16_t offset = CPU_REGISTER[nb&15].r8;
								*(uint32_t*)CPU_MEM[rsp+(offset<<8)] = CPU_REGISTERS[sreg].r32;
							}
							break;
						case 1://L16-offset shift
							{
								uint8_t nb = CPU_MEM[PC+1];
								uint32_t rsp = GET_AROP_16_B(nb);
								uint32_t offset = CPU_REGISTER[nb&15].r16;
								*(uint32_t*)CPU_MEM[rsp+(offset<<16)] = CPU_REGISTERS[sreg].r32;
							}
							break;
						case 2://L16-offset add
							{
								uint8_t nb = CPU_MEM[PC+1];
								uint16_t rsp = GET_AROP_16_B(nb);
								uint16_t offset = CPU_REGISTER[nb&15].r16;
								*(uint32_t*)CPU_MEM[rsp+offset] = CPU_REGISTERS[sreg].r32;
							}
							break;
						case 3://L16-no offset
							{
								uint8_t nb = CPU_MEM[PC+1];
								uint16_t rsp = GET_AROP_16_B(nb);
								*(uint32_t*)CPU_MEM[rsp] = CPU_REGISTERS[sreg].r32;
							}
							break;
						case 4://L32-no offset
							{
								uint8_t nb = CPU_MEM[PC+1];
								uint32_t rsp = GET_AROP_32_B(nb);
								*(uint32_t*)CPU_MEM[rsp] = CPU_REGISTERS[sreg].r32;
							}
							break;
						case 5://L32-offset
							{
								uint8_t nb = CPU_MEM[PC+1];
								uint32_t rsp = GET_AROP_32_B(nb);
								uint32_t offset = CPU_REGISTER[nb&15].r32;
								*(uint32_t*)CPU_MEM[rsp+offset] = CPU_REGISTERS[sreg].r32;
							}
							break;
						default:
							break;//invalid instruction
					}
				}
				break;
			//--------------------------------------------------------------------------------------------------
			//float insts
			case CPUOP_FLD:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					union {float a; uint32_t b;} convert;
					convert.b = CPU_REGISTERS[nextByte>>4].r32;
					CPU_FREGS[nextByte&15] = convert.a;
				}
				break;
			case CPUOP_FST:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					union {float a; uint32_t b;} convert;
					convert.a = CPU_FREGS[nextByte&15];
					CPU_REGISTERS[nextByte>>4].r32 = convert.b;
				}
				break;
			case CPUOP_FADD:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_FREGS[nextByte&15] = CPU_FREGS[nextByte&15]+CPU_FREGS[nextByte>>4];
				}
				break;
			case CPUOP_FSUB:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_FREGS[nextByte&15] = CPU_FREGS[nextByte&15]-CPU_FREGS[nextByte>>4];
				}
				break;
			case CPUOP_FMUL:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_FREGS[nextByte&15] = CPU_FREGS[nextByte&15]*CPU_FREGS[nextByte>>4];
				}
				break;
			case CPUOP_FDIV:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_FREGS[nextByte&15] = CPU_FREGS[nextByte&15]/CPU_FREGS[nextByte>>4];
				}
				break;
			/*case CPUOP_FCOS:
				break;
			case CPUOP_FSIN:
				break;*/
			case CPUOP_FNEG:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_FREGS[nextByte&15] = -CPU_FREGS[nextByte>>4];
				}
				break;
			case CPUOP_FCLR:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_FREGS[nextByte&15] = 0.0f;
				}
				break;
			case CPUOP_FTOI:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					union {float a; uint32_t b;} convert;
					convert.a = CPU_FREGS[nextByte&15];
					convert.b = (uint32_t)convert.a;
					CPU_FREGS[nextByte>>4] = convert.a;
				}
				break;
			case CPUOP_FTOF:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					union {float a; uint32_t b;} convert;
					convert.a = CPU_FREGS[nextByte&15];
					convert.a = (float)convert.b;
					CPU_FREGS[nextByte>>4] = convert.a;
				}
				break;
			/*case CPUOP_FSQRT:
				break;
			case CPUOP_FCMP:
				break;*/
			case CPUOP_FABS:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_FREGS[nextByte&15] = CPU_FREGS[nextByte>>4]<0.0f?-CPU_FREGS[nextByte>>4]:CPU_FREGS[nextByte>>4];
					PC+=2;
				}
				break;
			/*case CPUOP_FVMST:
				break;
			case CPUOP_FVMLD:
				break;*/
			case CPUOP_FVADD:
				{
					uint8_t nextByte = CPU_MEM[PC+1];
					CPU_FREGS[(nextByte&3)*4] = CPU_FREGS[(nextByte&3)*4] + CPU_FREGS[((nextByte>>2)&3)*4];
					CPU_FREGS[(nextByte&3)*4+1] = CPU_FREGS[(nextByte&3)*4+1] + CPU_FREGS[((nextByte>>2)&3)*4+1];
					CPU_FREGS[(nextByte&3)*4+2] = CPU_FREGS[(nextByte&3)*4+2] + CPU_FREGS[((nextByte>>2)&3)*4+2];
					CPU_FREGS[(nextByte&3)*4+3] = CPU_FREGS[(nextByte&3)*4+3] + CPU_FREGS[((nextByte>>2)&3)*4+3];
					PC+=2;
				}
				//add 4 floats
				break;
			case CPUOP_FVSUB:
				//subtract 4 floats
				break;
			case CPUOP_FVMUL:
				//multiply 4 floats
				break;
			//----------------------------------------------------------------------------
			//end float insts
			case CPUOP_LEA|L8:
				break;
			case CPUOP_LEA|L16:
				break;
			case CPUOP_LEA|L32:
				{
					//load 32-bit immediate
					//load 2 regs
					//load 1 byte (4-bit shift, register)
					uint8_t b = CPU_MEM[PC+1];
					uint32_t r1 = CPU_REGISTERS[b&15].r32;
					uint32_t r2 = CPU_REGISTERS[b>>4].r32;
					b = CPU_MEM[PC+2];
					r2 = r2 << (b&15);
					uint32_t res = r1+r2+*(uint32_t*)&CPU_MEM[PC+3];
					CPU_REGISTERS[b>>4].r32 = res;
				}
				break;
			case CPUOP_BR|L8:
				{
					uint8_t b0 = CPU_MEM[PC+1];
					uint8_t b1 = CPU_MEM[PC+2];
					//int16_t res =
				}
				break;
			case CPUOP_BR|L16:
				break;
			case CPUOP_BR|L32:
				{
					uint8_t b0 = CPU_MEM[PC+1];
					int32_t dest;
					if(b0&128) {
						dest = *(int32_t*)&CPU_MEM[PC+2];
					} else {
						dest = (int32_t)CPU_REGISTERS[CPU_MEM[PC+2]&15].r32;
					}
					int32_t r = (int32_t)CPU_REGISTERS[b0&15].r32;
					if(b0&64 && r < 0) {
						PC += dest;
					} else if(b0&32 && r > 0) {
						PC += dest;
					} else if(b0&16 && r == 0) {
						PC += dest;
					}
				}
				break;
			case CPUOP_BRA|L8:
				break;
			case CPUOP_BRA|L16:
				break;
			case CPUOP_BRA|L32:
				{
					uint8_t b0 = CPU_MEM[PC+1];
					uint32_t dest;
					if(b0&128) {
						dest = *(uint32_t*)&CPU_MEM[PC+2];
					} else {
						dest = CPU_REGISTERS[CPU_MEM[PC+2]&15].r32;
					}
					int32_t r = (int32_t)CPU_REGISTERS[b0&15].r32;
					if(b0&64 && r < 0) {
						PC = dest;
					} else if(b0&32 && r > 0) {
						PC = dest;
					} else if(b0&16 && r == 0) {
						PC = dest;
					}
					break;
				}
			//----------------------------------------------------------------------------
			//instructions to manage CPU

			default://invalid instruction
				CPU_RUNNING = false;
				break;
		}
		//check if we can do another instruction in the same pipeline slot
		++instCount;
	}
	return instCount;
}
