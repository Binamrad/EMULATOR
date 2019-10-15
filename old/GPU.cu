//This is an experimental implementation of the gpu emulator in CUDA
//it is much slower than the CPU emulator due to a significant overhead of lunching kernels
//Otherwise it works, for what few instructions it can process

extern "C" {
#include "GPU.h"
}

#include <stdint.h>
#include <string.h>

#define CORECOUNT 64
#define REGCOUNT 16//should we get 32?
#define CORESHIFT 4
#define MEMSIZE 1024*1024*8
#define MESSAGE_END 0
#define MESSAGE_NOTHING -1
#define MESSAGE_READ 1
#define MESSAGE_WRITE 2

typedef struct {
    unsigned long long clock;
    uint32_t data;
    uint32_t address;
    int status;
} gpu_message;

uint32_t *dev_registers;
uint8_t memory[1024*1024*8];//8 megabyte memory
uint8_t *dev_memory;//8 megabyte memory

gpu_message *message_area;
gpu_message *dev_message_area;


__device__ int getA(uint32_t inst) {
    inst >>= 20;
    return inst & 15;
}

__device__ int getB(uint32_t inst) {
    inst >>= 16;
    return inst & 15;
}

__device__ int getC(uint32_t inst) {
    return inst & 15;
}

__device__ int getIMM(uint32_t inst) {
    return inst & 0xffff;
}

extern "C"
void gpu_init() {
    memset(memory, 0, MEMSIZE);
    memory[256] = 0xff;
    cudaMalloc(&dev_memory, MEMSIZE*sizeof(uint8_t));
    cudaMalloc(&dev_registers, REGCOUNT*CORECOUNT*sizeof(uint32_t));
    cudaMalloc(&dev_message_area, CORECOUNT*sizeof(gpu_message));
    message_area = (gpu_message*)malloc(CORECOUNT*sizeof(gpu_message));
    cudaMemcpy(dev_memory,memory,MEMSIZE*sizeof(uint8_t),cudaMemcpyHostToDevice);
}

//call after every branch
__device__ uint32_t gpu_getCurrentPC(uint32_t *PC) {
    uint32_t currentPC = 0xffffffff;    
    for(int i = 1; i < CORECOUNT; ++i) {
        if(PC[i] < currentPC) {
            currentPC = PC[i];
        }
    }
    return currentPC;
}

//saturating 31-bit addition of unsigned integers
//top bit of a and b is automatically ignored, no need to manually mask it out
__device__ uint32_t add31(uint32_t a, uint32_t b)
{
  uint32_t c = (a + b)&0x7fffffff;
  if (c<(a&0x7fffffff)) /* Can only happen due to overflow */
    c = 0x7fffffff;
  return c;
}

__device__ uint32_t fixpadd(uint32_t a, uint32_t b) {
    int64_t A = (int32_t)a;
    int64_t B = (int32_t)b;
    int64_t C = A+B;
    int32_t out = 0;
    if(C < 0) {
        out = 0x80000000;
        C = -C;
    }
    if(C > 0x7fffffff) {
        C = 0x7fffffff;
    }
    out += C;
    return out;
}

__global__ static void gpu_run_kernel(unsigned int program_counter_init, gpu_message *message_area, /*uint32_t *registers,*/ uint8_t *memory) {
    //__shared__ uint32_t PC[CORECOUNT];
    int myID = blockIdx.x;
    //PC[myID] = program_counter_init;
    unsigned int myPC = program_counter_init;
    int regOffset = (myID << CORESHIFT);    
    uint32_t currentPC = program_counter_init;
	uint32_t registers[REGCOUNT];
    unsigned long long cycles = 0;
    int running = 1;
    
    while(running) {
        uint32_t inst = *((uint32_t*)(memory+currentPC)); 
        int A = getA(inst);
        int B = getB(inst);
        int C = getC(inst);
        switch(inst) {
            case 0:
                cycles += 1;
                if(myPC == currentPC) {
                    myPC += 4;
                    registers[A+regOffset] = fixpadd(registers[B+regOffset], registers[C+regOffset]);
                }
                break;
            default:
                running = 0;
                cycles += 1;
                message_area[myID].status = 0;
                message_area[myID].clock = cycles;
                break;
        }
        //update PC
        currentPC += 4;
    }
}



extern "C"
unsigned long long gpu_run(unsigned int program_counter_init) {
    gpu_run_kernel<<<1,CORECOUNT>>>(program_counter_init, dev_message_area, /*dev_registers,*/ dev_memory);
    cudaMemcpy(message_area,dev_message_area,CORECOUNT*sizeof(gpu_message),cudaMemcpyDeviceToHost);
    //iterate through the messages, get highest clock count
    unsigned long long highestCount = 0;
    for(int i = 0; i < CORECOUNT; ++i) {
        if(message_area[i].clock > highestCount) highestCount = message_area[i].clock;
    }
    return highestCount;
}




