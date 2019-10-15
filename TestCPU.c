#include "CPU.h"
#include "stdio.h"

int main(void) {
	uint32_t program_write = 0x200;
	//TODO: before we run this, we need to make sure register dependencies are resolved
	//TODO: make sure memory dependencies are resolved
	//TODO: restrict which instructions can execute in the v-pipe
	//TODO: restrict which instructions can be paired

	//step 0, clear a register
	CPU_MEMORY[program_write++] = 0x4e;
	CPU_MEMORY[program_write++] = 0x22;
	//step 1, set a register to constant 0xcafe0000
	CPU_MEMORY[program_write++] = 0x82;
	CPU_MEMORY[program_write++] = 0x12;
	CPU_MEMORY[program_write++] = 0x23;
	CPU_MEMORY[program_write++] = 0x00;
	CPU_MEMORY[program_write++] = 0x00;
	CPU_MEMORY[program_write++] = 0xfe;
	CPU_MEMORY[program_write++] = 0xca;
	//step 2, clear another register
	CPU_MEMORY[program_write++] = 0x4e;
	CPU_MEMORY[program_write++] = 0x33;
	//step 3, put constant 0x0000babe in it
	CPU_MEMORY[program_write++] = 0x82;
	CPU_MEMORY[program_write++] = 0x13;
	CPU_MEMORY[program_write++] = 0x23;
	CPU_MEMORY[program_write++] = 0xbe;
	CPU_MEMORY[program_write++] = 0xba;
	CPU_MEMORY[program_write++] = 0x00;
	CPU_MEMORY[program_write++] = 0x00;
	//step 4, add registers together
	CPU_MEMORY[program_write++] = 0x0a;
	CPU_MEMORY[program_write++] = 0x32;
	//step 5, write to a known location in memory. 0 will do.
	CPU_MEMORY[program_write++] = 0x4e;//clear register r1
	CPU_MEMORY[program_write++] = 0x11;
	CPU_MEMORY[program_write++] = 0x82;
	CPU_MEMORY[program_write++] = 0x21;
	CPU_MEMORY[program_write++] = 0x28;
	//step 6, write long NOP-chain into memory to contian the last few instructions executed
	for(int i = 0; i < 100; ++i) {
		CPU_MEMORY[program_write++] = CPUOP_NOP+128;
	}
	//run the program
	cpu_run();
	//print result
	printf("%08x\n",*(int*)&CPU_MEMORY[0]);

	return 0;
}
