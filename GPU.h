#ifndef GPU_H_INCLUDED
#define GPU_H_INCLUDED

#include <stdint.h>

//#define GPU_CORE_COUNT 32
//#define GPU_CORE_SHIFT 6
#define GPU_CORE_COUNT 32
#define GPU_COMMAND_BUFFER_SIZE 4096

unsigned long long gpu_run();
void gpu_init() ;
void gpu_set_program_params(uint32_t*);

typedef union{uint32_t i; float f;} GPU_REGISTER;
uint8_t * gpu_get_mem();
extern volatile uint32_t GPU_EXIT_CODE;
extern volatile uint32_t GPU_EXIT_PC;
extern volatile uint32_t GPU_EXIT_MESSAGE;
extern GPU_REGISTER GPU_REGISTERS[];
extern int GPU_ACTIVE_THREAD_INDEXES[];
extern int GPU_ACTIVE_THREADS;
extern uint8_t gpu_command_buffer[GPU_COMMAND_BUFFER_SIZE];

#define GPU_EXIT_CODE_EXIT				0
#define GPU_EXIT_CODE_ABORT				1
#define GPU_EXIT_MESSAGE_ENDOP			0
#define GPU_EXIT_MESSAGE_CODEBOUNDS		1
#define GPU_EXIT_MESSAGE_IDIV0			2
#define	GPU_EXIT_MESSAGE_READBOUNDS		3
#define GPU_EXIT_MESSAGE_WRITEBOUNDS	4
#define GPU_EXIT_MESSAGE_NOSUCHINSTR	5
#define GPU_EXIT_MESSAGE_NOOP			6

//architecture notes
/*
64 arithmetic units
each arithmetic units contain:
a program counter;
32 registers, 16 of which form a 16 integer stack
a two-line 16-word cache
the gpu operates on 32 bit words of two possible formats:
pixed point words of the format
1.16.15
with 1 sign bit,
16 bit integral part
15 bit fractional part
color vectors of the format
8.8.8.8
rgba format
*/


/*
NOTE: High/low 16 bits below should be swapped
four possible instruction formats:
op reg reg nop	reg
6  5   5   11	5
31   	---     00

op reg reg imm
6  5   5   16
31   ---   00

op reg nop imm
6  5   5   16
31   ---   00

op reg reg
6  5   5
15 --- 00

complex inst:
sqrt((AA + BB)>>1)
sqrt(A)
EXP(A, B)
sin
cos

special purpose arithm:
unpack 16-bit color value to 32-bit
pack 32-bit color to 16-bit
color addition
color multiplication
color subtraction
cache coherency encoding(Z-order curve)
*/
/*
INSTRUCTION SET

OPCODE		NAME		FUNCTION
<----------"gen 1" instrs--------------->
0			add			integer addition
1			sub			integer subtraction
2			mul16		16x16->32 bit integer multiplication
3			sl			integer shift left
4			sr			integer shift right
5			and			mask and
6			or			mask or
7			xor			mask xor
8			cmp			compare
9			end			stop execution
10			wr8			write low 8 bits to address
11			wr16		write low 16 bits to address
12			rd8			read 8 bits from address
13			rd16		read 16 bits from address
14			movil		move immediate low
15			movih		move immediate high
16			sel			select ( ?: statement )
17			tid			get thread ID
18			cend		conditional end
19			sam			right shift and mask immediate
<----------"gen 2" instrs---------------------------->
20			ftoi		float to integer
21			itof		integer to float
22			fadd		floating point addition
23			fsub		floating point subtraction
24			fmul		floating point multiplication
25			fsub1		floating point subtract from 1.0f
26			fmax		select maximum
27			fmin		select minimum
28			fcmp		floating point compare
29			br			branch to
30			brz			branch to on zero
31			vexp8		expand 8 bits into vector
32			vexp16		expand 16 bits into vector
33			vexp32		expand 32 bits into vector
34			fexp8		expand 8 bits into normalized float
35			fexp16		expand 16 bits into normalized float
36			vpack32		pack vector into 8 bits
37			vpack16		pack vector into 16 bits
38			vpack8		pack vector into 32 bits
39			wr32		write 32 bits
40			rd32		read 32 bits
41      	tile    	swizzle x and y, store back into x and y for addressing
42			fmod		extract integral and fractional part of float
*/
#define		GPUOP_ADD			0
#define		GPUOP_SUB			1
#define		GPUOP_MUL16			2
#define		GPUOP_SL			3
#define		GPUOP_SR			4
#define		GPUOP_AND			5
#define		GPUOP_OR			6
#define		GPUOP_XOR			7
#define		GPUOP_CMP			8
#define		GPUOP_END			9
#define		GPUOP_WR8			10
#define		GPUOP_WR16			11
#define		GPUOP_RD8			12
#define		GPUOP_RD16			13
#define		GPUOP_MOVIL			14
#define		GPUOP_MOVIH			15
#define		GPUOP_SEL			16
#define		GPUOP_TID			17
#define		GPUOP_CEND			18
#define		CPUOP_SAM			19
//----------------------------------------
#define		GPUOP_FTOI			20
#define		GPUOP_ITOF			21
#define		GPUOP_FADD			22
#define		GPUOP_FSUB			23
#define		GPUOP_FMUL			24
#define		GPUOP_FSUB1			25
#define		GPUOP_FMAX			26
#define		GPUOP_FMIN			27
#define		GPUOP_FCMP			28
#define		GPUOP_BR			29
#define		GPUOP_BRZ			30
#define		GPUOP_VEXP8			31
#define		GPUOP_VEXP16		32
#define		GPUOP_VEXP32		33
#define		GPUOP_FEXP8			34
#define		GPUOP_FEXP16		35
#define		GPUOP_VPACK32		36
#define 	GPUOP_VPACK16		37
#define		GPUOP_VPACK8		38
#define		GPUOP_WR32			39
#define		GPUOP_RD32			40
#define		GPUOP_TILE			41
#define		GPUOP_FMOD			42

#endif
