#include "GPU.h"
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <math.h>

#define CORECOUNT 32
#define REGCOUNT 32//should we get 32?
#define CORESHIFT 6
#define MEMSIZE 1024*1024*8

uint32_t GPU_REGISTERS[REGCOUNT*CORECOUNT];
uint8_t memory[1024*1024*8];//8 megabyte memory
uint32_t PC[CORECOUNT];
volatile uint32_t GPU_EXIT_CODE;
volatile uint32_t GPU_EXIT_PC;
volatile uint32_t GPU_EXIT_MESSAGE;

typedef union {
	int i;
	float f;
} bitcast;



static int getA(uint32_t inst) {
    return (inst>>5) & 31;
}

static int getB(uint32_t inst) {
    return inst & 31;
}

static int getC(uint32_t inst) {
    return (inst >>16) & 31;
}

static int getINST(uint32_t inst) {
    return (inst >> 10) & 63;
}

void gpu_init() {
    memset(memory, 0, 1024*1024*8);
	memset(GPU_REGISTERS, 0, REGCOUNT*CORECOUNT*sizeof(uint32_t));
}
uint8_t *gpu_get_mem() {
    return memory;
}


//call after every branch
static uint32_t gpu_getCurrentPC() {
    uint32_t currentPC = PC[0];    
    for(int i = 1; i < CORECOUNT; ++i) {
        if(PC[i] < currentPC) {
            currentPC = PC[i];
        }
    }
	return currentPC;
}

static uint32_t add16_2(uint32_t a, uint32_t b) {
	uint16_t A1 = a;
	uint16_t A2 = a >> 16;
	A1 += (uint16_t)b;
	A2 += (uint16_t)(b>>16);
	return (((uint32_t)A2)<<16) + A1;
}
static uint32_t sub16_2(uint32_t a, uint32_t b) {
	uint16_t A1 = a;
	uint16_t A2 = a >> 16;
	A1 -= (uint16_t)b;
	A2 -= (uint16_t)(b>>16);
	return (((uint32_t)A2)<<16) + A1;
}
static uint32_t shifl16_2(uint32_t a, uint32_t b) {
	uint16_t A1 = a;
	uint16_t A2 = a >> 16;
	A1 <<= (uint16_t)b;
	A2 <<= (uint16_t)(b>>16);
	return (((uint32_t)A2)<<16) + A1;
}
static uint32_t shifr16_2(uint32_t a, uint32_t b) {
	uint16_t A1 = a;
	uint16_t A2 = a >> 16;
	A1 >>= (uint16_t)b;
	A2 >>= (uint16_t)(b>>16);
	return (((uint32_t)A2)<<16) + A1;
}
static uint32_t less16_2(uint32_t a, uint32_t b) {
	int16_t A1 = (int16_t)a;
	int16_t A2 = (int16_t)(a >> 16);
	int16_t B1 = (int16_t)b;
	int16_t B2 = (int16_t)(b >> 16);
	return (((uint32_t)A2 < B2)<<16) + (A1 < B1);
}
static uint32_t leq16_2(uint32_t a, uint32_t b) {
	int16_t A1 = (int16_t)a;
	int16_t A2 = (int16_t)(a >> 16);
	int16_t B1 = (int16_t)b;
	int16_t B2 = (int16_t)(b >> 16);
	return (((uint32_t)A2 <= B2)<<16) + (A1 <= B1);
}
static uint32_t eq16_2(uint32_t a, uint32_t b) {
	int16_t A1 = (int16_t)a;
	int16_t A2 = (int16_t)(a >> 16);
	int16_t B1 = (int16_t)b;
	int16_t B2 = (int16_t)(b >> 16);
	return (((uint32_t)A2 == B2)<<16) + (A1 == B1);
}
static uint32_t sel16_2(uint32_t a, uint32_t b, int c) {
	return (c&0xffff0000 ? a&0xffff0000:b&0xffff0000)+(c&0x0000ffff ? a&0x0000ffff:b&0x0000ffff);
}


int activeThreadIndexes[CORECOUNT] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
int activeThreads = 32;

__attribute__((optimize("unroll-loops")))
unsigned long long gpu_run(int at) {
	activeThreads = at;
    unsigned long long cycles = 0;
    int running = 1;
    uint32_t currentPC = gpu_getCurrentPC();
	bitcast bc1, bc2;
	if(currentPC == 0x0000ffff) {
		running = 0;
		GPU_EXIT_CODE = GPU_EXIT_CODE_EXIT;
		GPU_EXIT_PC = currentPC;
		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOOP;
	}
	
    while(running) {
		//abort execution if address exceeds some amount
		if(currentPC > 0x0000fffc) {
			running = 0;
			GPU_EXIT_CODE = GPU_EXIT_CODE_ABORT;
			GPU_EXIT_PC = currentPC;
			GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_CODEBOUNDS;		
			break;
		}

		//sleep(1);
		//printf("%i\n",currentPC);

        uint32_t inst = (uint32_t)*((uint16_t*)(memory+currentPC));
		inst += (uint32_t)*((uint16_t*)(memory+currentPC+2))<< 16;
		uint32_t *A  = GPU_REGISTERS+(getA(inst)<<CORESHIFT);
       	uint32_t *B  = GPU_REGISTERS+(getB(inst)<<CORESHIFT);
        uint32_t *C  = GPU_REGISTERS+(getC(inst)<<CORESHIFT);
		uint32_t tmp = getINST(inst);
		switch(tmp) {
			case GPUOP_NOP:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_ADD16:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = add16_2(A[i], B[i]);
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_SUB16:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = sub16_2(A[i], B[i]);
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_SL16:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = shifl16_2(A[i], B[i]);
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_SR16:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = shifr16_2(A[i], B[i]);
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_AND:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = A[i] & B[i];
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_OR:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = A[i] | B[i];
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_XOR:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = A[i] ^ B[i];
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_MOV:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = B[i];
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_LESS16:
				cycles += 2;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = less16_2(A[i], B[i]);
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_LEQ16:
				cycles += 2;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = leq16_2(A[i], B[i]);
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_EQ16:
				cycles += 2;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = eq16_2(A[i], B[i]);
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_END:
				cycles += CORECOUNT+3;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] = 0x0000ffff;
                    }
                }
				//update PC
				currentPC = gpu_getCurrentPC();//call sparingly
				if(currentPC == 0x0000ffff) {
					GPU_EXIT_CODE = GPU_EXIT_CODE_EXIT;
					GPU_EXIT_PC = currentPC;
					GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_ENDOP;
					running = 0;
				}
				break;
			case GPUOP_WR8:
				cycles += 2;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;//TODO: abort execution on bad address
						memory[i] = (uint8_t)A[i];//TODO: figure out how to calculate addresses here
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_WR16:
				cycles += 2;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						memory[i] = (uint8_t)A[i];//TODO: figure out how to calculate addresses here
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_RD8:
				cycles += 2;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = (uint32_t)memory[i];//TODO: figure out how to calculate addresses here
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_RD16:
				cycles += 2;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = (uint32_t)memory[i];//TODO: figure out how to calculate addresses here
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_MOVIL:
				cycles += 1;
				tmp = ((inst & 0xffff0000)>>16);
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = (B[i] & 0xffff0000)+tmp;
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_SEL16:
				cycles += 3;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = sel16_2(A[i], B[i], C[i]);
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_ADD:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = B[i] + C[i];
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_SUB:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = B[i] - C[i];
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_MUL:
				cycles += 10;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = B[i] * C[i];
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			/*case GPUOP_DIV:
				cycles += 46;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = (uint32_t)(((int32_t)B[i]) / (int32_t)C[i]);//Consider: should we store remainder here?
                    }
                }
				//update PC
        		currentPC += 4;
				break;*/
			case GPUOP_SL:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = B[i] << C[i];
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_SR:
				cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = B[i] >> C[i];
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_MOVIH:
				cycles += 1;
				tmp = (inst&0xffff0000);
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = (B[i]&0x0000ffff) + tmp;
                    }
                }
				//update PC
        		currentPC += 4;
				break;
            case GPUOP_FADD://fixp add
                cycles += 1;
                for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						bc1.i = B[i];
						bc2.i = C[i];
						bc1.f = bc1.f + bc2.f;
                        A[i] = bc1.i;
                    }
                }
				/*for(int i = 0; i < activeThreads; ++i) {
					int indx = activeThreadIndexes[i];
					PC[indx] += 4;
					bc1.i = B[indx];
					bc2.i = C[indx];
					bc1.f = bc1.f + bc2.f;
                    A[indx] = bc1.i;
                }*/
				//update PC
        		currentPC += 4;
                break;
			case GPUOP_FSUB://fixp sub
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
                        bc1.i = B[i];
						bc2.i = C[i];
						bc1.f = bc1.f - bc2.f;
                        A[i] = bc1.i;
                    }
                }
				//update PC
        		currentPC += 4;
                break;
			case GPUOP_FMUL://fixp mul
				cycles += 10;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
                        bc1.i = B[i];
						bc2.i = C[i];
						bc1.f = bc1.f * bc2.f;
                        A[i] = bc1.i;
                    }
                }
				//update PC
        		currentPC += 4;
                break;
			case GPUOP_FDIV://fixp div
				cycles += 41;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
                        bc1.i = B[i];
						bc2.i = C[i];
						bc1.f = bc1.f / bc2.f;
                        A[i] = bc1.i;
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_FSQRT://veclen 
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
                        bc1.i = B[i];
						bc1.f = sqrt(bc1.f);
                        A[i] = bc1.i;
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_FCOS:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
                        //TODO: make proper computetion here
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_FSIN:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
                        //TODO: make proper computetion here
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_FLESS:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
                        bc1.i = B[i];
						bc2.i = C[i];
						bc1.i = bc1.f < bc2.f;
                        A[i] = bc1.i;
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_FLEQ:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
                        bc1.i = B[i];
						bc2.i = C[i];
						bc1.i = bc1.f <= bc2.f;
                        A[i] = bc1.i;
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_BR://branch
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
				currentPC = gpu_getCurrentPC();//call sparingly
				break;
			case GPUOP_BRZ://branch on zero
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
				currentPC = gpu_getCurrentPC();//call sparingly
				break;
			case GPUOP_GTS://go to subroutine
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
				currentPC = gpu_getCurrentPC();//call sparingly
				break;
			case GPUOP_RET://return from subroutine
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
				currentPC = gpu_getCurrentPC();//call sparingly
				break;
			case GPUOP_PUSH:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_POP:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_COLADD:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_COLSUB:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_COLMUL:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_COLEXP:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_COLCON:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_WR24:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_WR32:
				cycles += 1;//WAY,WAY too low
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						if(((uint16_t)B[i]) > 1024 || ((uint16_t)C[i]) > 2048) {
							//out of bounds
							GPU_EXIT_CODE = GPU_EXIT_CODE_ABORT;
							GPU_EXIT_PC = currentPC;
							GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_WRITEBOUNDS;
							running = 0;
							break;
						}
						*(uint32_t*)(memory+((B[i]&0x03ff)*4)+((C[i]&0x07ff)*4096)) = A[i];
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_RD24:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_RD32:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_XCHG:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 2;
						A[i] = (B[i] >> 16) + (B[i] << 16);
                    }
                }
				//update PC
        		currentPC += 2;
				break;
			case GPUOP_LESS:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = B[i] < C[i];
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_LEQ:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = B[i] <= C[i];
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_EQ:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = B[i] == C[i];
                    }
                }
				//update PC
        		currentPC += 4;
				break;
			case GPUOP_SEL:
				cycles += 1;
				for(int i = 0; i < CORECOUNT; ++i) {
                    if(PC[i] == currentPC) {
                        PC[i] += 4;
						A[i] = C[i] ? A[i] : B[i];
                    }
                }
				//update PC
        		currentPC += 4;
				break;
            default:
                running = 0;
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
























