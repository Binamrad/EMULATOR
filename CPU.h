#ifndef CPU_H_INCLUDED
#define CPU_H_INCLUDED
#include <stdint.h>
/*
16 registers

8k inst cache, 8k data (2-way assoc, 4-entry victim cache, 64-byte lines)
superscalar
pipeline:

|inst. fetch|decode|operand fetch|execute|reg. writeback|
	  0			1		  2	   		3			4

instruction format:
opcode (operand?)
1byte    1byte+

operand format:
MMMI RRRR ---- RRRR <- 2 register, memory options, imm/reg select
MMMI RRRR iiii iiii <- 1 register, immediate, memory options, imm/reg select
RRRR RRRR <- 2 register
iiii iiii <- 1 immediate

*/

#define L8 0
#define L16 1
#define L32 2
//memory buffers
extern uint8_t CPU_MEMORY[];

#define CPU_REGISTER_RCZ 0
#define CPU_REGISTER_R1 1
#define CPU_REGISTER_R2 2
#define CPU_REGISTER_R3 3

#define CPU_REGISTER_R4 4
#define CPU_REGISTER_R5 5
#define CPU_REGISTER_R6 6
#define CPU_REGISTER_R7 7

#define CPU_REGISTER_A0 8
#define CPU_REGISTER_A1 9
#define CPU_REGISTER_A2 10
#define CPU_REGISTER_A3 11

#define CPU_REGISTER_EX 12
#define CPU_REGISTER_FP 13
#define CPU_REGISTER_SP 14
#define CPU_REGISTER_RA 15

//normally inaccessable registers
#define CPU_REGISTER_INTERMEDIATE0 16
#define CPU_REGISTER_INTERMEDIATE1 17

//opcodes
//general arithmetic
#define CPUOP_INVALID 0
//#define CPUOP_INT	1//moved to special arithmetic
#define CPUOP_ADD	2
#define CPUOP_SUB	3
#define CPUOP_ADDC	4  //add with carry, computes r1+r2+r3
#define CPUOP_SUBC	5  //subtract with carry, computes r1-r2+r3
//6
//7
#define CPUOP_MUL	8
#define CPUOP_DIV	9
#define CPUOP_SDIV	10
#define CPUOP_SMUL	11
#define CPUOP_SHR	12
#define CPUOP_SSHR	13 //signed shift right
#define CPUOP_SHL	14
#define CPUOP_SHLC	15 //shift left, replace rightmost bits with carry
#define CPUOP_SHRC	16 //shift right, replace leftmost bits with carry
#define CPUOP_ROL	17
#define CPUOP_ROR	18
#define CPUOP_AND 	19
#define CPUOP_OR	20
#define CPUOP_XOR	21
#define CPUOP_CTZ	22 //find first set bit, return index. Is this common enough to be here?
#define CPUOP_FFZ	23 //find first zero bit, return index. Is this common enough to be here?
#define CPUOP_CLZ	24 //count leading zeroes, return count. Is this common enough to be here?
#define CPUOP_CMP	25
#define CPUOP_ADDHI	26
#define CPUOP_SETHI	27
#define CPUOP_GETHI	28
//room for 3 more operations
//floating point
#define CPUOP_FLD	32 //load floating point register
#define CPUOP_FST	33 //store floating point register
#define CPUOP_FADD	34
#define CPUOP_FSUB	35//4
#define CPUOP_FMUL	36
#define CPUOP_FDIV	37//need fmov. do we have 3 more instructions to pair with
#define CPUOP_FCOS	38
#define CPUOP_FSIN	39//8
#define CPUOP_FNEG	40
#define CPUOP_FCLR	41
#define CPUOP_FTOI  42
#define CPUOP_FTOF	43//12
#define CPUOP_FSQRT	44
#define CPUOP_FCMP	45
#define CPUOP_FABS	46
#define CPUOP_FVMST	47//16
#define CPUOP_FVMLD	48
#define CPUOP_FVADD	49
#define CPUOP_FVSUB	50
#define CPUOP_FVMUL	51//20
//special purpose arithmetic
#define CPUOP_MOV8	64
#define CPUOP_MOV16	65
#define CPUOP_MOV32 66
//#define CPUOP_MOV64 67
#define CPUOP_LEA	68//fused left shift, add, immediate add.
#define CPUOP_LD	69//LEA but read from address value instead of storing it
#define CPUOP_ST	70//LEA but store to address value instead of storing it
#define CPUOP_SWP	71//LEA but swap with address value instead of storing it
#define CPUOP_BR8	72//branch (by adding signed immediate to pc)
#define CPUOP_BR16	73//branch (by adding signed immediate to pc)
#define CPUOP_BR32	74//branch (by adding signed immediate to pc)
//#define CPUOP_BR64	75//branch (by adding signed immediate to pc)
#define CPUOP_BRA8	76//branch (by setting PC to immediate)
#define CPUOP_BRA16	77//branch (by setting PC to immediate)
#define CPUOP_BRA32	78//branch (by setting PC to immediate)
//#define CPUOP_BRA64	79//branch (by setting PC to immediate)
#define CPUOP_CALL	80//call subroutine
#define CPUOP_IOST	81//store to IO address space, should this be in system instructions?
#define CPUOP_IOLD	82//load from IO address space
//#define CPUOP_PUSH	83//the problems with push/pop operations is that they must use misaligned reads, which is difficult to implement
//#define CPUOP_POP	84
#define CPUOP_CMPXCHG	85 //compare and exchange
#define CPUOP_NOP	86// no operation
#define CPUOP_SXT	87//sign extend
//system maintenance instructions
#define CPUOP_CDC	96//clear data cache
#define CPUOP_CDCL	97//clear data cache line
#define CPUOP_CIC	98//clear instruction cache
#define CPUOP_CICL	99//clear instruction cache line
#define CPUOP_IEN	100//enable interrupts
#define CPUOP_IDIS	101
#define CPUOP_ITO	102//enable/disable interrupts
#define CPUOP_IRET	103//interrupt return
#define CPUOP_IAGET	104//get interrupt address
#define CPUOP_IASET 105//set interrupt address
//manage MMU
#define CPUOP_STLB	106//set TLB
#define CPUOP_RTLB	107//read TLB


//microop-codes
//0 is not permitted to be present
//1*4 is unused
#define CPUMOP_ADD	2*4
#define CPUMOP_SUB	3*4
#define	CPUMOP_ADDC	4*4
#define	CPUMOP_SUBC	5*4
//6*4
//7*4
#define CPUMOP_MUL	8*4
#define CPUMOP_DIV	9*4//I got lazy here
#define CPUMOP_SDIV	10*4
#define CPUMOP_SMUL	11*4
#define CPUMOP_SHR	12*4
#define CPUMOP_SSHR	13*4
#define CPUMOP_SHL	14*4
#define CPUMOP_SHLC	15*4
#define CPUMOP_SHRC	16*4
#define CPUMOP_ROL	17*4
#define CPUMOP_ROR	18*4
#define CPUMOP_AND 	19*4
#define CPUMOP_OR	20*4
#define CPUMOP_XOR	21*4
#define CPUMOP_FFS	22*4
#define CPUMOP_FFZ	23*4
#define CPUMOP_CLZ	24*4
#define CPUMOP_CMP	25*4
#define CPUMOP_ADDU	26*4
#define CPUMOP_STU	27*4
#define CPUMOP_LDU	28*4
/*******************************************************************************
first 32 opcodes of upper 128 opcodes are reserved for "background" operations
such as reading or writing to memory (part of other operations)
or verifying privilige levels
*******************************************************************************/
#define CPUMOP_RD8	128
#define CPUMOP_RD16	129
#define CPUMOP_RD32	130
//missing RD64		131
#define CPUMOP_WR8	132
#define CPUMOP_WR16	133
#define CPUMOP_WR32	134
//missing WR64		135
/*******************************''
floating point here
*******************************/
/*******************************''
advanced arithmetic here
*******************************/
#define CPUMOP_MOV8 192
#define CPUMOP_MOV16 193
#define CPUMOP_MOV32 194
//#define CPUMOP_MOV64 195
#define CPUMOP_BR8	200
#define CPUMOP_BR16	201
#define CPUMOP_BR32	202
//#define CPUMOP_BR64	203
#define CPUMOP_NOP	(128+74)
/*******************************''
system maintenance here
*******************************/
//functions to interact with cpu
unsigned long long cpu_run();



#endif
