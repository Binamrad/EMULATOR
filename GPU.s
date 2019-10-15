
GPU_debug.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <gpu_init>:
gpu_init():
/home/simon/prog/C/EMULATOR/GPU.c:75
typedef float v4f __attribute__ ((vector_size (16)));
typedef int32_t v4si __attribute__ ((vector_size (16)));
typedef uint32_t v4ui __attribute__ ((vector_size (16)));

//initialisation
void gpu_init() {
       0:	48 83 ec 08          	sub    rsp,0x8
memset():
/usr/include/x86_64-linux-gnu/bits/string3.h:90
    {
      __warn_memset_zero_len ();
      return __dest;
    }
#endif
  return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
       4:	ba 00 00 40 00       	mov    edx,0x400000
       9:	31 f6                	xor    esi,esi
       b:	bf 00 00 00 00       	mov    edi,0x0
      10:	e8 00 00 00 00       	call   15 <gpu_init+0x15>
      15:	ba 00 00 00 00       	mov    edx,0x0
      1a:	31 c0                	xor    eax,eax
      1c:	b9 00 02 00 00       	mov    ecx,0x200
      21:	48 89 d7             	mov    rdi,rdx
      24:	be 00 00 00 00       	mov    esi,0x0
      29:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
      2c:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
      33:	b9 20 00 00 00       	mov    ecx,0x20
      38:	48 89 f7             	mov    rdi,rsi
      3b:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 42 <gpu_init+0x42>
      42:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 49 <gpu_init+0x49>
      49:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 50 <gpu_init+0x50>
      50:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 57 <gpu_init+0x57>
      57:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 5e <gpu_init+0x5e>
      5e:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 65 <gpu_init+0x65>
      65:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6c <gpu_init+0x6c>
      6c:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 73 <gpu_init+0x73>
      73:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
      76:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 7d <gpu_init+0x7d>
      7d:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 84 <gpu_init+0x84>
      84:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 8b <gpu_init+0x8b>
      8b:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 92 <gpu_init+0x92>
      92:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 99 <gpu_init+0x99>
      99:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # a0 <gpu_init+0xa0>
      a0:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # a7 <gpu_init+0xa7>
      a7:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # ae <gpu_init+0xae>
gpu_init():
/home/simon/prog/C/EMULATOR/GPU.c:80
	memset(memory, 0, MEMSIZE);
	memset(gpu_registers, 0, REGCOUNT*GPU_CORE_COUNT*sizeof(uint32_t));
	memset(gpu_l1_cache, -1, L1CACHE_ENTRIES*GPU_CORE_COUNT*sizeof(uint32_t));
	memset(gpu_l2_cache, -1, L2CACHE_ENTRIES*sizeof(uint32_t));
}
      ae:	48 83 c4 08          	add    rsp,0x8
      b2:	c3                   	ret    
      b3:	0f 1f 00             	nop    DWORD PTR [rax]
      b6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
      bd:	00 00 00 

00000000000000c0 <gpu_set_program_params>:
gpu_set_program_params():
/home/simon/prog/C/EMULATOR/GPU.c:83
uint32_t gpu_parameters[32];
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
      c0:	41 56                	push   r14
      c2:	41 b8 00 00 00 00    	mov    r8d,0x0
      c8:	41 55                	push   r13
      ca:	b9 00 00 00 00       	mov    ecx,0x0
      cf:	41 54                	push   r12
      d1:	41 b9 00 00 00 00    	mov    r9d,0x0
      d7:	55                   	push   rbp
      d8:	45 31 d2             	xor    r10d,r10d
      db:	53                   	push   rbx
      dc:	e9 f3 00 00 00       	jmp    1d4 <gpu_set_program_params+0x114>
      e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:88
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
			currentRegisters[r].i = params[i];
      e8:	8b 10                	mov    edx,DWORD PTR [rax]
      ea:	41 83 fd 01          	cmp    r13d,0x1
      ee:	89 11                	mov    DWORD PTR [rcx],edx
      f0:	0f 84 2a 02 00 00    	je     320 <gpu_set_program_params+0x260>
      f6:	44 8b 20             	mov    r12d,DWORD PTR [rax]
      f9:	41 83 fd 03          	cmp    r13d,0x3
      fd:	44 89 61 04          	mov    DWORD PTR [rcx+0x4],r12d
     101:	0f 85 09 02 00 00    	jne    310 <gpu_set_program_params+0x250>
     107:	8b 28                	mov    ebp,DWORD PTR [rax]
     109:	bb 1d 00 00 00       	mov    ebx,0x1d
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     10e:	be 03 00 00 00       	mov    esi,0x3
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     113:	89 69 08             	mov    DWORD PTR [rcx+0x8],ebp
     116:	bd 20 00 00 00       	mov    ebp,0x20
     11b:	45 89 ee             	mov    r14d,r13d
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     11e:	41 bc 1c 00 00 00    	mov    r12d,0x1c
     124:	44 29 ed             	sub    ebp,r13d
     127:	41 bd 07 00 00 00    	mov    r13d,0x7
     12d:	66 0f 6e 08          	movd   xmm1,DWORD PTR [rax]
     131:	4f 8d b4 16 00 02 00 	lea    r14,[r14+r10*1+0x200]
     138:	00 
     139:	41 83 fd 08          	cmp    r13d,0x8
     13d:	66 0f 70 c1 00       	pshufd xmm0,xmm1,0x0
     142:	4a 8d 14 b5 00 00 00 	lea    rdx,[r14*4+0x0]
     149:	00 
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     14a:	42 0f 29 04 b5 00 00 	movaps XMMWORD PTR [r14*4+0x0],xmm0
     151:	00 00 
     153:	0f 29 42 10          	movaps XMMWORD PTR [rdx+0x10],xmm0
     157:	0f 29 42 20          	movaps XMMWORD PTR [rdx+0x20],xmm0
     15b:	0f 29 42 30          	movaps XMMWORD PTR [rdx+0x30],xmm0
     15f:	0f 29 42 40          	movaps XMMWORD PTR [rdx+0x40],xmm0
     163:	0f 29 42 50          	movaps XMMWORD PTR [rdx+0x50],xmm0
     167:	0f 29 42 60          	movaps XMMWORD PTR [rdx+0x60],xmm0
     16b:	75 04                	jne    171 <gpu_set_program_params+0xb1>
/home/simon/prog/C/EMULATOR/GPU.c:88 (discriminator 3)
     16d:	0f 29 42 70          	movaps XMMWORD PTR [rdx+0x70],xmm0
     171:	44 29 e3             	sub    ebx,r12d
     174:	41 39 ec             	cmp    r12d,ebp
     177:	45 8d 2c 34          	lea    r13d,[r12+rsi*1]
     17b:	74 3a                	je     1b7 <gpu_set_program_params+0xf7>
/home/simon/prog/C/EMULATOR/GPU.c:88
     17d:	49 63 f5             	movsxd rsi,r13d
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     180:	83 fb 01             	cmp    ebx,0x1
     183:	45 8d 75 01          	lea    r14d,[r13+0x1]
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     187:	44 8b 20             	mov    r12d,DWORD PTR [rax]
     18a:	45 89 a4 b3 00 00 00 	mov    DWORD PTR [r11+rsi*4+0x0],r12d
     191:	00 
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     192:	74 23                	je     1b7 <gpu_set_program_params+0xf7>
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     194:	8b 28                	mov    ebp,DWORD PTR [rax]
     196:	49 63 d6             	movsxd rdx,r14d
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     199:	41 83 c5 02          	add    r13d,0x2
     19d:	83 fb 02             	cmp    ebx,0x2
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     1a0:	41 89 ac 93 00 00 00 	mov    DWORD PTR [r11+rdx*4+0x0],ebp
     1a7:	00 
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     1a8:	74 0d                	je     1b7 <gpu_set_program_params+0xf7>
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     1aa:	8b 00                	mov    eax,DWORD PTR [rax]
     1ac:	49 63 dd             	movsxd rbx,r13d
     1af:	41 89 84 9b 00 00 00 	mov    DWORD PTR [r11+rbx*4+0x0],eax
     1b6:	00 
     1b7:	49 83 c0 04          	add    r8,0x4
     1bb:	48 83 e9 80          	sub    rcx,0xffffffffffffff80
     1bf:	49 83 e9 80          	sub    r9,0xffffffffffffff80
     1c3:	49 83 c2 20          	add    r10,0x20
/home/simon/prog/C/EMULATOR/GPU.c:84 (discriminator 2)
	memset(gpu_l2_cache, -1, L2CACHE_ENTRIES*sizeof(uint32_t));
}
uint32_t gpu_parameters[32];
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
     1c7:	49 81 f8 00 00 00 00 	cmp    r8,0x0
     1ce:	0f 84 5c 01 00 00    	je     330 <gpu_set_program_params+0x270>
/home/simon/prog/C/EMULATOR/GPU.c:85
		gpu_parameters[16+i] = params[i];
     1d4:	8b 17                	mov    edx,DWORD PTR [rdi]
     1d6:	48 89 f8             	mov    rax,rdi
     1d9:	49 89 cb             	mov    r11,rcx
     1dc:	48 83 c7 04          	add    rdi,0x4
     1e0:	49 81 eb 00 00 00 00 	sub    r11,0x0
     1e7:	48 39 f9             	cmp    rcx,rdi
     1ea:	41 89 10             	mov    DWORD PTR [r8],edx
     1ed:	73 05                	jae    1f4 <gpu_set_program_params+0x134>
     1ef:	4c 39 c8             	cmp    rax,r9
     1f2:	72 3c                	jb     230 <gpu_set_program_params+0x170>
     1f4:	49 89 cd             	mov    r13,rcx
     1f7:	41 83 e5 0f          	and    r13d,0xf
     1fb:	49 c1 ed 02          	shr    r13,0x2
     1ff:	49 f7 dd             	neg    r13
     202:	41 83 e5 03          	and    r13d,0x3
     206:	0f 85 dc fe ff ff    	jne    e8 <gpu_set_program_params+0x28>
     20c:	41 bc 20 00 00 00    	mov    r12d,0x20
     212:	41 bd 08 00 00 00    	mov    r13d,0x8
     218:	bd 20 00 00 00       	mov    ebp,0x20
     21d:	45 31 f6             	xor    r14d,r14d
     220:	bb 20 00 00 00       	mov    ebx,0x20
/home/simon/prog/C/EMULATOR/GPU.c:87
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     225:	31 f6                	xor    esi,esi
     227:	e9 01 ff ff ff       	jmp    12d <gpu_set_program_params+0x6d>
     22c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
     230:	4c 89 ce             	mov    rsi,r9
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     233:	8b 18                	mov    ebx,DWORD PTR [rax]
     235:	48 8d 69 04          	lea    rbp,[rcx+0x4]
     239:	48 29 ce             	sub    rsi,rcx
     23c:	48 83 ee 04          	sub    rsi,0x4
     240:	48 c1 ee 02          	shr    rsi,0x2
     244:	89 19                	mov    DWORD PTR [rcx],ebx
     246:	83 e6 07             	and    esi,0x7
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     249:	4c 39 cd             	cmp    rbp,r9
     24c:	0f 84 65 ff ff ff    	je     1b7 <gpu_set_program_params+0xf7>
     252:	48 85 f6             	test   rsi,rsi
     255:	74 79                	je     2d0 <gpu_set_program_params+0x210>
     257:	48 83 fe 01          	cmp    rsi,0x1
     25b:	74 5c                	je     2b9 <gpu_set_program_params+0x1f9>
     25d:	48 83 fe 02          	cmp    rsi,0x2
     261:	74 4d                	je     2b0 <gpu_set_program_params+0x1f0>
     263:	48 83 fe 03          	cmp    rsi,0x3
     267:	74 3c                	je     2a5 <gpu_set_program_params+0x1e5>
     269:	48 83 fe 04          	cmp    rsi,0x4
     26d:	74 2d                	je     29c <gpu_set_program_params+0x1dc>
     26f:	48 83 fe 05          	cmp    rsi,0x5
     273:	74 1c                	je     291 <gpu_set_program_params+0x1d1>
     275:	48 83 fe 06          	cmp    rsi,0x6
     279:	74 0b                	je     286 <gpu_set_program_params+0x1c6>
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     27b:	44 8b 20             	mov    r12d,DWORD PTR [rax]
     27e:	48 83 c5 04          	add    rbp,0x4
     282:	44 89 65 fc          	mov    DWORD PTR [rbp-0x4],r12d
     286:	44 8b 28             	mov    r13d,DWORD PTR [rax]
     289:	48 83 c5 04          	add    rbp,0x4
     28d:	44 89 6d fc          	mov    DWORD PTR [rbp-0x4],r13d
     291:	44 8b 30             	mov    r14d,DWORD PTR [rax]
     294:	48 83 c5 04          	add    rbp,0x4
     298:	44 89 75 fc          	mov    DWORD PTR [rbp-0x4],r14d
     29c:	8b 10                	mov    edx,DWORD PTR [rax]
     29e:	48 83 c5 04          	add    rbp,0x4
     2a2:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
     2a5:	44 8b 18             	mov    r11d,DWORD PTR [rax]
     2a8:	48 83 c5 04          	add    rbp,0x4
     2ac:	44 89 5d fc          	mov    DWORD PTR [rbp-0x4],r11d
     2b0:	8b 30                	mov    esi,DWORD PTR [rax]
     2b2:	48 83 c5 04          	add    rbp,0x4
     2b6:	89 75 fc             	mov    DWORD PTR [rbp-0x4],esi
     2b9:	8b 18                	mov    ebx,DWORD PTR [rax]
     2bb:	48 83 c5 04          	add    rbp,0x4
     2bf:	89 5d fc             	mov    DWORD PTR [rbp-0x4],ebx
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     2c2:	4c 39 cd             	cmp    rbp,r9
     2c5:	0f 84 ec fe ff ff    	je     1b7 <gpu_set_program_params+0xf7>
     2cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     2d0:	44 8b 20             	mov    r12d,DWORD PTR [rax]
     2d3:	48 83 c5 20          	add    rbp,0x20
     2d7:	44 89 65 e0          	mov    DWORD PTR [rbp-0x20],r12d
     2db:	44 8b 28             	mov    r13d,DWORD PTR [rax]
     2de:	44 89 6d e4          	mov    DWORD PTR [rbp-0x1c],r13d
     2e2:	44 8b 30             	mov    r14d,DWORD PTR [rax]
     2e5:	44 89 75 e8          	mov    DWORD PTR [rbp-0x18],r14d
     2e9:	8b 10                	mov    edx,DWORD PTR [rax]
     2eb:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
     2ee:	44 8b 18             	mov    r11d,DWORD PTR [rax]
     2f1:	44 89 5d f0          	mov    DWORD PTR [rbp-0x10],r11d
     2f5:	8b 30                	mov    esi,DWORD PTR [rax]
     2f7:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
     2fa:	8b 18                	mov    ebx,DWORD PTR [rax]
     2fc:	89 5d f8             	mov    DWORD PTR [rbp-0x8],ebx
     2ff:	44 8b 20             	mov    r12d,DWORD PTR [rax]
     302:	44 89 65 fc          	mov    DWORD PTR [rbp-0x4],r12d
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     306:	4c 39 cd             	cmp    rbp,r9
     309:	75 c5                	jne    2d0 <gpu_set_program_params+0x210>
     30b:	e9 a7 fe ff ff       	jmp    1b7 <gpu_set_program_params+0xf7>
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     310:	bb 1e 00 00 00       	mov    ebx,0x1e
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     315:	be 02 00 00 00       	mov    esi,0x2
     31a:	e9 f7 fd ff ff       	jmp    116 <gpu_set_program_params+0x56>
     31f:	90                   	nop
/home/simon/prog/C/EMULATOR/GPU.c:88
			currentRegisters[r].i = params[i];
     320:	bb 1f 00 00 00       	mov    ebx,0x1f
/home/simon/prog/C/EMULATOR/GPU.c:87
//grab the 16 parameters at program start, place in correct registers
void gpu_set_program_params(uint32_t* params) {
	for(int i = 0; i < 16; ++i) {
		gpu_parameters[16+i] = params[i];
		GPU_REGISTER *currentRegisters = (gpu_registers+((i+16)*GPU_CORE_COUNT));
		for(int r = 0; r < GPU_CORE_COUNT; ++r) {
     325:	be 01 00 00 00       	mov    esi,0x1
     32a:	e9 e7 fd ff ff       	jmp    116 <gpu_set_program_params+0x56>
     32f:	90                   	nop
/home/simon/prog/C/EMULATOR/GPU.c:91
			currentRegisters[r].i = params[i];
		}
	}
}
     330:	5b                   	pop    rbx
     331:	5d                   	pop    rbp
     332:	41 5c                	pop    r12
     334:	41 5d                	pop    r13
     336:	41 5e                	pop    r14
     338:	c3                   	ret    
     339:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000000340 <insertExecSpan>:
insertExecSpan():
/home/simon/prog/C/EMULATOR/GPU.c:99
int GPU_ACTIVE_THREAD_INDEXES[GPU_CORE_COUNT] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
int GPU_ACTIVE_THREADS = GPU_CORE_COUNT;
execSpan *NEXT_EXEC_SPAN = 0;

void insertExecSpan(execSpan *span) {
	if(NEXT_EXEC_SPAN == 0 || NEXT_EXEC_SPAN->PC > span->PC) {
     340:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 347 <insertExecSpan+0x7>
     347:	48 85 d2             	test   rdx,rdx
     34a:	74 3c                	je     388 <insertExecSpan+0x48>
/home/simon/prog/C/EMULATOR/GPU.c:99 (discriminator 1)
     34c:	44 8b 42 08          	mov    r8d,DWORD PTR [rdx+0x8]
     350:	8b 77 08             	mov    esi,DWORD PTR [rdi+0x8]
     353:	41 39 f0             	cmp    r8d,esi
     356:	76 15                	jbe    36d <insertExecSpan+0x2d>
     358:	eb 2e                	jmp    388 <insertExecSpan+0x48>
     35a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:104 (discriminator 1)
		span->next = NEXT_EXEC_SPAN;
		NEXT_EXEC_SPAN = span;
	} else {
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
     360:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
     363:	39 ce                	cmp    esi,ecx
     365:	76 0e                	jbe    375 <insertExecSpan+0x35>
     367:	41 89 c8             	mov    r8d,ecx
     36a:	48 89 c2             	mov    rdx,rax
/home/simon/prog/C/EMULATOR/GPU.c:104
     36d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
     370:	48 85 c0             	test   rax,rax
     373:	75 eb                	jne    360 <insertExecSpan+0x20>
/home/simon/prog/C/EMULATOR/GPU.c:107
			next = next->next;
		}
		if(next->PC == span->PC) {
     375:	44 39 c6             	cmp    esi,r8d
     378:	74 1e                	je     398 <insertExecSpan+0x58>
/home/simon/prog/C/EMULATOR/GPU.c:113
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
				next->index[next->count++] = span->index[--span->count];
			}
			free(span);
		} else {
			span->next = next->next;
     37a:	48 89 07             	mov    QWORD PTR [rdi],rax
/home/simon/prog/C/EMULATOR/GPU.c:114
			next->next = span;
     37d:	48 89 3a             	mov    QWORD PTR [rdx],rdi
     380:	c3                   	ret    
     381:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:100
int GPU_ACTIVE_THREADS = GPU_CORE_COUNT;
execSpan *NEXT_EXEC_SPAN = 0;

void insertExecSpan(execSpan *span) {
	if(NEXT_EXEC_SPAN == 0 || NEXT_EXEC_SPAN->PC > span->PC) {
		span->next = NEXT_EXEC_SPAN;
     388:	48 89 17             	mov    QWORD PTR [rdi],rdx
/home/simon/prog/C/EMULATOR/GPU.c:101
		NEXT_EXEC_SPAN = span;
     38b:	48 89 3d 00 00 00 00 	mov    QWORD PTR [rip+0x0],rdi        # 392 <insertExecSpan+0x52>
     392:	c3                   	ret    
     393:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:108
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
			next = next->next;
		}
		if(next->PC == span->PC) {
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
     398:	8b 77 0c             	mov    esi,DWORD PTR [rdi+0xc]
     39b:	85 f6                	test   esi,esi
     39d:	74 2c                	je     3cb <insertExecSpan+0x8b>
     39f:	90                   	nop
/home/simon/prog/C/EMULATOR/GPU.c:109
				next->index[next->count++] = span->index[--span->count];
     3a0:	4c 63 42 0c          	movsxd r8,DWORD PTR [rdx+0xc]
     3a4:	45 8d 48 01          	lea    r9d,[r8+0x1]
     3a8:	44 89 4a 0c          	mov    DWORD PTR [rdx+0xc],r9d
     3ac:	44 8b 57 0c          	mov    r10d,DWORD PTR [rdi+0xc]
     3b0:	41 83 ea 01          	sub    r10d,0x1
     3b4:	4d 63 da             	movsxd r11,r10d
     3b7:	44 89 57 0c          	mov    DWORD PTR [rdi+0xc],r10d
/home/simon/prog/C/EMULATOR/GPU.c:108
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
			next = next->next;
		}
		if(next->PC == span->PC) {
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
     3bb:	45 85 d2             	test   r10d,r10d
/home/simon/prog/C/EMULATOR/GPU.c:109
				next->index[next->count++] = span->index[--span->count];
     3be:	42 0f b6 44 1f 10    	movzx  eax,BYTE PTR [rdi+r11*1+0x10]
     3c4:	42 88 44 02 10       	mov    BYTE PTR [rdx+r8*1+0x10],al
/home/simon/prog/C/EMULATOR/GPU.c:108
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
			next = next->next;
		}
		if(next->PC == span->PC) {
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
     3c9:	75 d5                	jne    3a0 <insertExecSpan+0x60>
/home/simon/prog/C/EMULATOR/GPU.c:111
				next->index[next->count++] = span->index[--span->count];
			}
			free(span);
     3cb:	e9 00 00 00 00       	jmp    3d0 <mergeNextSpan>

00000000000003d0 <mergeNextSpan>:
mergeNextSpan():
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
     3d0:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 3d7 <mergeNextSpan+0x7>
     3d7:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 3dd <mergeNextSpan+0xd>
     3dd:	8b 47 0c             	mov    eax,DWORD PTR [rdi+0xc]
     3e0:	85 c0                	test   eax,eax
     3e2:	74 2b                	je     40f <mergeNextSpan+0x3f>
     3e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:121
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
     3e8:	83 e8 01             	sub    eax,0x1
     3eb:	48 63 ca             	movsxd rcx,edx
     3ee:	83 c2 01             	add    edx,0x1
     3f1:	89 47 0c             	mov    DWORD PTR [rdi+0xc],eax
     3f4:	48 98                	cdqe   
     3f6:	0f b6 44 07 10       	movzx  eax,BYTE PTR [rdi+rax*1+0x10]
     3fb:	89 04 8d 00 00 00 00 	mov    DWORD PTR [rcx*4+0x0],eax
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
     402:	8b 47 0c             	mov    eax,DWORD PTR [rdi+0xc]
     405:	85 c0                	test   eax,eax
     407:	75 df                	jne    3e8 <mergeNextSpan+0x18>
     409:	89 15 00 00 00 00    	mov    DWORD PTR [rip+0x0],edx        # 40f <mergeNextSpan+0x3f>
/home/simon/prog/C/EMULATOR/GPU.c:124
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
	}
	execSpan *tmp = NEXT_EXEC_SPAN;
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
     40f:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
     412:	48 89 35 00 00 00 00 	mov    QWORD PTR [rip+0x0],rsi        # 419 <mergeNextSpan+0x49>
/home/simon/prog/C/EMULATOR/GPU.c:125
	free(tmp);
     419:	e9 00 00 00 00       	jmp    41e <mergeNextSpan+0x4e>
     41e:	66 90                	xchg   ax,ax

0000000000000420 <getEmptySpan>:
getEmptySpan():
/home/simon/prog/C/EMULATOR/GPU.c:128
}

execSpan* getEmptySpan(uint32_t PC) {
     420:	53                   	push   rbx
     421:	89 fb                	mov    ebx,edi
/home/simon/prog/C/EMULATOR/GPU.c:129
	execSpan *ret = (execSpan*)malloc(sizeof(execSpan));
     423:	bf 30 00 00 00       	mov    edi,0x30
     428:	e8 00 00 00 00       	call   42d <getEmptySpan+0xd>
/home/simon/prog/C/EMULATOR/GPU.c:130
	ret->PC = PC;
     42d:	89 58 08             	mov    DWORD PTR [rax+0x8],ebx
/home/simon/prog/C/EMULATOR/GPU.c:131
	ret->next = 0;
     430:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
/home/simon/prog/C/EMULATOR/GPU.c:132
	ret->count = 0;
     437:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
/home/simon/prog/C/EMULATOR/GPU.c:134
	return ret;
}
     43e:	5b                   	pop    rbx
     43f:	c3                   	ret    

0000000000000440 <gpu_get_mem>:
gpu_get_mem():
/home/simon/prog/C/EMULATOR/GPU.c:138

uint8_t *gpu_get_mem() {
    return memory;
}
     440:	b8 00 00 00 00       	mov    eax,0x0
     445:	c3                   	ret    
     446:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
     44d:	00 00 00 

0000000000000450 <gpu_run>:
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:143

unsigned long long mem_busy_until = 0;

__attribute__((optimize("unroll-loops")))
unsigned long long gpu_run() {
     450:	41 57                	push   r15
     452:	41 56                	push   r14
     454:	41 55                	push   r13
     456:	41 54                	push   r12
     458:	55                   	push   rbp
     459:	53                   	push   rbx
/home/simon/prog/C/EMULATOR/GPU.c:156
		GPU_EXIT_CODE = GPU_EXIT_CODE_EXIT;
		GPU_EXIT_PC = currentPC;
		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOOP;
	}

	while(numThreadsRunning) {
     45a:	31 ed                	xor    ebp,ebp
/home/simon/prog/C/EMULATOR/GPU.c:143
}

unsigned long long mem_busy_until = 0;

__attribute__((optimize("unroll-loops")))
unsigned long long gpu_run() {
     45c:	48 83 ec 48          	sub    rsp,0x48
/home/simon/prog/C/EMULATOR/GPU.c:146
	unsigned long long cycles = 0;
	mem_busy_until = 0;
	uint32_t numThreadsRunning = GPU_ACTIVE_THREADS;
     460:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 466 <gpu_run+0x16>
/home/simon/prog/C/EMULATOR/GPU.c:145
unsigned long long mem_busy_until = 0;

__attribute__((optimize("unroll-loops")))
unsigned long long gpu_run() {
	unsigned long long cycles = 0;
	mem_busy_until = 0;
     466:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 471 <gpu_run+0x21>
     46d:	00 00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:156
		GPU_EXIT_CODE = GPU_EXIT_CODE_EXIT;
		GPU_EXIT_PC = currentPC;
		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOOP;
	}

	while(numThreadsRunning) {
     471:	85 c0                	test   eax,eax
/home/simon/prog/C/EMULATOR/GPU.c:146

__attribute__((optimize("unroll-loops")))
unsigned long long gpu_run() {
	unsigned long long cycles = 0;
	mem_busy_until = 0;
	uint32_t numThreadsRunning = GPU_ACTIVE_THREADS;
     473:	89 44 24 34          	mov    DWORD PTR [rsp+0x34],eax
/home/simon/prog/C/EMULATOR/GPU.c:156
		GPU_EXIT_CODE = GPU_EXIT_CODE_EXIT;
		GPU_EXIT_PC = currentPC;
		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOOP;
	}

	while(numThreadsRunning) {
     477:	0f 84 a2 01 00 00    	je     61f <gpu_run+0x1cf>
     47d:	45 31 db             	xor    r11d,r11d
     480:	48 89 6c 24 08       	mov    QWORD PTR [rsp+0x8],rbp
     485:	45 89 dd             	mov    r13d,r11d
     488:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
     48f:	00 
/home/simon/prog/C/EMULATOR/GPU.c:167
			GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_CODEBOUNDS;
			break;
		}

		//send data for video out
		if(cycles >= vout_next_line_at_cycle) {
     490:	48 8b 35 00 00 00 00 	mov    rsi,QWORD PTR [rip+0x0]        # 497 <gpu_run+0x47>
     497:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
     49c:	48 39 d6             	cmp    rsi,rdx
     49f:	77 71                	ja     512 <gpu_run+0xc2>
/home/simon/prog/C/EMULATOR/GPU.c:168
			if(mem_busy_until > cycles) {//TODO: this isn't accurate enough. Figure out what happens when read line in memory operation
     4a1:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 4a8 <gpu_run+0x58>
     4a8:	48 39 d7             	cmp    rdi,rdx
     4ab:	76 0b                	jbe    4b8 <gpu_run+0x68>
/home/simon/prog/C/EMULATOR/GPU.c:171
										//		problem: we might not have enough cycles to let the previous memory operation terminate.
										//				 We might not be able to terminate last operation (precharge)
				mem_busy_until += GPU_TRCD+GPU_TRP+GPU_CL;//close and open bank
     4ad:	48 83 c7 09          	add    rdi,0x9
     4b1:	48 89 3d 00 00 00 00 	mov    QWORD PTR [rip+0x0],rdi        # 4b8 <gpu_run+0x68>
/home/simon/prog/C/EMULATOR/GPU.c:173
			}
			if(vout_line_counter < 1080 && (vout_line_counter % vout_fraction) == 0) {//TODO: can we optimize away this modulo operation?
     4b8:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 4be <gpu_run+0x6e>
     4be:	81 f9 37 04 00 00    	cmp    ecx,0x437
     4c4:	77 27                	ja     4ed <gpu_run+0x9d>
/home/simon/prog/C/EMULATOR/GPU.c:173 (discriminator 1)
     4c6:	31 d2                	xor    edx,edx
     4c8:	89 c8                	mov    eax,ecx
     4ca:	f7 35 00 00 00 00    	div    DWORD PTR [rip+0x0]        # 4d0 <gpu_run+0x80>
     4d0:	85 d2                	test   edx,edx
     4d2:	75 19                	jne    4ed <gpu_run+0x9d>
/home/simon/prog/C/EMULATOR/GPU.c:174
				mem_busy_until += (GPU_TRCD+GPU_CL+GPU_TRP)*2+((vout_data_per_line+63)/64);//approximate time to read one line
     4d4:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # 4da <gpu_run+0x8a>
     4da:	83 c3 3f             	add    ebx,0x3f
     4dd:	c1 eb 06             	shr    ebx,0x6
     4e0:	83 c3 12             	add    ebx,0x12
     4e3:	48 01 df             	add    rdi,rbx
     4e6:	48 89 3d 00 00 00 00 	mov    QWORD PTR [rip+0x0],rdi        # 4ed <gpu_run+0x9d>
/home/simon/prog/C/EMULATOR/GPU.c:178
			}
			//TODO: write to output data here
			vout_next_line_at_cycle += VOUT_CYCLES_PER_LINE;
			vout_line_counter += 1;
     4ed:	83 c1 01             	add    ecx,0x1
/home/simon/prog/C/EMULATOR/GPU.c:177
			}
			if(vout_line_counter < 1080 && (vout_line_counter % vout_fraction) == 0) {//TODO: can we optimize away this modulo operation?
				mem_busy_until += (GPU_TRCD+GPU_CL+GPU_TRP)*2+((vout_data_per_line+63)/64);//approximate time to read one line
			}
			//TODO: write to output data here
			vout_next_line_at_cycle += VOUT_CYCLES_PER_LINE;
     4f0:	48 81 c6 9d ad 00 00 	add    rsi,0xad9d
/home/simon/prog/C/EMULATOR/GPU.c:178
			vout_line_counter += 1;
     4f7:	bd 00 00 00 00       	mov    ebp,0x0
     4fc:	81 f9 65 04 00 00    	cmp    ecx,0x465
/home/simon/prog/C/EMULATOR/GPU.c:177
			}
			if(vout_line_counter < 1080 && (vout_line_counter % vout_fraction) == 0) {//TODO: can we optimize away this modulo operation?
				mem_busy_until += (GPU_TRCD+GPU_CL+GPU_TRP)*2+((vout_data_per_line+63)/64);//approximate time to read one line
			}
			//TODO: write to output data here
			vout_next_line_at_cycle += VOUT_CYCLES_PER_LINE;
     502:	48 89 35 00 00 00 00 	mov    QWORD PTR [rip+0x0],rsi        # 509 <gpu_run+0xb9>
/home/simon/prog/C/EMULATOR/GPU.c:178
			vout_line_counter += 1;
     509:	0f 44 cd             	cmove  ecx,ebp
     50c:	89 0d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ecx        # 512 <gpu_run+0xc2>
/home/simon/prog/C/EMULATOR/GPU.c:189
		//memory refresh


		//sleep(1);
		//printf("%i\n",currentPC);
		if(NEXT_EXEC_SPAN && NEXT_EXEC_SPAN->PC == currentPC) {
     512:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 519 <gpu_run+0xc9>
     519:	48 85 ff             	test   rdi,rdi
     51c:	74 0a                	je     528 <gpu_run+0xd8>
/home/simon/prog/C/EMULATOR/GPU.c:189 (discriminator 1)
     51e:	44 39 6f 08          	cmp    DWORD PTR [rdi+0x8],r13d
     522:	0f 84 88 00 00 00    	je     5b0 <gpu_run+0x160>
/home/simon/prog/C/EMULATOR/GPU.c:194
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
     528:	45 89 ee             	mov    r14d,r13d
/home/simon/prog/C/EMULATOR/GPU.c:195
		currentPC += 4;
     52b:	41 83 c5 04          	add    r13d,0x4
/home/simon/prog/C/EMULATOR/GPU.c:194
		if(NEXT_EXEC_SPAN && NEXT_EXEC_SPAN->PC == currentPC) {
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
     52f:	45 8b 9e 00 00 00 00 	mov    r11d,DWORD PTR [r14+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:198
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);
     536:	45 89 df             	mov    r15d,r11d
/home/simon/prog/C/EMULATOR/GPU.c:197


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
     539:	4c 89 df             	mov    rdi,r11
/home/simon/prog/C/EMULATOR/GPU.c:196
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
     53c:	45 89 d8             	mov    r8d,r11d
/home/simon/prog/C/EMULATOR/GPU.c:198
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);
     53f:	41 c1 ef 10          	shr    r15d,0x10
/home/simon/prog/C/EMULATOR/GPU.c:197


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
     543:	48 c1 e7 05          	shl    rdi,0x5
/home/simon/prog/C/EMULATOR/GPU.c:200
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
     547:	45 89 d9             	mov    r9d,r11d
/home/simon/prog/C/EMULATOR/GPU.c:198

		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);
     54a:	4c 89 f9             	mov    rcx,r15
/home/simon/prog/C/EMULATOR/GPU.c:196
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
     54d:	41 81 e0 e0 03 00 00 	and    r8d,0x3e0
/home/simon/prog/C/EMULATOR/GPU.c:197
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
     554:	81 e7 e0 03 00 00    	and    edi,0x3e0
/home/simon/prog/C/EMULATOR/GPU.c:198
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);
     55a:	48 c1 e1 05          	shl    rcx,0x5
/home/simon/prog/C/EMULATOR/GPU.c:200

		switch((inst >> 10) & 63) {
     55e:	41 c1 e9 0a          	shr    r9d,0xa
/home/simon/prog/C/EMULATOR/GPU.c:196
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
     562:	4a 8d 04 85 00 00 00 	lea    rax,[r8*4+0x0]
     569:	00 
/home/simon/prog/C/EMULATOR/GPU.c:198
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);
     56a:	81 e1 e0 03 00 00    	and    ecx,0x3e0
/home/simon/prog/C/EMULATOR/GPU.c:197


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
     570:	48 8d 14 bd 00 00 00 	lea    rdx,[rdi*4+0x0]
     577:	00 
/home/simon/prog/C/EMULATOR/GPU.c:200
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
     578:	41 83 e1 3f          	and    r9d,0x3f
/home/simon/prog/C/EMULATOR/GPU.c:198

		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);
     57c:	48 8d 34 8d 00 00 00 	lea    rsi,[rcx*4+0x0]
     583:	00 
/home/simon/prog/C/EMULATOR/GPU.c:200

		switch((inst >> 10) & 63) {
     584:	41 83 f9 2a          	cmp    r9d,0x2a
/home/simon/prog/C/EMULATOR/GPU.c:196
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
		GPU_REGISTER * __restrict__ A  = __builtin_assume_aligned(gpu_registers+(((inst>>5) & 31)*GPU_CORE_COUNT),16);
     588:	48 8d 98 00 00 00 00 	lea    rbx,[rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:197
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
     58f:	48 8d aa 00 00 00 00 	lea    rbp,[rdx+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:198
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);
     596:	4c 8d a6 00 00 00 00 	lea    r12,[rsi+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:200

		switch((inst >> 10) & 63) {
     59d:	0f 87 dd 48 00 00    	ja     4e80 <gpu_run+0x4a30>
     5a3:	42 ff 24 cd 00 00 00 	jmp    QWORD PTR [r9*8+0x0]
     5aa:	00 
     5ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
mergeNextSpan():
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
     5b0:	8b 47 0c             	mov    eax,DWORD PTR [rdi+0xc]
     5b3:	44 8b 05 00 00 00 00 	mov    r8d,DWORD PTR [rip+0x0]        # 5ba <gpu_run+0x16a>
     5ba:	85 c0                	test   eax,eax
     5bc:	74 2d                	je     5eb <gpu_run+0x19b>
     5be:	66 90                	xchg   ax,ax
/home/simon/prog/C/EMULATOR/GPU.c:121
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
     5c0:	83 e8 01             	sub    eax,0x1
     5c3:	4d 63 c8             	movsxd r9,r8d
     5c6:	41 83 c0 01          	add    r8d,0x1
     5ca:	89 47 0c             	mov    DWORD PTR [rdi+0xc],eax
     5cd:	48 98                	cdqe   
     5cf:	44 0f b6 54 07 10    	movzx  r10d,BYTE PTR [rdi+rax*1+0x10]
     5d5:	46 89 14 8d 00 00 00 	mov    DWORD PTR [r9*4+0x0],r10d
     5dc:	00 
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
     5dd:	8b 47 0c             	mov    eax,DWORD PTR [rdi+0xc]
     5e0:	85 c0                	test   eax,eax
     5e2:	75 dc                	jne    5c0 <gpu_run+0x170>
     5e4:	44 89 05 00 00 00 00 	mov    DWORD PTR [rip+0x0],r8d        # 5eb <gpu_run+0x19b>
/home/simon/prog/C/EMULATOR/GPU.c:124
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
	}
	execSpan *tmp = NEXT_EXEC_SPAN;
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
     5eb:	4c 8b 27             	mov    r12,QWORD PTR [rdi]
     5ee:	4c 89 25 00 00 00 00 	mov    QWORD PTR [rip+0x0],r12        # 5f5 <gpu_run+0x1a5>
/home/simon/prog/C/EMULATOR/GPU.c:125
	free(tmp);
     5f5:	e8 00 00 00 00       	call   5fa <gpu_run+0x1aa>
     5fa:	e9 29 ff ff ff       	jmp    528 <gpu_run+0xd8>
     5ff:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:271
	      		}
				break;
			case GPUOP_END:
				cycles += 1+numThreadsRunning-GPU_ACTIVE_THREADS;
				if(NEXT_EXEC_SPAN == 0) {
					GPU_EXIT_CODE = GPU_EXIT_CODE_EXIT;
     604:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 60e <gpu_run+0x1be>
     60b:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:272
					GPU_EXIT_PC = currentPC;
     60e:	44 89 2d 00 00 00 00 	mov    DWORD PTR [rip+0x0],r13d        # 615 <gpu_run+0x1c5>
/home/simon/prog/C/EMULATOR/GPU.c:273
					GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_ENDOP;
     615:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 61f <gpu_run+0x1cf>
     61c:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:665
	      		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOSUCHINSTR;
		      	break;
    	}
  	}
  	return cycles;
}
     61f:	48 83 c4 48          	add    rsp,0x48
     623:	48 89 e8             	mov    rax,rbp
     626:	5b                   	pop    rbx
     627:	5d                   	pop    rbp
     628:	41 5c                	pop    r12
     62a:	41 5d                	pop    r13
     62c:	41 5e                	pop    r14
     62e:	41 5f                	pop    r15
     630:	c3                   	ret    
     631:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:649
	      		}
				break;
			case GPUOP_FMOD:
				cycles += 3;
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     638:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # 63f <gpu_run+0x1ef>
/home/simon/prog/C/EMULATOR/GPU.c:648
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
	      		}
				break;
			case GPUOP_FMOD:
				cycles += 3;
				cycles += 2;
     63f:	48 83 44 24 08 05    	add    QWORD PTR [rsp+0x8],0x5
     645:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
/home/simon/prog/C/EMULATOR/GPU.c:649
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     64a:	45 85 db             	test   r11d,r11d
     64d:	0f 8e 1d 28 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:651 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = modff(C[indx].f,&B[indx].f);
     653:	4c 63 35 00 00 00 00 	movsxd r14,DWORD PTR [rip+0x0]        # 65a <gpu_run+0x20a>
     65a:	41 83 eb 01          	sub    r11d,0x1
     65e:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
     663:	4a 8d 14 9d 00 00 00 	lea    rdx,[r11*4+0x0]
     66a:	00 
     66b:	4d 89 da             	mov    r10,r11
     66e:	41 83 e2 03          	and    r10d,0x3
     672:	49 89 d7             	mov    r15,rdx
     675:	4c 89 54 24 18       	mov    QWORD PTR [rsp+0x18],r10
     67a:	49 c1 e6 02          	shl    r14,0x2
     67e:	4a 8d 7c 35 00       	lea    rdi,[rbp+r14*1+0x0]
     683:	f3 41 0f 10 84 36 00 	movss  xmm0,DWORD PTR [r14+rsi*1+0x0]
     68a:	00 00 00 
     68d:	e8 00 00 00 00       	call   692 <gpu_run+0x242>
     692:	f3 48 0f 2c f0       	cvttss2si rsi,xmm0
     697:	48 8b 54 24 20       	mov    rdx,QWORD PTR [rsp+0x20]
/home/simon/prog/C/EMULATOR/GPU.c:649 (discriminator 3)
	      		}
				break;
			case GPUOP_FMOD:
				cycles += 3;
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     69c:	4c 8b 54 24 10       	mov    r10,QWORD PTR [rsp+0x10]
     6a1:	48 8b 7c 24 18       	mov    rdi,QWORD PTR [rsp+0x18]
/home/simon/prog/C/EMULATOR/GPU.c:651 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = modff(C[indx].f,&B[indx].f);
     6a6:	41 89 b4 16 00 00 00 	mov    DWORD PTR [r14+rdx*1+0x0],esi
     6ad:	00 
     6ae:	41 be 00 00 00 00    	mov    r14d,0x0
/home/simon/prog/C/EMULATOR/GPU.c:649 (discriminator 3)
	      		}
				break;
			case GPUOP_FMOD:
				cycles += 3;
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     6b4:	4d 39 fe             	cmp    r14,r15
     6b7:	0f 84 b3 27 00 00    	je     2e70 <gpu_run+0x2a20>
     6bd:	48 85 ff             	test   rdi,rdi
     6c0:	0f 84 e9 00 00 00    	je     7af <gpu_run+0x35f>
     6c6:	48 83 ff 01          	cmp    rdi,0x1
     6ca:	0f 84 96 00 00 00    	je     766 <gpu_run+0x316>
     6d0:	48 83 ff 02          	cmp    rdi,0x2
     6d4:	74 46                	je     71c <gpu_run+0x2cc>
/home/simon/prog/C/EMULATOR/GPU.c:651
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = modff(C[indx].f,&B[indx].f);
     6d6:	4c 63 35 00 00 00 00 	movsxd r14,DWORD PTR [rip+0x0]        # 6dd <gpu_run+0x28d>
     6dd:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
     6e2:	4c 89 54 24 10       	mov    QWORD PTR [rsp+0x10],r10
     6e7:	49 c1 e6 02          	shl    r14,0x2
     6eb:	4a 8d 7c 35 00       	lea    rdi,[rbp+r14*1+0x0]
     6f0:	f3 43 0f 10 84 32 00 	movss  xmm0,DWORD PTR [r10+r14*1+0x0]
     6f7:	00 00 00 
     6fa:	e8 00 00 00 00       	call   6ff <gpu_run+0x2af>
     6ff:	f3 48 0f 2c c8       	cvttss2si rcx,xmm0
     704:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
     709:	4c 8b 54 24 10       	mov    r10,QWORD PTR [rsp+0x10]
     70e:	42 89 8c 32 00 00 00 	mov    DWORD PTR [rdx+r14*1+0x0],ecx
     715:	00 
     716:	41 be 00 00 00 00    	mov    r14d,0x0
     71c:	49 63 06             	movsxd rax,DWORD PTR [r14]
     71f:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
     724:	49 83 c6 04          	add    r14,0x4
     728:	4c 89 54 24 10       	mov    QWORD PTR [rsp+0x10],r10
     72d:	48 c1 e0 02          	shl    rax,0x2
     731:	48 8d 7c 05 00       	lea    rdi,[rbp+rax*1+0x0]
     736:	f3 41 0f 10 84 02 00 	movss  xmm0,DWORD PTR [r10+rax*1+0x0]
     73d:	00 00 00 
     740:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
     745:	e8 00 00 00 00       	call   74a <gpu_run+0x2fa>
     74a:	f3 4c 0f 2c c8       	cvttss2si r9,xmm0
     74f:	4c 8b 5c 24 18       	mov    r11,QWORD PTR [rsp+0x18]
     754:	48 8b 54 24 20       	mov    rdx,QWORD PTR [rsp+0x20]
     759:	4c 8b 54 24 10       	mov    r10,QWORD PTR [rsp+0x10]
     75e:	46 89 8c 1a 00 00 00 	mov    DWORD PTR [rdx+r11*1+0x0],r9d
     765:	00 
     766:	49 63 36             	movsxd rsi,DWORD PTR [r14]
     769:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
     76e:	49 83 c6 04          	add    r14,0x4
     772:	48 c1 e6 02          	shl    rsi,0x2
     776:	48 8d 7c 35 00       	lea    rdi,[rbp+rsi*1+0x0]
     77b:	f3 41 0f 10 84 32 00 	movss  xmm0,DWORD PTR [r10+rsi*1+0x0]
     782:	00 00 00 
     785:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
     78a:	e8 00 00 00 00       	call   78f <gpu_run+0x33f>
     78f:	f3 4c 0f 2c c0       	cvttss2si r8,xmm0
     794:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
     799:	48 8b 4c 24 18       	mov    rcx,QWORD PTR [rsp+0x18]
/home/simon/prog/C/EMULATOR/GPU.c:649
	      		}
				break;
			case GPUOP_FMOD:
				cycles += 3;
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     79e:	4d 39 fe             	cmp    r14,r15
/home/simon/prog/C/EMULATOR/GPU.c:651
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = modff(C[indx].f,&B[indx].f);
     7a1:	44 89 84 39 00 00 00 	mov    DWORD PTR [rcx+rdi*1+0x0],r8d
     7a8:	00 
/home/simon/prog/C/EMULATOR/GPU.c:649
	      		}
				break;
			case GPUOP_FMOD:
				cycles += 3;
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     7a9:	0f 84 c1 26 00 00    	je     2e70 <gpu_run+0x2a20>
     7af:	44 89 6c 24 10       	mov    DWORD PTR [rsp+0x10],r13d
     7b4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:651 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = modff(C[indx].f,&B[indx].f);
     7b8:	4d 63 2e             	movsxd r13,DWORD PTR [r14]
     7bb:	49 83 c6 10          	add    r14,0x10
     7bf:	4a 8d 7c ad 00       	lea    rdi,[rbp+r13*4+0x0]
     7c4:	f3 43 0f 10 04 ac    	movss  xmm0,DWORD PTR [r12+r13*4]
     7ca:	e8 00 00 00 00       	call   7cf <gpu_run+0x37f>
     7cf:	f3 4c 0f 2c c8       	cvttss2si r9,xmm0
     7d4:	46 89 0c ab          	mov    DWORD PTR [rbx+r13*4],r9d
     7d8:	4d 63 6e f4          	movsxd r13,DWORD PTR [r14-0xc]
     7dc:	4a 8d 7c ad 00       	lea    rdi,[rbp+r13*4+0x0]
     7e1:	f3 43 0f 10 04 ac    	movss  xmm0,DWORD PTR [r12+r13*4]
     7e7:	e8 00 00 00 00       	call   7ec <gpu_run+0x39c>
     7ec:	f3 4c 0f 2c d8       	cvttss2si r11,xmm0
     7f1:	46 89 1c ab          	mov    DWORD PTR [rbx+r13*4],r11d
     7f5:	4d 63 6e f8          	movsxd r13,DWORD PTR [r14-0x8]
     7f9:	4a 8d 7c ad 00       	lea    rdi,[rbp+r13*4+0x0]
     7fe:	f3 43 0f 10 04 ac    	movss  xmm0,DWORD PTR [r12+r13*4]
     804:	e8 00 00 00 00       	call   809 <gpu_run+0x3b9>
     809:	f3 48 0f 2c d0       	cvttss2si rdx,xmm0
     80e:	42 89 14 ab          	mov    DWORD PTR [rbx+r13*4],edx
     812:	4d 63 6e fc          	movsxd r13,DWORD PTR [r14-0x4]
     816:	4a 8d 7c ad 00       	lea    rdi,[rbp+r13*4+0x0]
     81b:	f3 43 0f 10 04 ac    	movss  xmm0,DWORD PTR [r12+r13*4]
     821:	e8 00 00 00 00       	call   826 <gpu_run+0x3d6>
     826:	f3 4c 0f 2c d0       	cvttss2si r10,xmm0
/home/simon/prog/C/EMULATOR/GPU.c:649 (discriminator 3)
	      		}
				break;
			case GPUOP_FMOD:
				cycles += 3;
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     82b:	4d 39 fe             	cmp    r14,r15
/home/simon/prog/C/EMULATOR/GPU.c:651 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = modff(C[indx].f,&B[indx].f);
     82e:	46 89 14 ab          	mov    DWORD PTR [rbx+r13*4],r10d
/home/simon/prog/C/EMULATOR/GPU.c:649 (discriminator 3)
	      		}
				break;
			case GPUOP_FMOD:
				cycles += 3;
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     832:	75 84                	jne    7b8 <gpu_run+0x368>
     834:	44 8b 6c 24 10       	mov    r13d,DWORD PTR [rsp+0x10]
     839:	e9 32 26 00 00       	jmp    2e70 <gpu_run+0x2a20>
     83e:	66 90                	xchg   ax,ax
/home/simon/prog/C/EMULATOR/GPU.c:629
				cycles += (tmpCycles+1)>>1;
				}
				break;
			case GPUOP_TILE:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     840:	44 8b 25 00 00 00 00 	mov    r12d,DWORD PTR [rip+0x0]        # 847 <gpu_run+0x3f7>
/home/simon/prog/C/EMULATOR/GPU.c:628
				}
				cycles += (tmpCycles+1)>>1;
				}
				break;
			case GPUOP_TILE:
				cycles += 2;
     847:	48 83 44 24 08 02    	add    QWORD PTR [rsp+0x8],0x2
/home/simon/prog/C/EMULATOR/GPU.c:629
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     84d:	45 85 e4             	test   r12d,r12d
     850:	0f 8e 1a 26 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     856:	48 63 35 00 00 00 00 	movsxd rsi,DWORD PTR [rip+0x0]        # 85d <gpu_run+0x40d>
     85d:	45 8d 7c 24 ff       	lea    r15d,[r12-0x1]
     862:	4e 8d 34 bd 00 00 00 	lea    r14,[r15*4+0x0]
     869:	00 
     86a:	41 83 e7 03          	and    r15d,0x3
     86e:	48 c1 e6 02          	shl    rsi,0x2
     872:	4c 8d 04 33          	lea    r8,[rbx+rsi*1]
/home/simon/prog/C/EMULATOR/GPU.c:634 (discriminator 3)
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
     876:	48 01 ee             	add    rsi,rbp
     879:	8b 0e                	mov    ecx,DWORD PTR [rsi]
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     87b:	41 8b 38             	mov    edi,DWORD PTR [r8]
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     87e:	89 c8                	mov    eax,ecx
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     880:	83 e1 fc             	and    ecx,0xfffffffc
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     883:	41 89 f9             	mov    r9d,edi
     886:	83 e0 03             	and    eax,0x3
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     889:	83 e7 0c             	and    edi,0xc
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     88c:	41 83 e1 f3          	and    r9d,0xfffffff3
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     890:	c1 ef 02             	shr    edi,0x2
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     893:	45 8d 1c 81          	lea    r11d,[r9+rax*4]
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     897:	01 f9                	add    ecx,edi
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     899:	45 89 18             	mov    DWORD PTR [r8],r11d
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     89c:	89 0e                	mov    DWORD PTR [rsi],ecx
     89e:	b9 00 00 00 00       	mov    ecx,0x0
/home/simon/prog/C/EMULATOR/GPU.c:629 (discriminator 3)
				cycles += (tmpCycles+1)>>1;
				}
				break;
			case GPUOP_TILE:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     8a3:	4c 39 f1             	cmp    rcx,r14
     8a6:	0f 84 c4 25 00 00    	je     2e70 <gpu_run+0x2a20>
     8ac:	4d 85 ff             	test   r15,r15
     8af:	0f 84 db 00 00 00    	je     990 <gpu_run+0x540>
     8b5:	49 83 ff 01          	cmp    r15,0x1
     8b9:	0f 84 86 00 00 00    	je     945 <gpu_run+0x4f5>
     8bf:	49 83 ff 02          	cmp    r15,0x2
     8c3:	74 42                	je     907 <gpu_run+0x4b7>
/home/simon/prog/C/EMULATOR/GPU.c:633
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     8c5:	4c 63 25 00 00 00 00 	movsxd r12,DWORD PTR [rip+0x0]        # 8cc <gpu_run+0x47c>
     8cc:	b9 00 00 00 00       	mov    ecx,0x0
     8d1:	49 c1 e4 02          	shl    r12,0x2
     8d5:	4e 8d 3c 23          	lea    r15,[rbx+r12*1]
/home/simon/prog/C/EMULATOR/GPU.c:634
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
     8d9:	49 01 ec             	add    r12,rbp
     8dc:	41 8b 14 24          	mov    edx,DWORD PTR [r12]
/home/simon/prog/C/EMULATOR/GPU.c:633
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     8e0:	41 8b 37             	mov    esi,DWORD PTR [r15]
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     8e3:	41 89 d2             	mov    r10d,edx
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     8e6:	83 e2 fc             	and    edx,0xfffffffc
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     8e9:	41 89 f0             	mov    r8d,esi
     8ec:	41 83 e2 03          	and    r10d,0x3
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     8f0:	83 e6 0c             	and    esi,0xc
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     8f3:	41 83 e0 f3          	and    r8d,0xfffffff3
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     8f7:	c1 ee 02             	shr    esi,0x2
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     8fa:	43 8d 3c 90          	lea    edi,[r8+r10*4]
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     8fe:	01 f2                	add    edx,esi
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     900:	41 89 3f             	mov    DWORD PTR [r15],edi
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     903:	41 89 14 24          	mov    DWORD PTR [r12],edx
/home/simon/prog/C/EMULATOR/GPU.c:633
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     907:	48 63 01             	movsxd rax,DWORD PTR [rcx]
     90a:	48 83 c1 04          	add    rcx,0x4
     90e:	48 c1 e0 02          	shl    rax,0x2
     912:	4c 8d 0c 03          	lea    r9,[rbx+rax*1]
/home/simon/prog/C/EMULATOR/GPU.c:634
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
     916:	48 01 e8             	add    rax,rbp
     919:	44 8b 38             	mov    r15d,DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:633
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     91c:	45 8b 21             	mov    r12d,DWORD PTR [r9]
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     91f:	45 89 fb             	mov    r11d,r15d
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     922:	41 83 e7 fc          	and    r15d,0xfffffffc
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     926:	44 89 e6             	mov    esi,r12d
     929:	41 83 e3 03          	and    r11d,0x3
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     92d:	41 83 e4 0c          	and    r12d,0xc
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     931:	83 e6 f3             	and    esi,0xfffffff3
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     934:	41 c1 ec 02          	shr    r12d,0x2
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     938:	42 8d 14 9e          	lea    edx,[rsi+r11*4]
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     93c:	45 01 e7             	add    r15d,r12d
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     93f:	41 89 11             	mov    DWORD PTR [r9],edx
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     942:	44 89 38             	mov    DWORD PTR [rax],r15d
/home/simon/prog/C/EMULATOR/GPU.c:633
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     945:	4c 63 01             	movsxd r8,DWORD PTR [rcx]
     948:	48 83 c1 04          	add    rcx,0x4
     94c:	49 c1 e0 02          	shl    r8,0x2
     950:	4a 8d 04 03          	lea    rax,[rbx+r8*1]
/home/simon/prog/C/EMULATOR/GPU.c:634
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
     954:	49 01 e8             	add    r8,rbp
     957:	45 8b 08             	mov    r9d,DWORD PTR [r8]
/home/simon/prog/C/EMULATOR/GPU.c:633
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     95a:	8b 38                	mov    edi,DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     95c:	45 89 cc             	mov    r12d,r9d
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     95f:	41 83 e1 fc          	and    r9d,0xfffffffc
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     963:	41 89 fa             	mov    r10d,edi
     966:	41 83 e4 03          	and    r12d,0x3
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     96a:	83 e7 0c             	and    edi,0xc
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     96d:	41 83 e2 f3          	and    r10d,0xfffffff3
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     971:	c1 ef 02             	shr    edi,0x2
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     974:	47 8d 3c a2          	lea    r15d,[r10+r12*4]
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     978:	41 01 f9             	add    r9d,edi
/home/simon/prog/C/EMULATOR/GPU.c:629
				cycles += (tmpCycles+1)>>1;
				}
				break;
			case GPUOP_TILE:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     97b:	4c 39 f1             	cmp    rcx,r14
/home/simon/prog/C/EMULATOR/GPU.c:642

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     97e:	44 89 38             	mov    DWORD PTR [rax],r15d
/home/simon/prog/C/EMULATOR/GPU.c:643
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     981:	45 89 08             	mov    DWORD PTR [r8],r9d
/home/simon/prog/C/EMULATOR/GPU.c:629
				cycles += (tmpCycles+1)>>1;
				}
				break;
			case GPUOP_TILE:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     984:	0f 84 e6 24 00 00    	je     2e70 <gpu_run+0x2a20>
     98a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     990:	4c 63 19             	movsxd r11,DWORD PTR [rcx]
     993:	4c 63 61 04          	movsxd r12,DWORD PTR [rcx+0x4]
     997:	49 c1 e3 02          	shl    r11,0x2
     99b:	49 c1 e4 02          	shl    r12,0x2
     99f:	4a 8d 34 1b          	lea    rsi,[rbx+r11*1]
/home/simon/prog/C/EMULATOR/GPU.c:634 (discriminator 3)
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
     9a3:	49 01 eb             	add    r11,rbp
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     9a6:	4e 8d 3c 23          	lea    r15,[rbx+r12*1]
/home/simon/prog/C/EMULATOR/GPU.c:634 (discriminator 3)
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
     9aa:	41 8b 13             	mov    edx,DWORD PTR [r11]
     9ad:	49 01 ec             	add    r12,rbp
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     9b0:	44 8b 06             	mov    r8d,DWORD PTR [rsi]
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     9b3:	89 d0                	mov    eax,edx
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     9b5:	83 e2 fc             	and    edx,0xfffffffc
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     9b8:	44 89 c7             	mov    edi,r8d
     9bb:	83 e0 03             	and    eax,0x3
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     9be:	41 83 e0 0c          	and    r8d,0xc
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     9c2:	83 e7 f3             	and    edi,0xfffffff3
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     9c5:	41 c1 e8 02          	shr    r8d,0x2
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     9c9:	44 8d 0c 87          	lea    r9d,[rdi+rax*4]
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     9cd:	44 01 c2             	add    edx,r8d
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     9d0:	48 63 41 08          	movsxd rax,DWORD PTR [rcx+0x8]
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     9d4:	44 89 0e             	mov    DWORD PTR [rsi],r9d
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     9d7:	41 89 13             	mov    DWORD PTR [r11],edx
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     9da:	45 8b 1f             	mov    r11d,DWORD PTR [r15]
/home/simon/prog/C/EMULATOR/GPU.c:634 (discriminator 3)
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
     9dd:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     9e1:	48 c1 e0 02          	shl    rax,0x2
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     9e5:	41 89 f2             	mov    r10d,esi
     9e8:	45 89 d8             	mov    r8d,r11d
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     9eb:	41 83 e3 0c          	and    r11d,0xc
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     9ef:	41 83 e2 03          	and    r10d,0x3
     9f3:	41 83 e0 f3          	and    r8d,0xfffffff3
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     9f7:	41 c1 eb 02          	shr    r11d,0x2
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     9fb:	43 8d 14 90          	lea    edx,[r8+r10*4]
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     9ff:	83 e6 fc             	and    esi,0xfffffffc
     a02:	44 01 de             	add    esi,r11d
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     a05:	41 89 17             	mov    DWORD PTR [r15],edx
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     a08:	41 89 34 24          	mov    DWORD PTR [r12],esi
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     a0c:	4c 8d 24 03          	lea    r12,[rbx+rax*1]
/home/simon/prog/C/EMULATOR/GPU.c:634 (discriminator 3)
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
     a10:	48 01 e8             	add    rax,rbp
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     a13:	41 8b 3c 24          	mov    edi,DWORD PTR [r12]
/home/simon/prog/C/EMULATOR/GPU.c:634 (discriminator 3)
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
     a17:	44 8b 38             	mov    r15d,DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     a1a:	41 89 f9             	mov    r9d,edi
     a1d:	45 89 fb             	mov    r11d,r15d
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     a20:	83 e7 0c             	and    edi,0xc
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     a23:	41 83 e3 03          	and    r11d,0x3
     a27:	41 83 e1 f3          	and    r9d,0xfffffff3
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     a2b:	c1 ef 02             	shr    edi,0x2
     a2e:	41 83 e7 fc          	and    r15d,0xfffffffc
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     a32:	43 8d 34 99          	lea    esi,[r9+r11*4]
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     a36:	41 01 ff             	add    r15d,edi
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     a39:	41 89 34 24          	mov    DWORD PTR [r12],esi
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     a3d:	44 89 38             	mov    DWORD PTR [rax],r15d
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     a40:	48 63 41 0c          	movsxd rax,DWORD PTR [rcx+0xc]
     a44:	48 c1 e0 02          	shl    rax,0x2
     a48:	4c 8d 04 03          	lea    r8,[rbx+rax*1]
/home/simon/prog/C/EMULATOR/GPU.c:634 (discriminator 3)
					uint32_t tmpy = B[indx].i;//final goal: x2 x3 y2 y3 y4-y32
     a4c:	48 01 e8             	add    rax,rbp
     a4f:	8b 10                	mov    edx,DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:633 (discriminator 3)
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					//we want to scramble the bits so that the L2 16-word line effectively caches a square when writing words
					//16*4 = 4*4*4 = 8*8 = 3*3 bits
					uint32_t tmpx = A[indx].i;//final goal: x0 x1 y0 y1 x4-x32
     a51:	45 8b 20             	mov    r12d,DWORD PTR [r8]
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     a54:	41 89 d2             	mov    r10d,edx
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     a57:	83 e2 fc             	and    edx,0xfffffffc
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     a5a:	44 89 e7             	mov    edi,r12d
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     a5d:	41 83 e4 0c          	and    r12d,0xc
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     a61:	41 83 e2 03          	and    r10d,0x3
     a65:	83 e7 f3             	and    edi,0xfffffff3
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     a68:	41 c1 ec 02          	shr    r12d,0x2
     a6c:	44 01 e2             	add    edx,r12d
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     a6f:	46 8d 3c 97          	lea    r15d,[rdi+r10*4]
     a73:	48 83 c1 10          	add    rcx,0x10
/home/simon/prog/C/EMULATOR/GPU.c:629 (discriminator 3)
				cycles += (tmpCycles+1)>>1;
				}
				break;
			case GPUOP_TILE:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     a77:	4c 39 f1             	cmp    rcx,r14
/home/simon/prog/C/EMULATOR/GPU.c:642 (discriminator 3)

					//if(i == 0) {
					//	printf("%i,%i = %i(%i) <> %i(%i) (%i,%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,(int)(A-gpu_registers)/32,A[i].i,(int)(B-gpu_registers)/32,B[i].i,(tmpx & 0xfffffff3) + (outy<<2),(tmpy & 0xfffffffc) + (outx>>2));
					//}

					A[indx].i = (tmpx & 0xfffffff3) + (outy<<2);
     a7a:	45 89 38             	mov    DWORD PTR [r8],r15d
/home/simon/prog/C/EMULATOR/GPU.c:643 (discriminator 3)
					B[indx].i = (tmpy & 0xfffffffc) + (outx>>2);
     a7d:	89 10                	mov    DWORD PTR [rax],edx
/home/simon/prog/C/EMULATOR/GPU.c:629 (discriminator 3)
				cycles += (tmpCycles+1)>>1;
				}
				break;
			case GPUOP_TILE:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     a7f:	0f 85 0b ff ff ff    	jne    990 <gpu_run+0x540>
     a85:	e9 e6 23 00 00       	jmp    2e70 <gpu_run+0x2a20>
     a8a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:543 (discriminator 1)
				uint32_t tmpCycles = 6;//3*2, minimum time for instruction
				uint32_t tmp = 0;
				uint32_t lastAddr = -1;
				bool lastCache = false;//did the last memory read come from L2 cache
				bool lastMem = false;//did the last memory read come from memory
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     a90:	44 8b 35 00 00 00 00 	mov    r14d,DWORD PTR [rip+0x0]        # a97 <gpu_run+0x647>
     a97:	45 85 f6             	test   r14d,r14d
     a9a:	44 89 f1             	mov    ecx,r14d
     a9d:	0f 8e 4d 53 00 00    	jle    5df0 <gpu_run+0x59a0>
     aa3:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # aaa <gpu_run+0x65a>
/home/simon/prog/C/EMULATOR/GPU.c:570
							uint32_t L2Entry = ((addr & L2CACHE_ENTRY_MASK)>>L2CACHE_ENTRY_SHIFT);
							gpu_l2_cache[((gpu_l2_entry_select&(1<<L2Entry))>>L2Entry)+(L2Entry<<1)] = (addr & L2CACHE_ADDR_MASK);
							gpu_l2_entry_select ^= 1 << L2Entry;
							//otherwise, add word count + latency + row miss
							//							 8,           3,        8 cycles respectively (3-4-4-7 ram)
							if((cycles + (tmpCycles>>1)) < mem_busy_until) {//TODO: look over this, doesn't seem quite right
     aaa:	4c 8b 0d 00 00 00 00 	mov    r9,QWORD PTR [rip+0x0]        # ab1 <gpu_run+0x661>
     ab1:	31 f6                	xor    esi,esi
     ab3:	44 8b 15 00 00 00 00 	mov    r10d,DWORD PTR [rip+0x0]        # aba <gpu_run+0x66a>
     aba:	c6 44 24 3b 00       	mov    BYTE PTR [rsp+0x3b],0x0
     abf:	45 31 f6             	xor    r14d,r14d
     ac2:	c6 44 24 18 00       	mov    BYTE PTR [rsp+0x18],0x0
     ac7:	c6 44 24 3a 00       	mov    BYTE PTR [rsp+0x3a],0x0
/home/simon/prog/C/EMULATOR/GPU.c:610
							lastCache = true;
							lastMem = false;
						}
					} else {
						//update cache replacement policy
						gpu_l1_entry_select = (gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK)) ? gpu_l1_entry_select&(0xffffffff^(1<<indx)): gpu_l1_entry_select|(1<<indx);
     acc:	41 b8 01 00 00 00    	mov    r8d,0x1
     ad2:	44 89 5c 24 30       	mov    DWORD PTR [rsp+0x30],r11d
/home/simon/prog/C/EMULATOR/GPU.c:570
							uint32_t L2Entry = ((addr & L2CACHE_ENTRY_MASK)>>L2CACHE_ENTRY_SHIFT);
							gpu_l2_cache[((gpu_l2_entry_select&(1<<L2Entry))>>L2Entry)+(L2Entry<<1)] = (addr & L2CACHE_ADDR_MASK);
							gpu_l2_entry_select ^= 1 << L2Entry;
							//otherwise, add word count + latency + row miss
							//							 8,           3,        8 cycles respectively (3-4-4-7 ram)
							if((cycles + (tmpCycles>>1)) < mem_busy_until) {//TODO: look over this, doesn't seem quite right
     ad7:	4c 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],r9
/home/simon/prog/C/EMULATOR/GPU.c:610
							lastCache = true;
							lastMem = false;
						}
					} else {
						//update cache replacement policy
						gpu_l1_entry_select = (gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK)) ? gpu_l1_entry_select&(0xffffffff^(1<<indx)): gpu_l1_entry_select|(1<<indx);
     adc:	41 89 cf             	mov    r15d,ecx
/home/simon/prog/C/EMULATOR/GPU.c:570
							uint32_t L2Entry = ((addr & L2CACHE_ENTRY_MASK)>>L2CACHE_ENTRY_SHIFT);
							gpu_l2_cache[((gpu_l2_entry_select&(1<<L2Entry))>>L2Entry)+(L2Entry<<1)] = (addr & L2CACHE_ADDR_MASK);
							gpu_l2_entry_select ^= 1 << L2Entry;
							//otherwise, add word count + latency + row miss
							//							 8,           3,        8 cycles respectively (3-4-4-7 ram)
							if((cycles + (tmpCycles>>1)) < mem_busy_until) {//TODO: look over this, doesn't seem quite right
     adf:	c7 44 24 20 ff ff ff 	mov    DWORD PTR [rsp+0x20],0xffffffff
     ae6:	ff 
     ae7:	c7 44 24 10 06 00 00 	mov    DWORD PTR [rsp+0x10],0x6
     aee:	00 
/home/simon/prog/C/EMULATOR/GPU.c:610
							lastCache = true;
							lastMem = false;
						}
					} else {
						//update cache replacement policy
						gpu_l1_entry_select = (gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK)) ? gpu_l1_entry_select&(0xffffffff^(1<<indx)): gpu_l1_entry_select|(1<<indx);
     aef:	44 89 6c 24 3c       	mov    DWORD PTR [rsp+0x3c],r13d
     af4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:544
				uint32_t tmp = 0;
				uint32_t lastAddr = -1;
				bool lastCache = false;//did the last memory read come from L2 cache
				bool lastMem = false;//did the last memory read come from memory
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
     af8:	48 63 3c b5 00 00 00 	movsxd rdi,DWORD PTR [rsi*4+0x0]
     aff:	00 
/home/simon/prog/C/EMULATOR/GPU.c:545
					uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
     b00:	41 8b 04 bc          	mov    eax,DWORD PTR [r12+rdi*4]
     b04:	44 8b 6c bd 00       	mov    r13d,DWORD PTR [rbp+rdi*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:546
					if(gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK) && gpu_l1_cache[(indx<<1)+1] != (addr & L1CACHE_ADDR_MASK)) {
     b09:	44 8d 0c 3f          	lea    r9d,[rdi+rdi*1]
/home/simon/prog/C/EMULATOR/GPU.c:544
				uint32_t tmp = 0;
				uint32_t lastAddr = -1;
				bool lastCache = false;//did the last memory read come from L2 cache
				bool lastMem = false;//did the last memory read come from memory
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
     b0d:	48 89 f9             	mov    rcx,rdi
/home/simon/prog/C/EMULATOR/GPU.c:546
					uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
					if(gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK) && gpu_l1_cache[(indx<<1)+1] != (addr & L1CACHE_ADDR_MASK)) {
     b10:	4d 63 d9             	movsxd r11,r9d
/home/simon/prog/C/EMULATOR/GPU.c:545
				uint32_t lastAddr = -1;
				bool lastCache = false;//did the last memory read come from L2 cache
				bool lastMem = false;//did the last memory read come from memory
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
     b13:	25 ff 03 00 00       	and    eax,0x3ff
     b18:	41 81 e5 ff 03 00 00 	and    r13d,0x3ff
     b1f:	c1 e0 0a             	shl    eax,0xa
     b22:	44 01 e8             	add    eax,r13d
     b25:	c1 e0 02             	shl    eax,0x2
/home/simon/prog/C/EMULATOR/GPU.c:546
					if(gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK) && gpu_l1_cache[(indx<<1)+1] != (addr & L1CACHE_ADDR_MASK)) {
     b28:	89 c2                	mov    edx,eax
     b2a:	83 e2 e0             	and    edx,0xffffffe0
     b2d:	42 39 14 9d 00 00 00 	cmp    DWORD PTR [r11*4+0x0],edx
     b34:	00 
     b35:	0f 84 f5 44 00 00    	je     5030 <gpu_run+0x4be0>
/home/simon/prog/C/EMULATOR/GPU.c:546 (discriminator 1)
     b3b:	45 8d 59 01          	lea    r11d,[r9+0x1]
     b3f:	4d 63 eb             	movsxd r13,r11d
     b42:	42 3b 14 ad 00 00 00 	cmp    edx,DWORD PTR [r13*4+0x0]
     b49:	00 
     b4a:	0f 84 60 43 00 00    	je     4eb0 <gpu_run+0x4a60>
/home/simon/prog/C/EMULATOR/GPU.c:547
						gpu_l1_cache[(indx<<1)+((gpu_l1_entry_select&(1<<indx))>>indx)] = addr & L1CACHE_ADDR_MASK;
     b50:	45 89 c5             	mov    r13d,r8d
     b53:	41 d3 e5             	shl    r13d,cl
     b56:	45 89 eb             	mov    r11d,r13d
     b59:	45 21 d3             	and    r11d,r10d
/home/simon/prog/C/EMULATOR/GPU.c:548
						gpu_l1_entry_select^=(1<<indx);
     b5c:	45 31 ea             	xor    r10d,r13d
/home/simon/prog/C/EMULATOR/GPU.c:547
				bool lastMem = false;//did the last memory read come from memory
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
					if(gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK) && gpu_l1_cache[(indx<<1)+1] != (addr & L1CACHE_ADDR_MASK)) {
						gpu_l1_cache[(indx<<1)+((gpu_l1_entry_select&(1<<indx))>>indx)] = addr & L1CACHE_ADDR_MASK;
     b5f:	41 d3 eb             	shr    r11d,cl
/home/simon/prog/C/EMULATOR/GPU.c:550
						gpu_l1_entry_select^=(1<<indx);
						//if we have already streamed this address somewhere, skip cycle addition
						for(int i = 0; i < tmp; ++i) {
     b62:	45 85 f6             	test   r14d,r14d
/home/simon/prog/C/EMULATOR/GPU.c:547
				bool lastMem = false;//did the last memory read come from memory
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
					if(gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK) && gpu_l1_cache[(indx<<1)+1] != (addr & L1CACHE_ADDR_MASK)) {
						gpu_l1_cache[(indx<<1)+((gpu_l1_entry_select&(1<<indx))>>indx)] = addr & L1CACHE_ADDR_MASK;
     b65:	43 8d 0c 0b          	lea    ecx,[r11+r9*1]
     b69:	89 14 8d 00 00 00 00 	mov    DWORD PTR [rcx*4+0x0],edx
/home/simon/prog/C/EMULATOR/GPU.c:550
						gpu_l1_entry_select^=(1<<indx);
						//if we have already streamed this address somewhere, skip cycle addition
						for(int i = 0; i < tmp; ++i) {
     b70:	0f 84 52 43 00 00    	je     4ec8 <gpu_run+0x4a78>
/home/simon/prog/C/EMULATOR/GPU.c:551
							if(gpu_cache_read[i] == (addr & L1CACHE_ADDR_MASK)) {
     b76:	3b 15 00 00 00 00    	cmp    edx,DWORD PTR [rip+0x0]        # b7c <gpu_run+0x72c>
     b7c:	0f 84 ce 00 00 00    	je     c50 <gpu_run+0x800>
     b82:	45 8d 4e ff          	lea    r9d,[r14-0x1]
     b86:	41 bb 00 00 00 00    	mov    r11d,0x0
     b8c:	4e 8d 2c 8d 00 00 00 	lea    r13,[r9*4+0x0]
     b93:	00 
     b94:	41 83 e1 07          	and    r9d,0x7
     b98:	74 72                	je     c0c <gpu_run+0x7bc>
     b9a:	3b 15 00 00 00 00    	cmp    edx,DWORD PTR [rip+0x0]        # ba0 <gpu_run+0x750>
     ba0:	41 bb 00 00 00 00    	mov    r11d,0x0
     ba6:	0f 84 a4 00 00 00    	je     c50 <gpu_run+0x800>
     bac:	49 83 f9 01          	cmp    r9,0x1
     bb0:	74 5a                	je     c0c <gpu_run+0x7bc>
     bb2:	49 83 f9 02          	cmp    r9,0x2
     bb6:	74 4a                	je     c02 <gpu_run+0x7b2>
     bb8:	49 83 f9 03          	cmp    r9,0x3
     bbc:	74 3a                	je     bf8 <gpu_run+0x7a8>
     bbe:	49 83 f9 04          	cmp    r9,0x4
     bc2:	74 2a                	je     bee <gpu_run+0x79e>
     bc4:	49 83 f9 05          	cmp    r9,0x5
     bc8:	74 1a                	je     be4 <gpu_run+0x794>
     bca:	49 83 f9 06          	cmp    r9,0x6
     bce:	74 0a                	je     bda <gpu_run+0x78a>
     bd0:	49 83 c3 04          	add    r11,0x4
     bd4:	41 3b 53 fc          	cmp    edx,DWORD PTR [r11-0x4]
     bd8:	74 76                	je     c50 <gpu_run+0x800>
     bda:	49 83 c3 04          	add    r11,0x4
     bde:	41 3b 53 fc          	cmp    edx,DWORD PTR [r11-0x4]
     be2:	74 6c                	je     c50 <gpu_run+0x800>
     be4:	49 83 c3 04          	add    r11,0x4
     be8:	41 3b 53 fc          	cmp    edx,DWORD PTR [r11-0x4]
     bec:	74 62                	je     c50 <gpu_run+0x800>
     bee:	49 83 c3 04          	add    r11,0x4
     bf2:	41 3b 53 fc          	cmp    edx,DWORD PTR [r11-0x4]
     bf6:	74 58                	je     c50 <gpu_run+0x800>
     bf8:	49 83 c3 04          	add    r11,0x4
     bfc:	41 3b 53 fc          	cmp    edx,DWORD PTR [r11-0x4]
     c00:	74 4e                	je     c50 <gpu_run+0x800>
     c02:	49 83 c3 04          	add    r11,0x4
     c06:	41 3b 53 fc          	cmp    edx,DWORD PTR [r11-0x4]
     c0a:	74 44                	je     c50 <gpu_run+0x800>
/home/simon/prog/C/EMULATOR/GPU.c:550 (discriminator 2)
					uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
					if(gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK) && gpu_l1_cache[(indx<<1)+1] != (addr & L1CACHE_ADDR_MASK)) {
						gpu_l1_cache[(indx<<1)+((gpu_l1_entry_select&(1<<indx))>>indx)] = addr & L1CACHE_ADDR_MASK;
						gpu_l1_entry_select^=(1<<indx);
						//if we have already streamed this address somewhere, skip cycle addition
						for(int i = 0; i < tmp; ++i) {
     c0c:	4d 39 eb             	cmp    r11,r13
     c0f:	0f 84 b3 42 00 00    	je     4ec8 <gpu_run+0x4a78>
/home/simon/prog/C/EMULATOR/GPU.c:551
							if(gpu_cache_read[i] == (addr & L1CACHE_ADDR_MASK)) {
     c15:	41 3b 13             	cmp    edx,DWORD PTR [r11]
     c18:	74 36                	je     c50 <gpu_run+0x800>
     c1a:	41 3b 53 04          	cmp    edx,DWORD PTR [r11+0x4]
     c1e:	74 30                	je     c50 <gpu_run+0x800>
     c20:	41 3b 53 08          	cmp    edx,DWORD PTR [r11+0x8]
     c24:	74 2a                	je     c50 <gpu_run+0x800>
     c26:	41 3b 53 0c          	cmp    edx,DWORD PTR [r11+0xc]
     c2a:	74 24                	je     c50 <gpu_run+0x800>
     c2c:	41 3b 53 10          	cmp    edx,DWORD PTR [r11+0x10]
     c30:	74 1e                	je     c50 <gpu_run+0x800>
     c32:	41 3b 53 14          	cmp    edx,DWORD PTR [r11+0x14]
     c36:	74 18                	je     c50 <gpu_run+0x800>
     c38:	41 3b 53 18          	cmp    edx,DWORD PTR [r11+0x18]
     c3c:	74 12                	je     c50 <gpu_run+0x800>
     c3e:	49 83 c3 20          	add    r11,0x20
     c42:	41 3b 53 fc          	cmp    edx,DWORD PTR [r11-0x4]
     c46:	75 c4                	jne    c0c <gpu_run+0x7bc>
     c48:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
     c4f:	00 
     c50:	44 8d 4e 01          	lea    r9d,[rsi+0x1]
/home/simon/prog/C/EMULATOR/GPU.c:619 (discriminator 2)
					noadd_rd32://the goto in the loop above lands here

					//if(i == 0) {
					//	printf("%i = [%i(%i),%i(%i) (%i)] (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,addr,*(uint32_t*)(memory+addr));
					//}
					A[indx].i = *(uint32_t*)(memory+addr);
     c54:	8b 88 00 00 00 00    	mov    ecx,DWORD PTR [rax+0x0]
     c5a:	48 83 c6 01          	add    rsi,0x1
/home/simon/prog/C/EMULATOR/GPU.c:543 (discriminator 2)
				uint32_t tmpCycles = 6;//3*2, minimum time for instruction
				uint32_t tmp = 0;
				uint32_t lastAddr = -1;
				bool lastCache = false;//did the last memory read come from L2 cache
				bool lastMem = false;//did the last memory read come from memory
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     c5e:	45 39 cf             	cmp    r15d,r9d
/home/simon/prog/C/EMULATOR/GPU.c:619 (discriminator 2)
					noadd_rd32://the goto in the loop above lands here

					//if(i == 0) {
					//	printf("%i = [%i(%i),%i(%i) (%i)] (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,addr,*(uint32_t*)(memory+addr));
					//}
					A[indx].i = *(uint32_t*)(memory+addr);
     c61:	89 0c bb             	mov    DWORD PTR [rbx+rdi*4],ecx
/home/simon/prog/C/EMULATOR/GPU.c:543 (discriminator 2)
				uint32_t tmpCycles = 6;//3*2, minimum time for instruction
				uint32_t tmp = 0;
				uint32_t lastAddr = -1;
				bool lastCache = false;//did the last memory read come from L2 cache
				bool lastMem = false;//did the last memory read come from memory
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     c64:	0f 8f 8e fe ff ff    	jg     af8 <gpu_run+0x6a8>
     c6a:	80 7c 24 3b 00       	cmp    BYTE PTR [rsp+0x3b],0x0
     c6f:	44 8b 6c 24 3c       	mov    r13d,DWORD PTR [rsp+0x3c]
     c74:	44 89 15 00 00 00 00 	mov    DWORD PTR [rip+0x0],r10d        # c7b <gpu_run+0x82b>
     c7b:	0f 85 8b 51 00 00    	jne    5e0c <gpu_run+0x59bc>
/home/simon/prog/C/EMULATOR/GPU.c:621
					//if(i == 0) {
					//	printf("%i = [%i(%i),%i(%i) (%i)] (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,addr,*(uint32_t*)(memory+addr));
					//}
					A[indx].i = *(uint32_t*)(memory+addr);
	      		}
				if(lastAddr != -1) {//memory access during operation
     c81:	83 7c 24 20 ff       	cmp    DWORD PTR [rsp+0x20],0xffffffff
     c86:	0f 84 42 46 00 00    	je     52ce <gpu_run+0x4e7e>
/home/simon/prog/C/EMULATOR/GPU.c:622
					mem_busy_until = cycles + (tmpCycles+1+GPU_TRP)>>1;//row precharge post-operation
     c8c:	44 8b 5c 24 10       	mov    r11d,DWORD PTR [rsp+0x10]
     c91:	44 89 da             	mov    edx,r11d
     c94:	44 89 d8             	mov    eax,r11d
     c97:	83 c2 04             	add    edx,0x4
     c9a:	48 03 54 24 08       	add    rdx,QWORD PTR [rsp+0x8]
     c9f:	83 c0 01             	add    eax,0x1
     ca2:	d1 e8                	shr    eax,1
     ca4:	48 d1 ea             	shr    rdx,1
     ca7:	48 89 15 00 00 00 00 	mov    QWORD PTR [rip+0x0],rdx        # cae <gpu_run+0x85e>
/home/simon/prog/C/EMULATOR/GPU.c:624
				}
				cycles += (tmpCycles+1)>>1;
     cae:	48 01 44 24 08       	add    QWORD PTR [rsp+0x8],rax
/home/simon/prog/C/EMULATOR/GPU.c:158
		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOOP;
	}

	while(numThreadsRunning) {
		//abort execution if address exceeds some amount
		if(currentPC >= GPU_COMMAND_BUFFER_SIZE) {
     cb3:	41 81 fd ff 0f 00 00 	cmp    r13d,0xfff
     cba:	0f 86 d0 f7 ff ff    	jbe    490 <gpu_run+0x40>
/home/simon/prog/C/EMULATOR/GPU.c:160
			numThreadsRunning = 0;
			GPU_EXIT_CODE = GPU_EXIT_CODE_ABORT;
     cc0:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # cca <gpu_run+0x87a>
     cc7:	00 00 00 
     cca:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
/home/simon/prog/C/EMULATOR/GPU.c:161
			GPU_EXIT_PC = currentPC;
     ccf:	44 89 2d 00 00 00 00 	mov    DWORD PTR [rip+0x0],r13d        # cd6 <gpu_run+0x886>
/home/simon/prog/C/EMULATOR/GPU.c:162
			GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_CODEBOUNDS;
     cd6:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # ce0 <gpu_run+0x890>
     cdd:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:163
			break;
     ce0:	e9 3a f9 ff ff       	jmp    61f <gpu_run+0x1cf>
     ce5:	0f 1f 00             	nop    DWORD PTR [rax]
     ce8:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
/home/simon/prog/C/EMULATOR/GPU.c:492
				currentPC = NEXT_EXEC_SPAN->PC;
				mergeNextSpan();
				break;
			case GPUOP_WR32:
				{
					if (cycles < mem_busy_until) {
     ced:	4c 8b 05 00 00 00 00 	mov    r8,QWORD PTR [rip+0x0]        # cf4 <gpu_run+0x8a4>
/home/simon/prog/C/EMULATOR/GPU.c:501
					uint32_t cyclesAccum = 0;
					uint32_t lastAddr = -1;
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     cf4:	44 8b 15 00 00 00 00 	mov    r10d,DWORD PTR [rip+0x0]        # cfb <gpu_run+0x8ab>
     cfb:	49 39 f8             	cmp    r8,rdi
     cfe:	4c 0f 42 c7          	cmovb  r8,rdi
     d02:	45 85 d2             	test   r10d,r10d
     d05:	4c 89 44 24 08       	mov    QWORD PTR [rsp+0x8],r8
     d0a:	0f 8e d6 50 00 00    	jle    5de6 <gpu_run+0x5996>
/home/simon/prog/C/EMULATOR/GPU.c:503
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
     d10:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # d17 <gpu_run+0x8c7>
     d17:	45 8d 7a ff          	lea    r15d,[r10-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:501
					uint32_t cyclesAccum = 0;
					uint32_t lastAddr = -1;
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     d1b:	45 31 c0             	xor    r8d,r8d
     d1e:	45 31 c9             	xor    r9d,r9d
/home/simon/prog/C/EMULATOR/GPU.c:506
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
						if(first) {
							first = false;
							tmpCycles += GPU_TRCD+1;
     d21:	bf 04 00 00 00       	mov    edi,0x4
     d26:	4e 8d 14 bd 00 00 00 	lea    r10,[r15*4+0x0]
     d2d:	00 
     d2e:	41 83 e7 01          	and    r15d,0x1
/home/simon/prog/C/EMULATOR/GPU.c:503
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
     d32:	48 c1 e1 02          	shl    rcx,0x2
     d36:	44 8b b4 31 00 00 00 	mov    r14d,DWORD PTR [rcx+rsi*1+0x0]
     d3d:	00 
     d3e:	44 8b 9c 11 00 00 00 	mov    r11d,DWORD PTR [rcx+rdx*1+0x0]
     d45:	00 
/home/simon/prog/C/EMULATOR/GPU.c:530
							merged = false;
							tmpCycles += 1;
						}
						lastAddr = addr;

						*(uint32_t*)(memory+addr) = A[indx].i;
     d46:	8b 8c 01 00 00 00 00 	mov    ecx,DWORD PTR [rcx+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:503
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
     d4d:	41 81 e6 ff 03 00 00 	and    r14d,0x3ff
     d54:	41 81 e3 ff 03 00 00 	and    r11d,0x3ff
     d5b:	41 c1 e6 0a          	shl    r14d,0xa
     d5f:	45 01 de             	add    r14d,r11d
     d62:	41 c1 e6 02          	shl    r14d,0x2
/home/simon/prog/C/EMULATOR/GPU.c:530
							merged = false;
							tmpCycles += 1;
						}
						lastAddr = addr;

						*(uint32_t*)(memory+addr) = A[indx].i;
     d66:	41 89 8e 00 00 00 00 	mov    DWORD PTR [r14+0x0],ecx
     d6d:	b9 00 00 00 00       	mov    ecx,0x0
/home/simon/prog/C/EMULATOR/GPU.c:503
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
     d72:	4d 89 f3             	mov    r11,r14
/home/simon/prog/C/EMULATOR/GPU.c:501
					uint32_t cyclesAccum = 0;
					uint32_t lastAddr = -1;
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     d75:	4c 39 d1             	cmp    rcx,r10
     d78:	0f 84 87 44 00 00    	je     5205 <gpu_run+0x4db5>
     d7e:	4d 85 ff             	test   r15,r15
     d81:	0f 84 23 01 00 00    	je     eaa <gpu_run+0xa5a>
/home/simon/prog/C/EMULATOR/GPU.c:503
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
     d87:	4c 63 35 00 00 00 00 	movsxd r14,DWORD PTR [rip+0x0]        # d8e <gpu_run+0x93e>
     d8e:	49 c1 e6 02          	shl    r14,0x2
     d92:	42 8b b4 36 00 00 00 	mov    esi,DWORD PTR [rsi+r14*1+0x0]
     d99:	00 
     d9a:	42 8b 94 32 00 00 00 	mov    edx,DWORD PTR [rdx+r14*1+0x0]
     da1:	00 
     da2:	81 e6 ff 03 00 00    	and    esi,0x3ff
     da8:	81 e2 ff 03 00 00    	and    edx,0x3ff
     dae:	c1 e6 0a             	shl    esi,0xa
     db1:	01 f2                	add    edx,esi
     db3:	c1 e2 02             	shl    edx,0x2
/home/simon/prog/C/EMULATOR/GPU.c:507
						if(first) {
							first = false;
							tmpCycles += GPU_TRCD+1;
						} else if(((addr^lastAddr) & 0xfffffff8) == lastAddr) {//both were merged into one write
     db6:	89 d6                	mov    esi,edx
     db8:	44 31 de             	xor    esi,r11d
     dbb:	41 89 f7             	mov    r15d,esi
     dbe:	41 83 e7 f8          	and    r15d,0xfffffff8
     dc2:	45 39 df             	cmp    r15d,r11d
     dc5:	0f 84 c9 4c 00 00    	je     5a94 <gpu_run+0x5644>
/home/simon/prog/C/EMULATOR/GPU.c:514
								merged = false;
								tmpCycles += 1;
							} else {
								merged = true;
							}
						} else if((addr ^ lastAddr) & BANK_MASK) {
     dcb:	f7 c6 00 10 00 00    	test   esi,0x1000
     dd1:	0f 85 06 44 00 00    	jne    51dd <gpu_run+0x4d8d>
/home/simon/prog/C/EMULATOR/GPU.c:519
							merged = false;
							if(tmpCycles < (GPU_TRAS-1)) tmpCycles = GPU_TRAS-1;//we load the row in the other bank first, so we can delay precharge one cycle.
							cyclesAccum += tmpCycles;
							tmpCycles = GPU_TRCD+1;
						} else if(((addr ^ lastAddr) & ROW_MASK) != 0) {
     dd7:	81 e6 00 e8 7f 00    	and    esi,0x7fe800
     ddd:	0f 84 57 4f 00 00    	je     5d3a <gpu_run+0x58ea>
/home/simon/prog/C/EMULATOR/GPU.c:522
							merged = false;
							if(tmpCycles < GPU_TRAS) tmpCycles = GPU_TRAS;
							cyclesAccum += tmpCycles+GPU_TRP;
     de3:	41 b9 09 00 00 00    	mov    r9d,0x9
     de9:	e9 f5 43 00 00       	jmp    51e3 <gpu_run+0x4d93>
     dee:	66 90                	xchg   ax,ax
/home/simon/prog/C/EMULATOR/GPU.c:514
								merged = false;
								tmpCycles += 1;
							} else {
								merged = true;
							}
						} else if((addr ^ lastAddr) & BANK_MASK) {
     df0:	f6 c4 10             	test   ah,0x10
     df3:	0f 84 87 42 00 00    	je     5080 <gpu_run+0x4c30>
/home/simon/prog/C/EMULATOR/GPU.c:516
							merged = false;
							if(tmpCycles < (GPU_TRAS-1)) tmpCycles = GPU_TRAS-1;//we load the row in the other bank first, so we can delay precharge one cycle.
     df9:	83 ff 04             	cmp    edi,0x4
     dfc:	41 be 05 00 00 00    	mov    r14d,0x5
     e02:	41 0f 46 fe          	cmovbe edi,r14d
/home/simon/prog/C/EMULATOR/GPU.c:515
								tmpCycles += 1;
							} else {
								merged = true;
							}
						} else if((addr ^ lastAddr) & BANK_MASK) {
							merged = false;
     e06:	45 31 ff             	xor    r15d,r15d
/home/simon/prog/C/EMULATOR/GPU.c:517
							if(tmpCycles < (GPU_TRAS-1)) tmpCycles = GPU_TRAS-1;//we load the row in the other bank first, so we can delay precharge one cycle.
							cyclesAccum += tmpCycles;
     e09:	41 01 f9             	add    r9d,edi
/home/simon/prog/C/EMULATOR/GPU.c:518
							tmpCycles = GPU_TRCD+1;
     e0c:	bf 04 00 00 00       	mov    edi,0x4
/home/simon/prog/C/EMULATOR/GPU.c:530 (discriminator 2)
							merged = false;
							tmpCycles += 1;
						}
						lastAddr = addr;

						*(uint32_t*)(memory+addr) = A[indx].i;
     e11:	8b 34 b3             	mov    esi,DWORD PTR [rbx+rsi*4]
     e14:	89 d0                	mov    eax,edx
     e16:	89 b0 00 00 00 00    	mov    DWORD PTR [rax+0x0],esi
     e1c:	48 8d 71 04          	lea    rsi,[rcx+0x4]
/home/simon/prog/C/EMULATOR/GPU.c:503 (discriminator 2)
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
     e20:	48 63 49 04          	movsxd rcx,DWORD PTR [rcx+0x4]
     e24:	45 8b 34 8c          	mov    r14d,DWORD PTR [r12+rcx*4]
     e28:	44 8b 5c 8d 00       	mov    r11d,DWORD PTR [rbp+rcx*4+0x0]
     e2d:	41 81 e6 ff 03 00 00 	and    r14d,0x3ff
     e34:	41 81 e3 ff 03 00 00 	and    r11d,0x3ff
     e3b:	41 c1 e6 0a          	shl    r14d,0xa
     e3f:	45 01 de             	add    r14d,r11d
     e42:	41 c1 e6 02          	shl    r14d,0x2
/home/simon/prog/C/EMULATOR/GPU.c:507 (discriminator 2)
						if(first) {
							first = false;
							tmpCycles += GPU_TRCD+1;
						} else if(((addr^lastAddr) & 0xfffffff8) == lastAddr) {//both were merged into one write
     e46:	44 89 f0             	mov    eax,r14d
     e49:	31 d0                	xor    eax,edx
     e4b:	41 89 c0             	mov    r8d,eax
     e4e:	41 83 e0 f8          	and    r8d,0xfffffff8
     e52:	41 39 d0             	cmp    r8d,edx
     e55:	0f 84 95 42 00 00    	je     50f0 <gpu_run+0x4ca0>
/home/simon/prog/C/EMULATOR/GPU.c:514
								merged = false;
								tmpCycles += 1;
							} else {
								merged = true;
							}
						} else if((addr ^ lastAddr) & BANK_MASK) {
     e5b:	f6 c4 10             	test   ah,0x10
     e5e:	0f 85 fc 41 00 00    	jne    5060 <gpu_run+0x4c10>
/home/simon/prog/C/EMULATOR/GPU.c:519
							merged = false;
							if(tmpCycles < (GPU_TRAS-1)) tmpCycles = GPU_TRAS-1;//we load the row in the other bank first, so we can delay precharge one cycle.
							cyclesAccum += tmpCycles;
							tmpCycles = GPU_TRCD+1;
						} else if(((addr ^ lastAddr) & ROW_MASK) != 0) {
     e64:	a9 00 e8 7f 00       	test   eax,0x7fe800
     e69:	0f 84 41 42 00 00    	je     50b0 <gpu_run+0x4c60>
/home/simon/prog/C/EMULATOR/GPU.c:521
							merged = false;
							if(tmpCycles < GPU_TRAS) tmpCycles = GPU_TRAS;
     e6f:	83 ff 05             	cmp    edi,0x5
     e72:	ba 06 00 00 00       	mov    edx,0x6
     e77:	0f 46 fa             	cmovbe edi,edx
/home/simon/prog/C/EMULATOR/GPU.c:520
							merged = false;
							if(tmpCycles < (GPU_TRAS-1)) tmpCycles = GPU_TRAS-1;//we load the row in the other bank first, so we can delay precharge one cycle.
							cyclesAccum += tmpCycles;
							tmpCycles = GPU_TRCD+1;
						} else if(((addr ^ lastAddr) & ROW_MASK) != 0) {
							merged = false;
     e7a:	45 31 c0             	xor    r8d,r8d
/home/simon/prog/C/EMULATOR/GPU.c:522
							if(tmpCycles < GPU_TRAS) tmpCycles = GPU_TRAS;
							cyclesAccum += tmpCycles+GPU_TRP;
     e7d:	45 8d 4c 39 03       	lea    r9d,[r9+rdi*1+0x3]
/home/simon/prog/C/EMULATOR/GPU.c:523
							tmpCycles = GPU_TRCD+1;//TRCD and TRAS overlap
     e82:	bf 04 00 00 00       	mov    edi,0x4
     e87:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
     e8e:	00 00 
/home/simon/prog/C/EMULATOR/GPU.c:530
							merged = false;
							tmpCycles += 1;
						}
						lastAddr = addr;

						*(uint32_t*)(memory+addr) = A[indx].i;
     e90:	8b 0c 8b             	mov    ecx,DWORD PTR [rbx+rcx*4]
     e93:	45 89 f3             	mov    r11d,r14d
     e96:	41 89 8b 00 00 00 00 	mov    DWORD PTR [r11+0x0],ecx
     e9d:	48 8d 4e 04          	lea    rcx,[rsi+0x4]
/home/simon/prog/C/EMULATOR/GPU.c:501
					uint32_t cyclesAccum = 0;
					uint32_t lastAddr = -1;
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
     ea1:	4c 39 d1             	cmp    rcx,r10
     ea4:	0f 84 5b 43 00 00    	je     5205 <gpu_run+0x4db5>
/home/simon/prog/C/EMULATOR/GPU.c:503
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
     eaa:	48 63 31             	movsxd rsi,DWORD PTR [rcx]
     ead:	41 8b 14 b4          	mov    edx,DWORD PTR [r12+rsi*4]
     eb1:	44 8b 7c b5 00       	mov    r15d,DWORD PTR [rbp+rsi*4+0x0]
     eb6:	81 e2 ff 03 00 00    	and    edx,0x3ff
     ebc:	41 81 e7 ff 03 00 00 	and    r15d,0x3ff
     ec3:	c1 e2 0a             	shl    edx,0xa
     ec6:	44 01 fa             	add    edx,r15d
     ec9:	c1 e2 02             	shl    edx,0x2
/home/simon/prog/C/EMULATOR/GPU.c:507
						if(first) {
							first = false;
							tmpCycles += GPU_TRCD+1;
						} else if(((addr^lastAddr) & 0xfffffff8) == lastAddr) {//both were merged into one write
     ecc:	89 d0                	mov    eax,edx
     ece:	44 31 f0             	xor    eax,r14d
     ed1:	41 89 c3             	mov    r11d,eax
     ed4:	41 83 e3 f8          	and    r11d,0xfffffff8
     ed8:	45 39 f3             	cmp    r11d,r14d
     edb:	0f 85 0f ff ff ff    	jne    df0 <gpu_run+0x9a0>
/home/simon/prog/C/EMULATOR/GPU.c:508
							if(merged) {
     ee1:	45 84 c0             	test   r8b,r8b
     ee4:	0f 85 d6 41 00 00    	jne    50c0 <gpu_run+0x4c70>
/home/simon/prog/C/EMULATOR/GPU.c:512
								merged = false;
								tmpCycles += 1;
							} else {
								merged = true;
     eea:	41 bf 01 00 00 00    	mov    r15d,0x1
     ef0:	e9 1c ff ff ff       	jmp    e11 <gpu_run+0x9c1>
     ef5:	0f 1f 00             	nop    DWORD PTR [rax]
     ef8:	44 8b 35 00 00 00 00 	mov    r14d,DWORD PTR [rip+0x0]        # eff <gpu_run+0xaaf>
/home/simon/prog/C/EMULATOR/GPU.c:469
				GPU_ACTIVE_THREADS = 0;
				currentPC = NEXT_EXEC_SPAN->PC;
				mergeNextSpan();
				break;
			case GPUOP_BRZ://branch on zero
				cycles += 3+GPU_CORE_COUNT;
     eff:	48 83 44 24 08 23    	add    QWORD PTR [rsp+0x8],0x23
/home/simon/prog/C/EMULATOR/GPU.c:470
				while(GPU_ACTIVE_THREADS) {
     f05:	4c 8b 25 00 00 00 00 	mov    r12,QWORD PTR [rip+0x0]        # f0c <gpu_run+0xabc>
     f0c:	45 85 f6             	test   r14d,r14d
     f0f:	0f 84 f7 02 00 00    	je     120c <gpu_run+0xdbc>
     f15:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:471
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
     f18:	41 83 ee 01          	sub    r14d,0x1
/home/simon/prog/C/EMULATOR/GPU.c:195
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
     f1c:	45 89 ef             	mov    r15d,r13d
/home/simon/prog/C/EMULATOR/GPU.c:471
				mergeNextSpan();
				break;
			case GPUOP_BRZ://branch on zero
				cycles += 3+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
     f1f:	49 63 f6             	movsxd rsi,r14d
     f22:	44 89 35 00 00 00 00 	mov    DWORD PTR [rip+0x0],r14d        # f29 <gpu_run+0xad9>
     f29:	4c 63 04 b5 00 00 00 	movsxd r8,DWORD PTR [rsi*4+0x0]
     f30:	00 
/home/simon/prog/C/EMULATOR/GPU.c:472
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
     f31:	46 8b 5c 85 00       	mov    r11d,DWORD PTR [rbp+r8*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:471
				mergeNextSpan();
				break;
			case GPUOP_BRZ://branch on zero
				cycles += 3+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
     f36:	4c 89 c2             	mov    rdx,r8
/home/simon/prog/C/EMULATOR/GPU.c:472
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
     f39:	45 85 db             	test   r11d,r11d
     f3c:	75 04                	jne    f42 <gpu_run+0xaf2>
/home/simon/prog/C/EMULATOR/GPU.c:472 (discriminator 1)
     f3e:	46 8b 3c 83          	mov    r15d,DWORD PTR [rbx+r8*4]
getEmptySpan():
/home/simon/prog/C/EMULATOR/GPU.c:129 (discriminator 4)
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
	free(tmp);
}

execSpan* getEmptySpan(uint32_t PC) {
	execSpan *ret = (execSpan*)malloc(sizeof(execSpan));
     f42:	bf 30 00 00 00       	mov    edi,0x30
     f47:	89 54 24 10          	mov    DWORD PTR [rsp+0x10],edx
     f4b:	e8 00 00 00 00       	call   f50 <gpu_run+0xb00>
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:474 (discriminator 4)
				cycles += 3+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
     f50:	8b 4c 24 10          	mov    ecx,DWORD PTR [rsp+0x10]
/home/simon/prog/C/EMULATOR/GPU.c:475 (discriminator 4)
					while(GPU_ACTIVE_THREADS) {
     f54:	45 85 f6             	test   r14d,r14d
getEmptySpan():
/home/simon/prog/C/EMULATOR/GPU.c:130 (discriminator 4)
	free(tmp);
}

execSpan* getEmptySpan(uint32_t PC) {
	execSpan *ret = (execSpan*)malloc(sizeof(execSpan));
	ret->PC = PC;
     f57:	44 89 78 08          	mov    DWORD PTR [rax+0x8],r15d
/home/simon/prog/C/EMULATOR/GPU.c:131 (discriminator 4)
	ret->next = 0;
     f5b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:474 (discriminator 4)
				cycles += 3+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
     f62:	c7 40 0c 01 00 00 00 	mov    DWORD PTR [rax+0xc],0x1
     f69:	88 48 10             	mov    BYTE PTR [rax+0x10],cl
/home/simon/prog/C/EMULATOR/GPU.c:475 (discriminator 4)
					while(GPU_ACTIVE_THREADS) {
     f6c:	0f 84 3e 02 00 00    	je     11b0 <gpu_run+0xd60>
     f72:	45 8d 56 ff          	lea    r10d,[r14-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:195
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
     f76:	44 89 ea             	mov    edx,r13d
     f79:	49 63 fa             	movsxd rdi,r10d
     f7c:	45 89 d1             	mov    r9d,r10d
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
     f7f:	4c 63 04 bd 00 00 00 	movsxd r8,DWORD PTR [rdi*4+0x0]
     f86:	00 
     f87:	41 83 e1 03          	and    r9d,0x3
     f8b:	48 89 fe             	mov    rsi,rdi
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
     f8e:	42 8b 4c 85 00       	mov    ecx,DWORD PTR [rbp+r8*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
     f93:	4d 89 c3             	mov    r11,r8
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
     f96:	85 c9                	test   ecx,ecx
     f98:	75 04                	jne    f9e <gpu_run+0xb4e>
     f9a:	42 8b 14 83          	mov    edx,DWORD PTR [rbx+r8*4]
/home/simon/prog/C/EMULATOR/GPU.c:478
						if(tmpPC != spanPC) {
     f9e:	41 39 d7             	cmp    r15d,edx
     fa1:	0f 85 09 02 00 00    	jne    11b0 <gpu_run+0xd60>
/home/simon/prog/C/EMULATOR/GPU.c:481
							break;
						}
						span->index[span->count++] = indx;
     fa7:	4c 63 70 0c          	movsxd r14,DWORD PTR [rax+0xc]
/home/simon/prog/C/EMULATOR/GPU.c:475
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
     fab:	85 f6                	test   esi,esi
/home/simon/prog/C/EMULATOR/GPU.c:481
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
						if(tmpPC != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
     fad:	45 8d 56 01          	lea    r10d,[r14+0x1]
     fb1:	44 89 50 0c          	mov    DWORD PTR [rax+0xc],r10d
     fb5:	46 88 5c 30 10       	mov    BYTE PTR [rax+r14*1+0x10],r11b
     fba:	41 89 f6             	mov    r14d,esi
/home/simon/prog/C/EMULATOR/GPU.c:475
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
     fbd:	0f 84 e3 01 00 00    	je     11a6 <gpu_run+0xd56>
     fc3:	45 85 c9             	test   r9d,r9d
     fc6:	0f 84 d6 00 00 00    	je     10a2 <gpu_run+0xc52>
     fcc:	41 83 f9 01          	cmp    r9d,0x1
     fd0:	0f 84 84 00 00 00    	je     105a <gpu_run+0xc0a>
     fd6:	41 83 f9 02          	cmp    r9d,0x2
     fda:	74 40                	je     101c <gpu_run+0xbcc>
     fdc:	44 8d 4e ff          	lea    r9d,[rsi-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:195
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
     fe0:	44 89 e9             	mov    ecx,r13d
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
     fe3:	49 63 f9             	movsxd rdi,r9d
     fe6:	4c 63 1c bd 00 00 00 	movsxd r11,DWORD PTR [rdi*4+0x0]
     fed:	00 
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
     fee:	46 8b 44 9d 00       	mov    r8d,DWORD PTR [rbp+r11*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
     ff3:	4c 89 de             	mov    rsi,r11
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
     ff6:	45 85 c0             	test   r8d,r8d
     ff9:	75 04                	jne    fff <gpu_run+0xbaf>
     ffb:	42 8b 0c 9b          	mov    ecx,DWORD PTR [rbx+r11*4]
/home/simon/prog/C/EMULATOR/GPU.c:478
						if(tmpPC != spanPC) {
     fff:	41 39 cf             	cmp    r15d,ecx
    1002:	0f 85 f8 4d 00 00    	jne    5e00 <gpu_run+0x59b0>
/home/simon/prog/C/EMULATOR/GPU.c:481
							break;
						}
						span->index[span->count++] = indx;
    1008:	48 63 50 0c          	movsxd rdx,DWORD PTR [rax+0xc]
    100c:	44 8d 72 01          	lea    r14d,[rdx+0x1]
    1010:	44 89 70 0c          	mov    DWORD PTR [rax+0xc],r14d
    1014:	40 88 74 10 10       	mov    BYTE PTR [rax+rdx*1+0x10],sil
    1019:	45 89 ce             	mov    r14d,r9d
    101c:	45 8d 56 ff          	lea    r10d,[r14-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:195
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
    1020:	45 89 e8             	mov    r8d,r13d
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    1023:	4d 63 ca             	movsxd r9,r10d
    1026:	4a 63 3c 8d 00 00 00 	movsxd rdi,DWORD PTR [r9*4+0x0]
    102d:	00 
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    102e:	44 8b 5c bd 00       	mov    r11d,DWORD PTR [rbp+rdi*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    1033:	48 89 fe             	mov    rsi,rdi
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    1036:	45 85 db             	test   r11d,r11d
    1039:	75 04                	jne    103f <gpu_run+0xbef>
    103b:	44 8b 04 bb          	mov    r8d,DWORD PTR [rbx+rdi*4]
/home/simon/prog/C/EMULATOR/GPU.c:478
						if(tmpPC != spanPC) {
    103f:	45 39 c7             	cmp    r15d,r8d
    1042:	0f 85 b8 4d 00 00    	jne    5e00 <gpu_run+0x59b0>
/home/simon/prog/C/EMULATOR/GPU.c:481
							break;
						}
						span->index[span->count++] = indx;
    1048:	48 63 48 0c          	movsxd rcx,DWORD PTR [rax+0xc]
    104c:	45 89 d6             	mov    r14d,r10d
    104f:	8d 51 01             	lea    edx,[rcx+0x1]
    1052:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
    1055:	40 88 74 08 10       	mov    BYTE PTR [rax+rcx*1+0x10],sil
    105a:	45 8d 4e ff          	lea    r9d,[r14-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:195
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
    105e:	45 89 e8             	mov    r8d,r13d
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    1061:	4d 63 d1             	movsxd r10,r9d
    1064:	4a 63 3c 95 00 00 00 	movsxd rdi,DWORD PTR [r10*4+0x0]
    106b:	00 
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    106c:	44 8b 5c bd 00       	mov    r11d,DWORD PTR [rbp+rdi*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    1071:	48 89 fe             	mov    rsi,rdi
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    1074:	45 85 db             	test   r11d,r11d
    1077:	75 04                	jne    107d <gpu_run+0xc2d>
    1079:	44 8b 04 bb          	mov    r8d,DWORD PTR [rbx+rdi*4]
/home/simon/prog/C/EMULATOR/GPU.c:478
						if(tmpPC != spanPC) {
    107d:	45 39 c7             	cmp    r15d,r8d
    1080:	0f 85 7a 4d 00 00    	jne    5e00 <gpu_run+0x59b0>
/home/simon/prog/C/EMULATOR/GPU.c:481
							break;
						}
						span->index[span->count++] = indx;
    1086:	4c 63 70 0c          	movsxd r14,DWORD PTR [rax+0xc]
/home/simon/prog/C/EMULATOR/GPU.c:475
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
    108a:	45 85 c9             	test   r9d,r9d
/home/simon/prog/C/EMULATOR/GPU.c:481
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
						if(tmpPC != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    108d:	41 8d 4e 01          	lea    ecx,[r14+0x1]
    1091:	89 48 0c             	mov    DWORD PTR [rax+0xc],ecx
    1094:	42 88 74 30 10       	mov    BYTE PTR [rax+r14*1+0x10],sil
    1099:	45 89 ce             	mov    r14d,r9d
/home/simon/prog/C/EMULATOR/GPU.c:475
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
    109c:	0f 84 04 01 00 00    	je     11a6 <gpu_run+0xd56>
    10a2:	41 8d 56 ff          	lea    edx,[r14-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:195
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
    10a6:	45 89 eb             	mov    r11d,r13d
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    10a9:	4c 63 ca             	movsxd r9,edx
    10ac:	4e 63 14 8d 00 00 00 	movsxd r10,DWORD PTR [r9*4+0x0]
    10b3:	00 
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    10b4:	42 8b 7c 95 00       	mov    edi,DWORD PTR [rbp+r10*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    10b9:	4c 89 d6             	mov    rsi,r10
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    10bc:	85 ff                	test   edi,edi
    10be:	75 04                	jne    10c4 <gpu_run+0xc74>
/home/simon/prog/C/EMULATOR/GPU.c:477 (discriminator 1)
    10c0:	46 8b 1c 93          	mov    r11d,DWORD PTR [rbx+r10*4]
/home/simon/prog/C/EMULATOR/GPU.c:478 (discriminator 4)
						if(tmpPC != spanPC) {
    10c4:	45 39 df             	cmp    r15d,r11d
    10c7:	0f 85 33 4d 00 00    	jne    5e00 <gpu_run+0x59b0>
    10cd:	8d 4a ff             	lea    ecx,[rdx-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:481
							break;
						}
						span->index[span->count++] = indx;
    10d0:	4c 63 40 0c          	movsxd r8,DWORD PTR [rax+0xc]
/home/simon/prog/C/EMULATOR/GPU.c:195
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
    10d4:	45 89 eb             	mov    r11d,r13d
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    10d7:	4c 63 c9             	movsxd r9,ecx
    10da:	4e 63 14 8d 00 00 00 	movsxd r10,DWORD PTR [r9*4+0x0]
    10e1:	00 
/home/simon/prog/C/EMULATOR/GPU.c:481
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
						if(tmpPC != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    10e2:	45 8d 70 01          	lea    r14d,[r8+0x1]
    10e6:	44 89 70 0c          	mov    DWORD PTR [rax+0xc],r14d
    10ea:	42 88 74 00 10       	mov    BYTE PTR [rax+r8*1+0x10],sil
    10ef:	41 89 d6             	mov    r14d,edx
/home/simon/prog/C/EMULATOR/GPU.c:477
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    10f2:	42 8b 7c 95 00       	mov    edi,DWORD PTR [rbp+r10*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    10f7:	4c 89 d6             	mov    rsi,r10
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    10fa:	85 ff                	test   edi,edi
    10fc:	75 04                	jne    1102 <gpu_run+0xcb2>
    10fe:	46 8b 1c 93          	mov    r11d,DWORD PTR [rbx+r10*4]
/home/simon/prog/C/EMULATOR/GPU.c:478
						if(tmpPC != spanPC) {
    1102:	45 39 df             	cmp    r15d,r11d
    1105:	0f 85 f5 4c 00 00    	jne    5e00 <gpu_run+0x59b0>
    110b:	8d 4a fe             	lea    ecx,[rdx-0x2]
/home/simon/prog/C/EMULATOR/GPU.c:481
							break;
						}
						span->index[span->count++] = indx;
    110e:	4c 63 40 0c          	movsxd r8,DWORD PTR [rax+0xc]
/home/simon/prog/C/EMULATOR/GPU.c:195
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
    1112:	45 89 eb             	mov    r11d,r13d
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    1115:	4c 63 c9             	movsxd r9,ecx
    1118:	4e 63 14 8d 00 00 00 	movsxd r10,DWORD PTR [r9*4+0x0]
    111f:	00 
/home/simon/prog/C/EMULATOR/GPU.c:481
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
						if(tmpPC != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    1120:	45 8d 70 01          	lea    r14d,[r8+0x1]
    1124:	44 89 70 0c          	mov    DWORD PTR [rax+0xc],r14d
    1128:	42 88 74 00 10       	mov    BYTE PTR [rax+r8*1+0x10],sil
    112d:	44 8d 72 ff          	lea    r14d,[rdx-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:477
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    1131:	42 8b 7c 95 00       	mov    edi,DWORD PTR [rbp+r10*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    1136:	4c 89 d6             	mov    rsi,r10
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    1139:	85 ff                	test   edi,edi
    113b:	75 04                	jne    1141 <gpu_run+0xcf1>
    113d:	46 8b 1c 93          	mov    r11d,DWORD PTR [rbx+r10*4]
/home/simon/prog/C/EMULATOR/GPU.c:478
						if(tmpPC != spanPC) {
    1141:	45 39 df             	cmp    r15d,r11d
    1144:	0f 85 b6 4c 00 00    	jne    5e00 <gpu_run+0x59b0>
    114a:	8d 4a fd             	lea    ecx,[rdx-0x3]
/home/simon/prog/C/EMULATOR/GPU.c:481
							break;
						}
						span->index[span->count++] = indx;
    114d:	4c 63 40 0c          	movsxd r8,DWORD PTR [rax+0xc]
/home/simon/prog/C/EMULATOR/GPU.c:195
			mergeNextSpan();//if there are more threads here, start executing them
		}


		uint32_t inst = *(uint32_t*)(gpu_command_buffer+currentPC);
		currentPC += 4;
    1151:	45 89 eb             	mov    r11d,r13d
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    1154:	4c 63 c9             	movsxd r9,ecx
    1157:	4e 63 14 8d 00 00 00 	movsxd r10,DWORD PTR [r9*4+0x0]
    115e:	00 
/home/simon/prog/C/EMULATOR/GPU.c:481
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
						if(tmpPC != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    115f:	45 8d 70 01          	lea    r14d,[r8+0x1]
    1163:	44 89 70 0c          	mov    DWORD PTR [rax+0xc],r14d
    1167:	42 88 74 00 10       	mov    BYTE PTR [rax+r8*1+0x10],sil
    116c:	44 8d 72 fe          	lea    r14d,[rdx-0x2]
/home/simon/prog/C/EMULATOR/GPU.c:477
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    1170:	42 8b 7c 95 00       	mov    edi,DWORD PTR [rbp+r10*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:476
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    1175:	4c 89 d6             	mov    rsi,r10
/home/simon/prog/C/EMULATOR/GPU.c:477
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
    1178:	85 ff                	test   edi,edi
    117a:	75 04                	jne    1180 <gpu_run+0xd30>
    117c:	46 8b 1c 93          	mov    r11d,DWORD PTR [rbx+r10*4]
/home/simon/prog/C/EMULATOR/GPU.c:478
						if(tmpPC != spanPC) {
    1180:	45 39 df             	cmp    r15d,r11d
    1183:	0f 85 77 4c 00 00    	jne    5e00 <gpu_run+0x59b0>
/home/simon/prog/C/EMULATOR/GPU.c:481
							break;
						}
						span->index[span->count++] = indx;
    1189:	4c 63 40 0c          	movsxd r8,DWORD PTR [rax+0xc]
/home/simon/prog/C/EMULATOR/GPU.c:475
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
    118d:	83 ea 03             	sub    edx,0x3
/home/simon/prog/C/EMULATOR/GPU.c:481
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						uint32_t tmpPC = B[indx].i == 0 ? A[indx].i : currentPC;
						if(tmpPC != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    1190:	45 8d 70 01          	lea    r14d,[r8+0x1]
    1194:	44 89 70 0c          	mov    DWORD PTR [rax+0xc],r14d
    1198:	42 88 74 00 10       	mov    BYTE PTR [rax+r8*1+0x10],sil
/home/simon/prog/C/EMULATOR/GPU.c:475
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = B[indx].i == 0 ? A[indx].i : currentPC;
					execSpan* span = getEmptySpan(spanPC);
					span->index[span->count++] = indx;
					while(GPU_ACTIVE_THREADS) {
    119d:	41 89 d6             	mov    r14d,edx
    11a0:	0f 85 fc fe ff ff    	jne    10a2 <gpu_run+0xc52>
    11a6:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 11b0 <gpu_run+0xd60>
    11ad:	00 00 00 
insertExecSpan():
/home/simon/prog/C/EMULATOR/GPU.c:99
int GPU_ACTIVE_THREAD_INDEXES[GPU_CORE_COUNT] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
int GPU_ACTIVE_THREADS = GPU_CORE_COUNT;
execSpan *NEXT_EXEC_SPAN = 0;

void insertExecSpan(execSpan *span) {
	if(NEXT_EXEC_SPAN == 0 || NEXT_EXEC_SPAN->PC > span->PC) {
    11b0:	4d 85 e4             	test   r12,r12
    11b3:	0f 84 67 3e 00 00    	je     5020 <gpu_run+0x4bd0>
    11b9:	45 8b 54 24 08       	mov    r10d,DWORD PTR [r12+0x8]
    11be:	4c 89 e1             	mov    rcx,r12
    11c1:	45 39 d7             	cmp    r15d,r10d
    11c4:	73 19                	jae    11df <gpu_run+0xd8f>
    11c6:	e9 55 3e 00 00       	jmp    5020 <gpu_run+0x4bd0>
    11cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:104
		span->next = NEXT_EXEC_SPAN;
		NEXT_EXEC_SPAN = span;
	} else {
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
    11d0:	44 8b 4a 08          	mov    r9d,DWORD PTR [rdx+0x8]
    11d4:	45 39 cf             	cmp    r15d,r9d
    11d7:	76 0e                	jbe    11e7 <gpu_run+0xd97>
    11d9:	45 89 ca             	mov    r10d,r9d
    11dc:	48 89 d1             	mov    rcx,rdx
    11df:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
    11e2:	48 85 d2             	test   rdx,rdx
    11e5:	75 e9                	jne    11d0 <gpu_run+0xd80>
/home/simon/prog/C/EMULATOR/GPU.c:107
			next = next->next;
		}
		if(next->PC == span->PC) {
    11e7:	45 39 d7             	cmp    r15d,r10d
    11ea:	0f 84 30 3f 00 00    	je     5120 <gpu_run+0x4cd0>
    11f0:	44 8b 35 00 00 00 00 	mov    r14d,DWORD PTR [rip+0x0]        # 11f7 <gpu_run+0xda7>
/home/simon/prog/C/EMULATOR/GPU.c:113
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
				next->index[next->count++] = span->index[--span->count];
			}
			free(span);
		} else {
			span->next = next->next;
    11f7:	48 89 10             	mov    QWORD PTR [rax],rdx
/home/simon/prog/C/EMULATOR/GPU.c:114
			next->next = span;
    11fa:	48 89 01             	mov    QWORD PTR [rcx],rax
    11fd:	4c 89 e0             	mov    rax,r12
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:470
				currentPC = NEXT_EXEC_SPAN->PC;
				mergeNextSpan();
				break;
			case GPUOP_BRZ://branch on zero
				cycles += 3+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
    1200:	45 85 f6             	test   r14d,r14d
    1203:	49 89 c4             	mov    r12,rax
    1206:	0f 85 0c fd ff ff    	jne    f18 <gpu_run+0xac8>
mergeNextSpan():
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
    120c:	41 8b 44 24 0c       	mov    eax,DWORD PTR [r12+0xc]
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:487
						--GPU_ACTIVE_THREADS;
	              	}
					insertExecSpan(span);
				}
				GPU_ACTIVE_THREADS = 0;
				currentPC = NEXT_EXEC_SPAN->PC;
    1211:	45 8b 6c 24 08       	mov    r13d,DWORD PTR [r12+0x8]
mergeNextSpan():
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
    1216:	85 c0                	test   eax,eax
    1218:	74 35                	je     124f <gpu_run+0xdff>
    121a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:121
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
    1220:	83 e8 01             	sub    eax,0x1
    1223:	4d 63 d6             	movsxd r10,r14d
    1226:	41 83 c6 01          	add    r14d,0x1
    122a:	41 89 44 24 0c       	mov    DWORD PTR [r12+0xc],eax
    122f:	48 98                	cdqe   
    1231:	41 0f b6 7c 04 10    	movzx  edi,BYTE PTR [r12+rax*1+0x10]
    1237:	42 89 3c 95 00 00 00 	mov    DWORD PTR [r10*4+0x0],edi
    123e:	00 
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
    123f:	41 8b 44 24 0c       	mov    eax,DWORD PTR [r12+0xc]
    1244:	85 c0                	test   eax,eax
    1246:	75 d8                	jne    1220 <gpu_run+0xdd0>
    1248:	44 89 35 00 00 00 00 	mov    DWORD PTR [rip+0x0],r14d        # 124f <gpu_run+0xdff>
/home/simon/prog/C/EMULATOR/GPU.c:124
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
	}
	execSpan *tmp = NEXT_EXEC_SPAN;
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
    124f:	4d 8b 0c 24          	mov    r9,QWORD PTR [r12]
/home/simon/prog/C/EMULATOR/GPU.c:125
	free(tmp);
    1253:	4c 89 e7             	mov    rdi,r12
/home/simon/prog/C/EMULATOR/GPU.c:124
void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
	}
	execSpan *tmp = NEXT_EXEC_SPAN;
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
    1256:	4c 89 0d 00 00 00 00 	mov    QWORD PTR [rip+0x0],r9        # 125d <gpu_run+0xe0d>
/home/simon/prog/C/EMULATOR/GPU.c:125
	free(tmp);
    125d:	e8 00 00 00 00       	call   1262 <gpu_run+0xe12>
    1262:	e9 09 1c 00 00       	jmp    2e70 <gpu_run+0x2a20>
    1267:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    126e:	00 00 
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:314
				break;
			case GPUOP_MOVIL:
				{
					cycles += 1;
					uint32_t tmp = ((inst & 0xffff0000)>>16);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1270:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # 1277 <gpu_run+0xe27>
/home/simon/prog/C/EMULATOR/GPU.c:312
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_MOVIL:
				{
					cycles += 1;
    1277:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:314
					uint32_t tmp = ((inst & 0xffff0000)>>16);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    127d:	45 85 db             	test   r11d,r11d
    1280:	0f 8e ea 1b 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:316 (discriminator 3)
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = (B[indx].i & 0xffff0000)+tmp;
    1286:	48 63 3d 00 00 00 00 	movsxd rdi,DWORD PTR [rip+0x0]        # 128d <gpu_run+0xe3d>
    128d:	45 8d 43 ff          	lea    r8d,[r11-0x1]
    1291:	41 be 00 00 00 00    	mov    r14d,0x0
    1297:	4e 8d 24 85 00 00 00 	lea    r12,[r8*4+0x0]
    129e:	00 
    129f:	41 83 e0 07          	and    r8d,0x7
    12a3:	48 c1 e7 02          	shl    rdi,0x2
    12a7:	8b 8c 17 00 00 00 00 	mov    ecx,DWORD PTR [rdi+rdx*1+0x0]
    12ae:	66 31 c9             	xor    cx,cx
    12b1:	44 01 f9             	add    ecx,r15d
/home/simon/prog/C/EMULATOR/GPU.c:314 (discriminator 3)
				break;
			case GPUOP_MOVIL:
				{
					cycles += 1;
					uint32_t tmp = ((inst & 0xffff0000)>>16);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    12b4:	4d 39 e6             	cmp    r14,r12
/home/simon/prog/C/EMULATOR/GPU.c:316 (discriminator 3)
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = (B[indx].i & 0xffff0000)+tmp;
    12b7:	89 8c 07 00 00 00 00 	mov    DWORD PTR [rdi+rax*1+0x0],ecx
/home/simon/prog/C/EMULATOR/GPU.c:314 (discriminator 3)
				break;
			case GPUOP_MOVIL:
				{
					cycles += 1;
					uint32_t tmp = ((inst & 0xffff0000)>>16);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    12be:	0f 84 ac 1b 00 00    	je     2e70 <gpu_run+0x2a20>
    12c4:	4d 85 c0             	test   r8,r8
    12c7:	0f 84 2b 01 00 00    	je     13f8 <gpu_run+0xfa8>
    12cd:	49 83 f8 01          	cmp    r8,0x1
    12d1:	0f 84 f4 00 00 00    	je     13cb <gpu_run+0xf7b>
    12d7:	49 83 f8 02          	cmp    r8,0x2
    12db:	0f 84 c8 00 00 00    	je     13a9 <gpu_run+0xf59>
    12e1:	49 83 f8 03          	cmp    r8,0x3
    12e5:	0f 84 9c 00 00 00    	je     1387 <gpu_run+0xf37>
    12eb:	49 83 f8 04          	cmp    r8,0x4
    12ef:	74 77                	je     1368 <gpu_run+0xf18>
    12f1:	49 83 f8 05          	cmp    r8,0x5
    12f5:	74 50                	je     1347 <gpu_run+0xef7>
    12f7:	49 83 f8 06          	cmp    r8,0x6
    12fb:	74 28                	je     1325 <gpu_run+0xed5>
/home/simon/prog/C/EMULATOR/GPU.c:316
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = (B[indx].i & 0xffff0000)+tmp;
    12fd:	48 63 35 00 00 00 00 	movsxd rsi,DWORD PTR [rip+0x0]        # 1304 <gpu_run+0xeb4>
    1304:	41 be 00 00 00 00    	mov    r14d,0x0
    130a:	48 c1 e6 02          	shl    rsi,0x2
    130e:	44 8b 8c 32 00 00 00 	mov    r9d,DWORD PTR [rdx+rsi*1+0x0]
    1315:	00 
    1316:	66 45 31 c9          	xor    r9w,r9w
    131a:	45 01 f9             	add    r9d,r15d
    131d:	44 89 8c 30 00 00 00 	mov    DWORD PTR [rax+rsi*1+0x0],r9d
    1324:	00 
    1325:	4d 63 16             	movsxd r10,DWORD PTR [r14]
    1328:	49 83 c6 04          	add    r14,0x4
    132c:	49 c1 e2 02          	shl    r10,0x2
    1330:	46 8b 9c 12 00 00 00 	mov    r11d,DWORD PTR [rdx+r10*1+0x0]
    1337:	00 
    1338:	66 45 31 db          	xor    r11w,r11w
    133c:	45 01 fb             	add    r11d,r15d
    133f:	46 89 9c 10 00 00 00 	mov    DWORD PTR [rax+r10*1+0x0],r11d
    1346:	00 
    1347:	4d 63 06             	movsxd r8,DWORD PTR [r14]
    134a:	49 83 c6 04          	add    r14,0x4
    134e:	49 c1 e0 02          	shl    r8,0x2
    1352:	42 8b bc 02 00 00 00 	mov    edi,DWORD PTR [rdx+r8*1+0x0]
    1359:	00 
    135a:	66 31 ff             	xor    di,di
    135d:	44 01 ff             	add    edi,r15d
    1360:	42 89 bc 00 00 00 00 	mov    DWORD PTR [rax+r8*1+0x0],edi
    1367:	00 
    1368:	49 63 0e             	movsxd rcx,DWORD PTR [r14]
    136b:	49 83 c6 04          	add    r14,0x4
    136f:	48 c1 e1 02          	shl    rcx,0x2
    1373:	8b b4 0a 00 00 00 00 	mov    esi,DWORD PTR [rdx+rcx*1+0x0]
    137a:	66 31 f6             	xor    si,si
    137d:	44 01 fe             	add    esi,r15d
    1380:	89 b4 08 00 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],esi
    1387:	4d 63 0e             	movsxd r9,DWORD PTR [r14]
    138a:	49 83 c6 04          	add    r14,0x4
    138e:	49 c1 e1 02          	shl    r9,0x2
    1392:	46 8b 94 0a 00 00 00 	mov    r10d,DWORD PTR [rdx+r9*1+0x0]
    1399:	00 
    139a:	66 45 31 d2          	xor    r10w,r10w
    139e:	45 01 fa             	add    r10d,r15d
    13a1:	46 89 94 08 00 00 00 	mov    DWORD PTR [rax+r9*1+0x0],r10d
    13a8:	00 
    13a9:	4d 63 1e             	movsxd r11,DWORD PTR [r14]
    13ac:	49 83 c6 04          	add    r14,0x4
    13b0:	49 c1 e3 02          	shl    r11,0x2
    13b4:	46 8b 84 1a 00 00 00 	mov    r8d,DWORD PTR [rdx+r11*1+0x0]
    13bb:	00 
    13bc:	66 45 31 c0          	xor    r8w,r8w
    13c0:	45 01 f8             	add    r8d,r15d
    13c3:	46 89 84 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],r8d
    13ca:	00 
    13cb:	49 63 3e             	movsxd rdi,DWORD PTR [r14]
    13ce:	49 83 c6 04          	add    r14,0x4
    13d2:	48 c1 e7 02          	shl    rdi,0x2
    13d6:	8b 94 3a 00 00 00 00 	mov    edx,DWORD PTR [rdx+rdi*1+0x0]
    13dd:	66 31 d2             	xor    dx,dx
    13e0:	44 01 fa             	add    edx,r15d
/home/simon/prog/C/EMULATOR/GPU.c:314
				break;
			case GPUOP_MOVIL:
				{
					cycles += 1;
					uint32_t tmp = ((inst & 0xffff0000)>>16);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    13e3:	4d 39 e6             	cmp    r14,r12
/home/simon/prog/C/EMULATOR/GPU.c:316
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = (B[indx].i & 0xffff0000)+tmp;
    13e6:	89 94 38 00 00 00 00 	mov    DWORD PTR [rax+rdi*1+0x0],edx
/home/simon/prog/C/EMULATOR/GPU.c:314
				break;
			case GPUOP_MOVIL:
				{
					cycles += 1;
					uint32_t tmp = ((inst & 0xffff0000)>>16);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    13ed:	0f 84 7d 1a 00 00    	je     2e70 <gpu_run+0x2a20>
    13f3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:316 (discriminator 3)
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = (B[indx].i & 0xffff0000)+tmp;
    13f8:	49 63 0e             	movsxd rcx,DWORD PTR [r14]
    13fb:	49 63 76 04          	movsxd rsi,DWORD PTR [r14+0x4]
    13ff:	49 83 c6 20          	add    r14,0x20
    1403:	4d 63 56 e8          	movsxd r10,DWORD PTR [r14-0x18]
    1407:	4d 63 46 ec          	movsxd r8,DWORD PTR [r14-0x14]
    140b:	49 63 56 f0          	movsxd rdx,DWORD PTR [r14-0x10]
    140f:	8b 44 8d 00          	mov    eax,DWORD PTR [rbp+rcx*4+0x0]
    1413:	66 31 c0             	xor    ax,ax
    1416:	44 01 f8             	add    eax,r15d
    1419:	89 04 8b             	mov    DWORD PTR [rbx+rcx*4],eax
    141c:	44 8b 4c b5 00       	mov    r9d,DWORD PTR [rbp+rsi*4+0x0]
    1421:	66 45 31 c9          	xor    r9w,r9w
    1425:	45 01 f9             	add    r9d,r15d
    1428:	44 89 0c b3          	mov    DWORD PTR [rbx+rsi*4],r9d
    142c:	46 8b 5c 95 00       	mov    r11d,DWORD PTR [rbp+r10*4+0x0]
    1431:	49 63 76 f4          	movsxd rsi,DWORD PTR [r14-0xc]
    1435:	4d 63 4e f8          	movsxd r9,DWORD PTR [r14-0x8]
    1439:	66 45 31 db          	xor    r11w,r11w
    143d:	45 01 fb             	add    r11d,r15d
    1440:	46 89 1c 93          	mov    DWORD PTR [rbx+r10*4],r11d
    1444:	42 8b 7c 85 00       	mov    edi,DWORD PTR [rbp+r8*4+0x0]
    1449:	4d 63 5e fc          	movsxd r11,DWORD PTR [r14-0x4]
    144d:	66 31 ff             	xor    di,di
    1450:	44 01 ff             	add    edi,r15d
    1453:	42 89 3c 83          	mov    DWORD PTR [rbx+r8*4],edi
    1457:	8b 4c 95 00          	mov    ecx,DWORD PTR [rbp+rdx*4+0x0]
    145b:	66 31 c9             	xor    cx,cx
    145e:	44 01 f9             	add    ecx,r15d
    1461:	89 0c 93             	mov    DWORD PTR [rbx+rdx*4],ecx
    1464:	8b 44 b5 00          	mov    eax,DWORD PTR [rbp+rsi*4+0x0]
    1468:	66 31 c0             	xor    ax,ax
    146b:	44 01 f8             	add    eax,r15d
    146e:	89 04 b3             	mov    DWORD PTR [rbx+rsi*4],eax
    1471:	46 8b 54 8d 00       	mov    r10d,DWORD PTR [rbp+r9*4+0x0]
    1476:	66 45 31 d2          	xor    r10w,r10w
    147a:	45 01 fa             	add    r10d,r15d
    147d:	46 89 14 8b          	mov    DWORD PTR [rbx+r9*4],r10d
    1481:	46 8b 44 9d 00       	mov    r8d,DWORD PTR [rbp+r11*4+0x0]
    1486:	66 45 31 c0          	xor    r8w,r8w
    148a:	45 01 f8             	add    r8d,r15d
/home/simon/prog/C/EMULATOR/GPU.c:314 (discriminator 3)
				break;
			case GPUOP_MOVIL:
				{
					cycles += 1;
					uint32_t tmp = ((inst & 0xffff0000)>>16);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    148d:	4d 39 e6             	cmp    r14,r12
/home/simon/prog/C/EMULATOR/GPU.c:316 (discriminator 3)
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = (B[indx].i & 0xffff0000)+tmp;
    1490:	46 89 04 9b          	mov    DWORD PTR [rbx+r11*4],r8d
/home/simon/prog/C/EMULATOR/GPU.c:314 (discriminator 3)
				break;
			case GPUOP_MOVIL:
				{
					cycles += 1;
					uint32_t tmp = ((inst & 0xffff0000)>>16);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1494:	0f 85 5e ff ff ff    	jne    13f8 <gpu_run+0xfa8>
    149a:	e9 d1 19 00 00       	jmp    2e70 <gpu_run+0x2a20>
    149f:	90                   	nop
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    14a0:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # 14a7 <gpu_run+0x1057>
/home/simon/prog/C/EMULATOR/GPU.c:379
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = (float)B[indx].i;
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
    14a7:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:381
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    14ad:	45 85 db             	test   r11d,r11d
    14b0:	0f 8e ba 19 00 00    	jle    2e70 <gpu_run+0x2a20>
    14b6:	4d 8d 7c 24 10       	lea    r15,[r12+0x10]
    14bb:	4c 8d 4b 10          	lea    r9,[rbx+0x10]
    14bf:	4c 39 fb             	cmp    rbx,r15
    14c2:	4c 8d 7d 10          	lea    r15,[rbp+0x10]
    14c6:	41 0f 93 c2          	setae  r10b
    14ca:	4d 39 cc             	cmp    r12,r9
    14cd:	41 0f 93 c6          	setae  r14b
    14d1:	45 09 d6             	or     r14d,r10d
    14d4:	4c 39 fb             	cmp    rbx,r15
    14d7:	41 0f 93 c7          	setae  r15b
    14db:	4c 39 cd             	cmp    rbp,r9
    14de:	41 0f 93 c1          	setae  r9b
    14e2:	45 09 f9             	or     r9d,r15d
    14e5:	45 84 ce             	test   r14b,r9b
    14e8:	0f 84 aa 3f 00 00    	je     5498 <gpu_run+0x5048>
    14ee:	41 83 fb 05          	cmp    r11d,0x5
    14f2:	0f 86 a0 3f 00 00    	jbe    5498 <gpu_run+0x5048>
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    14f8:	44 0f 28 34 8d 00 00 	movaps xmm14,XMMWORD PTR [rcx*4+0x0]
    14ff:	00 00 
    1501:	45 8d 73 fc          	lea    r14d,[r11-0x4]
    1505:	44 0f 58 34 bd 00 00 	addps  xmm14,XMMWORD PTR [rdi*4+0x0]
    150c:	00 00 
    150e:	41 c1 ee 02          	shr    r14d,0x2
    1512:	45 8d 7e 01          	lea    r15d,[r14+0x1]
    1516:	41 83 e6 07          	and    r14d,0x7
    151a:	bf 01 00 00 00       	mov    edi,0x1
    151f:	41 83 ff 01          	cmp    r15d,0x1
    1523:	46 8d 14 bd 00 00 00 	lea    r10d,[r15*4+0x0]
    152a:	00 
    152b:	46 0f 29 34 85 00 00 	movaps XMMWORD PTR [r8*4+0x0],xmm14
    1532:	00 00 
    1534:	41 b8 10 00 00 00    	mov    r8d,0x10
    153a:	0f 86 29 01 00 00    	jbe    1669 <gpu_run+0x1219>
    1540:	45 85 f6             	test   r14d,r14d
    1543:	0f 84 24 46 00 00    	je     5b6d <gpu_run+0x571d>
    1549:	41 83 fe 01          	cmp    r14d,0x1
    154d:	0f 84 eb 00 00 00    	je     163e <gpu_run+0x11ee>
    1553:	41 83 fe 02          	cmp    r14d,0x2
    1557:	0f 84 bf 00 00 00    	je     161c <gpu_run+0x11cc>
    155d:	41 83 fe 03          	cmp    r14d,0x3
    1561:	0f 84 93 00 00 00    	je     15fa <gpu_run+0x11aa>
    1567:	41 83 fe 04          	cmp    r14d,0x4
    156b:	74 6b                	je     15d8 <gpu_run+0x1188>
    156d:	41 83 fe 05          	cmp    r14d,0x5
    1571:	74 43                	je     15b6 <gpu_run+0x1166>
    1573:	41 83 fe 06          	cmp    r14d,0x6
    1577:	74 1b                	je     1594 <gpu_run+0x1144>
    1579:	45 0f 28 7c 24 10    	movaps xmm15,XMMWORD PTR [r12+0x10]
    157f:	bf 02 00 00 00       	mov    edi,0x2
    1584:	41 b8 20 00 00 00    	mov    r8d,0x20
    158a:	44 0f 58 7d 10       	addps  xmm15,XMMWORD PTR [rbp+0x10]
    158f:	44 0f 29 7b 10       	movaps XMMWORD PTR [rbx+0x10],xmm15
    1594:	83 c7 01             	add    edi,0x1
    1597:	42 0f 28 8c 06 00 00 	movaps xmm1,XMMWORD PTR [rsi+r8*1+0x0]
    159e:	00 00 
    15a0:	42 0f 58 8c 02 00 00 	addps  xmm1,XMMWORD PTR [rdx+r8*1+0x0]
    15a7:	00 00 
    15a9:	42 0f 29 8c 00 00 00 	movaps XMMWORD PTR [rax+r8*1+0x0],xmm1
    15b0:	00 00 
    15b2:	49 83 c0 10          	add    r8,0x10
    15b6:	83 c7 01             	add    edi,0x1
    15b9:	42 0f 28 84 06 00 00 	movaps xmm0,XMMWORD PTR [rsi+r8*1+0x0]
    15c0:	00 00 
    15c2:	42 0f 58 84 02 00 00 	addps  xmm0,XMMWORD PTR [rdx+r8*1+0x0]
    15c9:	00 00 
    15cb:	42 0f 29 84 00 00 00 	movaps XMMWORD PTR [rax+r8*1+0x0],xmm0
    15d2:	00 00 
    15d4:	49 83 c0 10          	add    r8,0x10
    15d8:	83 c7 01             	add    edi,0x1
    15db:	42 0f 28 94 06 00 00 	movaps xmm2,XMMWORD PTR [rsi+r8*1+0x0]
    15e2:	00 00 
    15e4:	42 0f 58 94 02 00 00 	addps  xmm2,XMMWORD PTR [rdx+r8*1+0x0]
    15eb:	00 00 
    15ed:	42 0f 29 94 00 00 00 	movaps XMMWORD PTR [rax+r8*1+0x0],xmm2
    15f4:	00 00 
    15f6:	49 83 c0 10          	add    r8,0x10
    15fa:	83 c7 01             	add    edi,0x1
    15fd:	42 0f 28 9c 06 00 00 	movaps xmm3,XMMWORD PTR [rsi+r8*1+0x0]
    1604:	00 00 
    1606:	42 0f 58 9c 02 00 00 	addps  xmm3,XMMWORD PTR [rdx+r8*1+0x0]
    160d:	00 00 
    160f:	42 0f 29 9c 00 00 00 	movaps XMMWORD PTR [rax+r8*1+0x0],xmm3
    1616:	00 00 
    1618:	49 83 c0 10          	add    r8,0x10
    161c:	83 c7 01             	add    edi,0x1
    161f:	42 0f 28 a4 06 00 00 	movaps xmm4,XMMWORD PTR [rsi+r8*1+0x0]
    1626:	00 00 
    1628:	42 0f 58 a4 02 00 00 	addps  xmm4,XMMWORD PTR [rdx+r8*1+0x0]
    162f:	00 00 
    1631:	42 0f 29 a4 00 00 00 	movaps XMMWORD PTR [rax+r8*1+0x0],xmm4
    1638:	00 00 
    163a:	49 83 c0 10          	add    r8,0x10
    163e:	83 c7 01             	add    edi,0x1
    1641:	42 0f 28 ac 06 00 00 	movaps xmm5,XMMWORD PTR [rsi+r8*1+0x0]
    1648:	00 00 
    164a:	42 0f 58 ac 02 00 00 	addps  xmm5,XMMWORD PTR [rdx+r8*1+0x0]
    1651:	00 00 
    1653:	42 0f 29 ac 00 00 00 	movaps XMMWORD PTR [rax+r8*1+0x0],xmm5
    165a:	00 00 
    165c:	49 83 c0 10          	add    r8,0x10
    1660:	41 39 ff             	cmp    r15d,edi
    1663:	0f 87 04 45 00 00    	ja     5b6d <gpu_run+0x571d>
    1669:	45 39 da             	cmp    r10d,r11d
    166c:	0f 84 fe 17 00 00    	je     2e70 <gpu_run+0x2a20>
    1672:	49 63 ea             	movsxd rbp,r10d
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1675:	41 8d 5a 01          	lea    ebx,[r10+0x1]
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    1679:	48 c1 e5 02          	shl    rbp,0x2
    167d:	f3 44 0f 10 b4 15 00 	movss  xmm14,DWORD PTR [rbp+rdx*1+0x0]
    1684:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1687:	44 39 db             	cmp    ebx,r11d
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    168a:	f3 44 0f 58 b4 35 00 	addss  xmm14,DWORD PTR [rbp+rsi*1+0x0]
    1691:	00 00 00 
    1694:	f3 44 0f 11 b4 05 00 	movss  DWORD PTR [rbp+rax*1+0x0],xmm14
    169b:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    169e:	0f 8d cc 17 00 00    	jge    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    16a4:	4c 63 e3             	movsxd r12,ebx
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    16a7:	41 83 c2 02          	add    r10d,0x2
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    16ab:	49 c1 e4 02          	shl    r12,0x2
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    16af:	45 39 d3             	cmp    r11d,r10d
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    16b2:	f3 45 0f 10 bc 14 00 	movss  xmm15,DWORD PTR [r12+rdx*1+0x0]
    16b9:	00 00 00 
    16bc:	f3 45 0f 58 bc 34 00 	addss  xmm15,DWORD PTR [r12+rsi*1+0x0]
    16c3:	00 00 00 
    16c6:	f3 45 0f 11 bc 04 00 	movss  DWORD PTR [r12+rax*1+0x0],xmm15
    16cd:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    16d0:	0f 8e 9a 17 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    16d6:	49 63 ca             	movsxd rcx,r10d
    16d9:	4c 8d 0c 8d 00 00 00 	lea    r9,[rcx*4+0x0]
    16e0:	00 
    16e1:	f3 41 0f 10 8c 31 00 	movss  xmm1,DWORD PTR [r9+rsi*1+0x0]
    16e8:	00 00 00 
    16eb:	f3 41 0f 58 8c 11 00 	addss  xmm1,DWORD PTR [r9+rdx*1+0x0]
    16f2:	00 00 00 
    16f5:	f3 41 0f 11 8c 01 00 	movss  DWORD PTR [r9+rax*1+0x0],xmm1
    16fc:	00 00 00 
    16ff:	e9 6c 17 00 00       	jmp    2e70 <gpu_run+0x2a20>
    1704:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:373
					A[i].i = (uint32_t)(int32_t)B[i].f;
				}
		    	break;
			case GPUOP_ITOF://int to float
				cycles += 3;//3/1 on pentium
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1708:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # 170f <gpu_run+0x12bf>
/home/simon/prog/C/EMULATOR/GPU.c:372
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
				}
		    	break;
			case GPUOP_ITOF://int to float
				cycles += 3;//3/1 on pentium
    170f:	48 83 44 24 08 03    	add    QWORD PTR [rsp+0x8],0x3
/home/simon/prog/C/EMULATOR/GPU.c:373
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1715:	45 85 db             	test   r11d,r11d
    1718:	0f 8e 52 17 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:375 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = (float)B[indx].i;
    171e:	4c 63 35 00 00 00 00 	movsxd r14,DWORD PTR [rip+0x0]        # 1725 <gpu_run+0x12d5>
    1725:	66 0f ef c0          	pxor   xmm0,xmm0
    1729:	45 8d 63 ff          	lea    r12d,[r11-0x1]
    172d:	41 b8 00 00 00 00    	mov    r8d,0x0
    1733:	4a 8d 34 a5 00 00 00 	lea    rsi,[r12*4+0x0]
    173a:	00 
    173b:	41 83 e4 07          	and    r12d,0x7
    173f:	49 c1 e6 02          	shl    r14,0x2
    1743:	45 8b 8c 16 00 00 00 	mov    r9d,DWORD PTR [r14+rdx*1+0x0]
    174a:	00 
/home/simon/prog/C/EMULATOR/GPU.c:373 (discriminator 3)
					A[i].i = (uint32_t)(int32_t)B[i].f;
				}
		    	break;
			case GPUOP_ITOF://int to float
				cycles += 3;//3/1 on pentium
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    174b:	49 39 f0             	cmp    r8,rsi
/home/simon/prog/C/EMULATOR/GPU.c:375 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = (float)B[indx].i;
    174e:	f3 49 0f 2a c1       	cvtsi2ss xmm0,r9
    1753:	f3 41 0f 11 84 06 00 	movss  DWORD PTR [r14+rax*1+0x0],xmm0
    175a:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:373 (discriminator 3)
					A[i].i = (uint32_t)(int32_t)B[i].f;
				}
		    	break;
			case GPUOP_ITOF://int to float
				cycles += 3;//3/1 on pentium
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    175d:	0f 84 0d 17 00 00    	je     2e70 <gpu_run+0x2a20>
    1763:	4d 85 e4             	test   r12,r12
    1766:	0f 84 54 01 00 00    	je     18c0 <gpu_run+0x1470>
    176c:	49 83 fc 01          	cmp    r12,0x1
    1770:	0f 84 14 01 00 00    	je     188a <gpu_run+0x143a>
    1776:	49 83 fc 02          	cmp    r12,0x2
    177a:	0f 84 e4 00 00 00    	je     1864 <gpu_run+0x1414>
    1780:	49 83 fc 03          	cmp    r12,0x3
    1784:	0f 84 b4 00 00 00    	je     183e <gpu_run+0x13ee>
    178a:	49 83 fc 04          	cmp    r12,0x4
    178e:	0f 84 84 00 00 00    	je     1818 <gpu_run+0x13c8>
    1794:	49 83 fc 05          	cmp    r12,0x5
    1798:	74 58                	je     17f2 <gpu_run+0x13a2>
    179a:	49 83 fc 06          	cmp    r12,0x6
    179e:	74 2c                	je     17cc <gpu_run+0x137c>
/home/simon/prog/C/EMULATOR/GPU.c:375
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = (float)B[indx].i;
    17a0:	4c 63 3d 00 00 00 00 	movsxd r15,DWORD PTR [rip+0x0]        # 17a7 <gpu_run+0x1357>
    17a7:	66 0f ef d2          	pxor   xmm2,xmm2
    17ab:	41 b8 00 00 00 00    	mov    r8d,0x0
    17b1:	49 c1 e7 02          	shl    r15,0x2
    17b5:	42 8b bc 3a 00 00 00 	mov    edi,DWORD PTR [rdx+r15*1+0x0]
    17bc:	00 
    17bd:	f3 48 0f 2a d7       	cvtsi2ss xmm2,rdi
    17c2:	f3 42 0f 11 94 38 00 	movss  DWORD PTR [rax+r15*1+0x0],xmm2
    17c9:	00 00 00 
    17cc:	4d 63 10             	movsxd r10,DWORD PTR [r8]
    17cf:	66 0f ef db          	pxor   xmm3,xmm3
    17d3:	49 83 c0 04          	add    r8,0x4
    17d7:	49 c1 e2 02          	shl    r10,0x2
    17db:	42 8b 8c 12 00 00 00 	mov    ecx,DWORD PTR [rdx+r10*1+0x0]
    17e2:	00 
    17e3:	f3 48 0f 2a d9       	cvtsi2ss xmm3,rcx
    17e8:	f3 42 0f 11 9c 10 00 	movss  DWORD PTR [rax+r10*1+0x0],xmm3
    17ef:	00 00 00 
    17f2:	4d 63 18             	movsxd r11,DWORD PTR [r8]
    17f5:	66 0f ef e4          	pxor   xmm4,xmm4
    17f9:	49 83 c0 04          	add    r8,0x4
    17fd:	49 c1 e3 02          	shl    r11,0x2
    1801:	46 8b a4 1a 00 00 00 	mov    r12d,DWORD PTR [rdx+r11*1+0x0]
    1808:	00 
    1809:	f3 49 0f 2a e4       	cvtsi2ss xmm4,r12
    180e:	f3 42 0f 11 a4 18 00 	movss  DWORD PTR [rax+r11*1+0x0],xmm4
    1815:	00 00 00 
    1818:	4d 63 30             	movsxd r14,DWORD PTR [r8]
    181b:	66 0f ef ed          	pxor   xmm5,xmm5
    181f:	49 83 c0 04          	add    r8,0x4
    1823:	49 c1 e6 02          	shl    r14,0x2
    1827:	46 8b 8c 32 00 00 00 	mov    r9d,DWORD PTR [rdx+r14*1+0x0]
    182e:	00 
    182f:	f3 49 0f 2a e9       	cvtsi2ss xmm5,r9
    1834:	f3 42 0f 11 ac 30 00 	movss  DWORD PTR [rax+r14*1+0x0],xmm5
    183b:	00 00 00 
    183e:	4d 63 38             	movsxd r15,DWORD PTR [r8]
    1841:	66 0f ef f6          	pxor   xmm6,xmm6
    1845:	49 83 c0 04          	add    r8,0x4
    1849:	49 c1 e7 02          	shl    r15,0x2
    184d:	42 8b bc 3a 00 00 00 	mov    edi,DWORD PTR [rdx+r15*1+0x0]
    1854:	00 
    1855:	f3 48 0f 2a f7       	cvtsi2ss xmm6,rdi
    185a:	f3 42 0f 11 b4 38 00 	movss  DWORD PTR [rax+r15*1+0x0],xmm6
    1861:	00 00 00 
    1864:	4d 63 10             	movsxd r10,DWORD PTR [r8]
    1867:	66 0f ef ff          	pxor   xmm7,xmm7
    186b:	49 83 c0 04          	add    r8,0x4
    186f:	49 c1 e2 02          	shl    r10,0x2
    1873:	42 8b 8c 12 00 00 00 	mov    ecx,DWORD PTR [rdx+r10*1+0x0]
    187a:	00 
    187b:	f3 48 0f 2a f9       	cvtsi2ss xmm7,rcx
    1880:	f3 42 0f 11 bc 10 00 	movss  DWORD PTR [rax+r10*1+0x0],xmm7
    1887:	00 00 00 
    188a:	4d 63 18             	movsxd r11,DWORD PTR [r8]
    188d:	66 45 0f ef c0       	pxor   xmm8,xmm8
    1892:	49 83 c0 04          	add    r8,0x4
    1896:	49 c1 e3 02          	shl    r11,0x2
/home/simon/prog/C/EMULATOR/GPU.c:373
					A[i].i = (uint32_t)(int32_t)B[i].f;
				}
		    	break;
			case GPUOP_ITOF://int to float
				cycles += 3;//3/1 on pentium
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    189a:	49 39 f0             	cmp    r8,rsi
/home/simon/prog/C/EMULATOR/GPU.c:375
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = (float)B[indx].i;
    189d:	42 8b 94 1a 00 00 00 	mov    edx,DWORD PTR [rdx+r11*1+0x0]
    18a4:	00 
    18a5:	f3 4c 0f 2a c2       	cvtsi2ss xmm8,rdx
    18aa:	f3 46 0f 11 84 18 00 	movss  DWORD PTR [rax+r11*1+0x0],xmm8
    18b1:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:373
					A[i].i = (uint32_t)(int32_t)B[i].f;
				}
		    	break;
			case GPUOP_ITOF://int to float
				cycles += 3;//3/1 on pentium
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    18b4:	0f 84 b6 15 00 00    	je     2e70 <gpu_run+0x2a20>
    18ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:375 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = (float)B[indx].i;
    18c0:	49 63 00             	movsxd rax,DWORD PTR [r8]
    18c3:	66 45 0f ef c9       	pxor   xmm9,xmm9
    18c8:	4d 63 70 04          	movsxd r14,DWORD PTR [r8+0x4]
    18cc:	66 45 0f ef d2       	pxor   xmm10,xmm10
    18d1:	4d 63 78 08          	movsxd r15,DWORD PTR [r8+0x8]
    18d5:	66 45 0f ef db       	pxor   xmm11,xmm11
    18da:	4d 63 50 0c          	movsxd r10,DWORD PTR [r8+0xc]
    18de:	66 45 0f ef e4       	pxor   xmm12,xmm12
    18e3:	44 8b 64 85 00       	mov    r12d,DWORD PTR [rbp+rax*4+0x0]
    18e8:	4d 63 58 10          	movsxd r11,DWORD PTR [r8+0x10]
    18ec:	49 83 c0 20          	add    r8,0x20
    18f0:	66 45 0f ef ed       	pxor   xmm13,xmm13
    18f5:	66 45 0f ef f6       	pxor   xmm14,xmm14
    18fa:	66 45 0f ef ff       	pxor   xmm15,xmm15
    18ff:	f3 4d 0f 2a cc       	cvtsi2ss xmm9,r12
    1904:	66 0f ef c9          	pxor   xmm1,xmm1
    1908:	f3 44 0f 11 0c 83    	movss  DWORD PTR [rbx+rax*4],xmm9
    190e:	46 8b 4c b5 00       	mov    r9d,DWORD PTR [rbp+r14*4+0x0]
    1913:	49 63 40 f4          	movsxd rax,DWORD PTR [r8-0xc]
    1917:	f3 4d 0f 2a d1       	cvtsi2ss xmm10,r9
    191c:	f3 46 0f 11 14 b3    	movss  DWORD PTR [rbx+r14*4],xmm10
    1922:	42 8b 7c bd 00       	mov    edi,DWORD PTR [rbp+r15*4+0x0]
    1927:	4d 63 70 f8          	movsxd r14,DWORD PTR [r8-0x8]
    192b:	f3 4c 0f 2a df       	cvtsi2ss xmm11,rdi
    1930:	f3 46 0f 11 1c bb    	movss  DWORD PTR [rbx+r15*4],xmm11
    1936:	42 8b 4c 95 00       	mov    ecx,DWORD PTR [rbp+r10*4+0x0]
    193b:	4d 63 78 fc          	movsxd r15,DWORD PTR [r8-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:373 (discriminator 3)
					A[i].i = (uint32_t)(int32_t)B[i].f;
				}
		    	break;
			case GPUOP_ITOF://int to float
				cycles += 3;//3/1 on pentium
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    193f:	49 39 f0             	cmp    r8,rsi
/home/simon/prog/C/EMULATOR/GPU.c:375 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = (float)B[indx].i;
    1942:	f3 4c 0f 2a e1       	cvtsi2ss xmm12,rcx
    1947:	f3 46 0f 11 24 93    	movss  DWORD PTR [rbx+r10*4],xmm12
    194d:	42 8b 54 9d 00       	mov    edx,DWORD PTR [rbp+r11*4+0x0]
    1952:	f3 4c 0f 2a ea       	cvtsi2ss xmm13,rdx
    1957:	f3 46 0f 11 2c 9b    	movss  DWORD PTR [rbx+r11*4],xmm13
    195d:	44 8b 64 85 00       	mov    r12d,DWORD PTR [rbp+rax*4+0x0]
    1962:	f3 4d 0f 2a f4       	cvtsi2ss xmm14,r12
    1967:	f3 44 0f 11 34 83    	movss  DWORD PTR [rbx+rax*4],xmm14
    196d:	46 8b 4c b5 00       	mov    r9d,DWORD PTR [rbp+r14*4+0x0]
    1972:	f3 4d 0f 2a f9       	cvtsi2ss xmm15,r9
    1977:	f3 46 0f 11 3c b3    	movss  DWORD PTR [rbx+r14*4],xmm15
    197d:	42 8b 7c bd 00       	mov    edi,DWORD PTR [rbp+r15*4+0x0]
    1982:	f3 48 0f 2a cf       	cvtsi2ss xmm1,rdi
    1987:	f3 42 0f 11 0c bb    	movss  DWORD PTR [rbx+r15*4],xmm1
/home/simon/prog/C/EMULATOR/GPU.c:373 (discriminator 3)
					A[i].i = (uint32_t)(int32_t)B[i].f;
				}
		    	break;
			case GPUOP_ITOF://int to float
				cycles += 3;//3/1 on pentium
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    198d:	0f 85 2d ff ff ff    	jne    18c0 <gpu_run+0x1470>
    1993:	e9 d8 14 00 00       	jmp    2e70 <gpu_run+0x2a20>
    1998:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    199f:	00 
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    19a0:	44 8b 15 00 00 00 00 	mov    r10d,DWORD PTR [rip+0x0]        # 19a7 <gpu_run+0x1557>
/home/simon/prog/C/EMULATOR/GPU.c:361
				break;
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
    19a7:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:362
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    19ad:	45 85 d2             	test   r10d,r10d
    19b0:	0f 8e ba 14 00 00    	jle    2e70 <gpu_run+0x2a20>
    19b6:	48 8d 73 10          	lea    rsi,[rbx+0x10]
    19ba:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
    19be:	48 39 f5             	cmp    rbp,rsi
    19c1:	41 0f 93 c3          	setae  r11b
    19c5:	48 39 cb             	cmp    rbx,rcx
    19c8:	41 0f 93 c4          	setae  r12b
    19cc:	45 08 e3             	or     r11b,r12b
    19cf:	0f 84 76 3f 00 00    	je     594b <gpu_run+0x54fb>
    19d5:	41 83 fa 05          	cmp    r10d,0x5
    19d9:	0f 86 6c 3f 00 00    	jbe    594b <gpu_run+0x54fb>
    19df:	45 8d 72 fc          	lea    r14d,[r10-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    19e3:	f3 0f 5b 04 bd 00 00 	cvttps2dq xmm0,XMMWORD PTR [rdi*4+0x0]
    19ea:	00 00 
    19ec:	41 bf 10 00 00 00    	mov    r15d,0x10
    19f2:	42 0f 29 04 85 00 00 	movaps XMMWORD PTR [r8*4+0x0],xmm0
    19f9:	00 00 
    19fb:	41 c1 ee 02          	shr    r14d,0x2
    19ff:	41 b8 01 00 00 00    	mov    r8d,0x1
    1a05:	45 8d 4e 01          	lea    r9d,[r14+0x1]
    1a09:	41 83 e6 07          	and    r14d,0x7
    1a0d:	41 83 f9 01          	cmp    r9d,0x1
    1a11:	46 8d 1c 8d 00 00 00 	lea    r11d,[r9*4+0x0]
    1a18:	00 
    1a19:	0f 86 f5 00 00 00    	jbe    1b14 <gpu_run+0x16c4>
    1a1f:	45 85 f6             	test   r14d,r14d
    1a22:	0f 84 e8 41 00 00    	je     5c10 <gpu_run+0x57c0>
    1a28:	41 83 fe 01          	cmp    r14d,0x1
    1a2c:	0f 84 be 00 00 00    	je     1af0 <gpu_run+0x16a0>
    1a32:	41 83 fe 02          	cmp    r14d,0x2
    1a36:	0f 84 99 00 00 00    	je     1ad5 <gpu_run+0x1685>
    1a3c:	41 83 fe 03          	cmp    r14d,0x3
    1a40:	74 78                	je     1aba <gpu_run+0x166a>
    1a42:	41 83 fe 04          	cmp    r14d,0x4
    1a46:	74 57                	je     1a9f <gpu_run+0x164f>
    1a48:	41 83 fe 05          	cmp    r14d,0x5
    1a4c:	74 36                	je     1a84 <gpu_run+0x1634>
    1a4e:	41 83 fe 06          	cmp    r14d,0x6
    1a52:	74 15                	je     1a69 <gpu_run+0x1619>
    1a54:	f3 0f 5b 55 10       	cvttps2dq xmm2,XMMWORD PTR [rbp+0x10]
    1a59:	0f 29 53 10          	movaps XMMWORD PTR [rbx+0x10],xmm2
    1a5d:	41 b8 02 00 00 00    	mov    r8d,0x2
    1a63:	41 bf 20 00 00 00    	mov    r15d,0x20
    1a69:	f3 42 0f 5b 9c 3a 00 	cvttps2dq xmm3,XMMWORD PTR [rdx+r15*1+0x0]
    1a70:	00 00 00 
    1a73:	41 83 c0 01          	add    r8d,0x1
    1a77:	42 0f 29 9c 38 00 00 	movaps XMMWORD PTR [rax+r15*1+0x0],xmm3
    1a7e:	00 00 
    1a80:	49 83 c7 10          	add    r15,0x10
    1a84:	f3 42 0f 5b a4 3a 00 	cvttps2dq xmm4,XMMWORD PTR [rdx+r15*1+0x0]
    1a8b:	00 00 00 
    1a8e:	41 83 c0 01          	add    r8d,0x1
    1a92:	42 0f 29 a4 38 00 00 	movaps XMMWORD PTR [rax+r15*1+0x0],xmm4
    1a99:	00 00 
    1a9b:	49 83 c7 10          	add    r15,0x10
    1a9f:	f3 42 0f 5b ac 3a 00 	cvttps2dq xmm5,XMMWORD PTR [rdx+r15*1+0x0]
    1aa6:	00 00 00 
    1aa9:	41 83 c0 01          	add    r8d,0x1
    1aad:	42 0f 29 ac 38 00 00 	movaps XMMWORD PTR [rax+r15*1+0x0],xmm5
    1ab4:	00 00 
    1ab6:	49 83 c7 10          	add    r15,0x10
    1aba:	f3 42 0f 5b b4 3a 00 	cvttps2dq xmm6,XMMWORD PTR [rdx+r15*1+0x0]
    1ac1:	00 00 00 
    1ac4:	41 83 c0 01          	add    r8d,0x1
    1ac8:	42 0f 29 b4 38 00 00 	movaps XMMWORD PTR [rax+r15*1+0x0],xmm6
    1acf:	00 00 
    1ad1:	49 83 c7 10          	add    r15,0x10
    1ad5:	f3 42 0f 5b bc 3a 00 	cvttps2dq xmm7,XMMWORD PTR [rdx+r15*1+0x0]
    1adc:	00 00 00 
    1adf:	41 83 c0 01          	add    r8d,0x1
    1ae3:	42 0f 29 bc 38 00 00 	movaps XMMWORD PTR [rax+r15*1+0x0],xmm7
    1aea:	00 00 
    1aec:	49 83 c7 10          	add    r15,0x10
    1af0:	41 83 c0 01          	add    r8d,0x1
    1af4:	f3 46 0f 5b 84 3a 00 	cvttps2dq xmm8,XMMWORD PTR [rdx+r15*1+0x0]
    1afb:	00 00 00 
    1afe:	46 0f 29 84 38 00 00 	movaps XMMWORD PTR [rax+r15*1+0x0],xmm8
    1b05:	00 00 
    1b07:	49 83 c7 10          	add    r15,0x10
    1b0b:	45 39 c1             	cmp    r9d,r8d
    1b0e:	0f 87 fc 40 00 00    	ja     5c10 <gpu_run+0x57c0>
    1b14:	45 39 d3             	cmp    r11d,r10d
    1b17:	0f 84 53 13 00 00    	je     2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1b1d:	41 8d 7b 01          	lea    edi,[r11+0x1]
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    1b21:	49 63 eb             	movsxd rbp,r11d
    1b24:	48 c1 e5 02          	shl    rbp,0x2
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1b28:	44 39 d7             	cmp    edi,r10d
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    1b2b:	f3 0f 2c 9c 15 00 00 	cvttss2si ebx,DWORD PTR [rbp+rdx*1+0x0]
    1b32:	00 00 
    1b34:	89 9c 05 00 00 00 00 	mov    DWORD PTR [rbp+rax*1+0x0],ebx
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1b3b:	0f 8d 2f 13 00 00    	jge    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    1b41:	48 63 cf             	movsxd rcx,edi
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1b44:	41 83 c3 02          	add    r11d,0x2
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    1b48:	48 c1 e1 02          	shl    rcx,0x2
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1b4c:	45 39 d3             	cmp    r11d,r10d
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    1b4f:	f3 0f 2c b4 11 00 00 	cvttss2si esi,DWORD PTR [rcx+rdx*1+0x0]
    1b56:	00 00 
    1b58:	89 b4 01 00 00 00 00 	mov    DWORD PTR [rcx+rax*1+0x0],esi
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1b5f:	0f 8d 0b 13 00 00    	jge    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    1b65:	4d 63 e3             	movsxd r12,r11d
    1b68:	4e 8d 34 a5 00 00 00 	lea    r14,[r12*4+0x0]
    1b6f:	00 
    1b70:	f3 41 0f 2c 94 16 00 	cvttss2si edx,DWORD PTR [r14+rdx*1+0x0]
    1b77:	00 00 00 
    1b7a:	41 89 94 06 00 00 00 	mov    DWORD PTR [r14+rax*1+0x0],edx
    1b81:	00 
    1b82:	e9 e9 12 00 00       	jmp    2e70 <gpu_run+0x2a20>
    1b87:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    1b8e:	00 00 
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1b90:	44 8b 15 00 00 00 00 	mov    r10d,DWORD PTR [rip+0x0]        # 1b97 <gpu_run+0x1747>
/home/simon/prog/C/EMULATOR/GPU.c:350
				cycles += 1;//TODO
				break;
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
    1b97:	44 89 d9             	mov    ecx,r11d
/home/simon/prog/C/EMULATOR/GPU.c:348
				break;
			case GPUOP_CEND:
				cycles += 1;//TODO
				break;
			case CPUOP_SAM:
				cycles += 1;
    1b9a:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:350
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
    1ba0:	81 e1 00 00 1f 00    	and    ecx,0x1f0000
/home/simon/prog/C/EMULATOR/GPU.c:351
					uint32_t mask = (inst & 0xffe00000)>>21;
    1ba6:	41 c1 eb 15          	shr    r11d,0x15
/home/simon/prog/C/EMULATOR/GPU.c:350
				cycles += 1;//TODO
				break;
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
    1baa:	c1 e9 10             	shr    ecx,0x10
/home/simon/prog/C/EMULATOR/GPU.c:352
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1bad:	45 85 d2             	test   r10d,r10d
    1bb0:	0f 8e ba 12 00 00    	jle    2e70 <gpu_run+0x2a20>
    1bb6:	4c 8d 7b 10          	lea    r15,[rbx+0x10]
    1bba:	48 8d 75 10          	lea    rsi,[rbp+0x10]
    1bbe:	4c 39 fd             	cmp    rbp,r15
    1bc1:	41 0f 93 c4          	setae  r12b
    1bc5:	48 39 f3             	cmp    rbx,rsi
    1bc8:	41 0f 93 c6          	setae  r14b
    1bcc:	45 08 f4             	or     r12b,r14b
    1bcf:	0f 84 f3 3b 00 00    	je     57c8 <gpu_run+0x5378>
    1bd5:	41 83 fa 05          	cmp    r10d,0x5
    1bd9:	0f 86 e9 3b 00 00    	jbe    57c8 <gpu_run+0x5378>
    1bdf:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
    1be4:	45 8d 7a fc          	lea    r15d,[r10-0x4]
    1be8:	41 b9 01 00 00 00    	mov    r9d,0x1
    1bee:	66 0f 6e 44 24 10    	movd   xmm0,DWORD PTR [rsp+0x10]
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    1bf4:	89 4c 24 10          	mov    DWORD PTR [rsp+0x10],ecx
    1bf8:	66 0f 6f 14 bd 00 00 	movdqa xmm2,XMMWORD PTR [rdi*4+0x0]
    1bff:	00 00 
    1c01:	41 c1 ef 02          	shr    r15d,0x2
    1c05:	bf 10 00 00 00       	mov    edi,0x10
    1c0a:	66 44 0f 70 c0 00    	pshufd xmm8,xmm0,0x0
    1c10:	45 8d 67 01          	lea    r12d,[r15+0x1]
    1c14:	66 0f 6e 5c 24 10    	movd   xmm3,DWORD PTR [rsp+0x10]
    1c1a:	41 83 e7 07          	and    r15d,0x7
    1c1e:	41 83 fc 01          	cmp    r12d,0x1
    1c22:	42 8d 34 a5 00 00 00 	lea    esi,[r12*4+0x0]
    1c29:	00 
    1c2a:	66 0f d2 d3          	psrld  xmm2,xmm3
    1c2e:	66 41 0f db d0       	pand   xmm2,xmm8
    1c33:	42 0f 29 14 85 00 00 	movaps XMMWORD PTR [r8*4+0x0],xmm2
    1c3a:	00 00 
    1c3c:	0f 86 84 01 00 00    	jbe    1dc6 <gpu_run+0x1976>
    1c42:	45 85 ff             	test   r15d,r15d
    1c45:	0f 84 54 3e 00 00    	je     5a9f <gpu_run+0x564f>
    1c4b:	41 83 ff 01          	cmp    r15d,0x1
    1c4f:	0f 84 3c 01 00 00    	je     1d91 <gpu_run+0x1941>
    1c55:	41 83 ff 02          	cmp    r15d,0x2
    1c59:	0f 84 03 01 00 00    	je     1d62 <gpu_run+0x1912>
    1c5f:	41 83 ff 03          	cmp    r15d,0x3
    1c63:	0f 84 c9 00 00 00    	je     1d32 <gpu_run+0x18e2>
    1c69:	41 83 ff 04          	cmp    r15d,0x4
    1c6d:	0f 84 8f 00 00 00    	je     1d02 <gpu_run+0x18b2>
    1c73:	41 83 ff 05          	cmp    r15d,0x5
    1c77:	74 59                	je     1cd2 <gpu_run+0x1882>
    1c79:	41 83 ff 06          	cmp    r15d,0x6
    1c7d:	74 27                	je     1ca6 <gpu_run+0x1856>
    1c7f:	89 4c 24 10          	mov    DWORD PTR [rsp+0x10],ecx
    1c83:	41 b9 02 00 00 00    	mov    r9d,0x2
    1c89:	bf 20 00 00 00       	mov    edi,0x20
    1c8e:	66 0f 6f 6d 10       	movdqa xmm5,XMMWORD PTR [rbp+0x10]
    1c93:	66 0f 6e 64 24 10    	movd   xmm4,DWORD PTR [rsp+0x10]
    1c99:	66 0f d2 ec          	psrld  xmm5,xmm4
    1c9d:	66 41 0f db e8       	pand   xmm5,xmm8
    1ca2:	0f 29 6b 10          	movaps XMMWORD PTR [rbx+0x10],xmm5
    1ca6:	89 4c 24 10          	mov    DWORD PTR [rsp+0x10],ecx
    1caa:	41 83 c1 01          	add    r9d,0x1
    1cae:	66 0f 6f b4 3a 00 00 	movdqa xmm6,XMMWORD PTR [rdx+rdi*1+0x0]
    1cb5:	00 00 
    1cb7:	66 0f 6e 7c 24 10    	movd   xmm7,DWORD PTR [rsp+0x10]
    1cbd:	66 0f d2 f7          	psrld  xmm6,xmm7
    1cc1:	66 41 0f db f0       	pand   xmm6,xmm8
    1cc6:	0f 29 b4 38 00 00 00 	movaps XMMWORD PTR [rax+rdi*1+0x0],xmm6
    1ccd:	00 
    1cce:	48 83 c7 10          	add    rdi,0x10
    1cd2:	41 83 c1 01          	add    r9d,0x1
    1cd6:	89 4c 24 10          	mov    DWORD PTR [rsp+0x10],ecx
    1cda:	66 44 0f 6f 8c 3a 00 	movdqa xmm9,XMMWORD PTR [rdx+rdi*1+0x0]
    1ce1:	00 00 00 
    1ce4:	66 44 0f 6e 54 24 10 	movd   xmm10,DWORD PTR [rsp+0x10]
    1ceb:	66 45 0f d2 ca       	psrld  xmm9,xmm10
    1cf0:	66 45 0f db c8       	pand   xmm9,xmm8
    1cf5:	44 0f 29 8c 38 00 00 	movaps XMMWORD PTR [rax+rdi*1+0x0],xmm9
    1cfc:	00 00 
    1cfe:	48 83 c7 10          	add    rdi,0x10
    1d02:	41 83 c1 01          	add    r9d,0x1
    1d06:	89 4c 24 10          	mov    DWORD PTR [rsp+0x10],ecx
    1d0a:	66 44 0f 6f 9c 3a 00 	movdqa xmm11,XMMWORD PTR [rdx+rdi*1+0x0]
    1d11:	00 00 00 
    1d14:	66 44 0f 6e 64 24 10 	movd   xmm12,DWORD PTR [rsp+0x10]
    1d1b:	66 45 0f d2 dc       	psrld  xmm11,xmm12
    1d20:	66 45 0f db d8       	pand   xmm11,xmm8
    1d25:	44 0f 29 9c 38 00 00 	movaps XMMWORD PTR [rax+rdi*1+0x0],xmm11
    1d2c:	00 00 
    1d2e:	48 83 c7 10          	add    rdi,0x10
    1d32:	41 83 c1 01          	add    r9d,0x1
    1d36:	89 4c 24 10          	mov    DWORD PTR [rsp+0x10],ecx
    1d3a:	66 44 0f 6f ac 3a 00 	movdqa xmm13,XMMWORD PTR [rdx+rdi*1+0x0]
    1d41:	00 00 00 
    1d44:	66 44 0f 6e 74 24 10 	movd   xmm14,DWORD PTR [rsp+0x10]
    1d4b:	66 45 0f d2 ee       	psrld  xmm13,xmm14
    1d50:	66 45 0f db e8       	pand   xmm13,xmm8
    1d55:	44 0f 29 ac 38 00 00 	movaps XMMWORD PTR [rax+rdi*1+0x0],xmm13
    1d5c:	00 00 
    1d5e:	48 83 c7 10          	add    rdi,0x10
    1d62:	41 83 c1 01          	add    r9d,0x1
    1d66:	89 4c 24 10          	mov    DWORD PTR [rsp+0x10],ecx
    1d6a:	66 44 0f 6f bc 3a 00 	movdqa xmm15,XMMWORD PTR [rdx+rdi*1+0x0]
    1d71:	00 00 00 
    1d74:	66 0f 6e 4c 24 10    	movd   xmm1,DWORD PTR [rsp+0x10]
    1d7a:	66 44 0f d2 f9       	psrld  xmm15,xmm1
    1d7f:	66 45 0f db f8       	pand   xmm15,xmm8
    1d84:	44 0f 29 bc 38 00 00 	movaps XMMWORD PTR [rax+rdi*1+0x0],xmm15
    1d8b:	00 00 
    1d8d:	48 83 c7 10          	add    rdi,0x10
    1d91:	41 83 c1 01          	add    r9d,0x1
    1d95:	89 4c 24 10          	mov    DWORD PTR [rsp+0x10],ecx
    1d99:	66 0f 6f 84 3a 00 00 	movdqa xmm0,XMMWORD PTR [rdx+rdi*1+0x0]
    1da0:	00 00 
    1da2:	66 0f 6e 54 24 10    	movd   xmm2,DWORD PTR [rsp+0x10]
    1da8:	66 0f d2 c2          	psrld  xmm0,xmm2
    1dac:	66 41 0f db c0       	pand   xmm0,xmm8
    1db1:	0f 29 84 38 00 00 00 	movaps XMMWORD PTR [rax+rdi*1+0x0],xmm0
    1db8:	00 
    1db9:	48 83 c7 10          	add    rdi,0x10
    1dbd:	45 39 cc             	cmp    r12d,r9d
    1dc0:	0f 87 d9 3c 00 00    	ja     5a9f <gpu_run+0x564f>
    1dc6:	41 39 f2             	cmp    r10d,esi
    1dc9:	0f 84 a1 10 00 00    	je     2e70 <gpu_run+0x2a20>
    1dcf:	48 63 ee             	movsxd rbp,esi
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1dd2:	44 8d 46 01          	lea    r8d,[rsi+0x1]
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    1dd6:	48 c1 e5 02          	shl    rbp,0x2
    1dda:	8b 9c 15 00 00 00 00 	mov    ebx,DWORD PTR [rbp+rdx*1+0x0]
    1de1:	d3 eb                	shr    ebx,cl
    1de3:	44 21 db             	and    ebx,r11d
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1de6:	45 39 c2             	cmp    r10d,r8d
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    1de9:	89 9c 05 00 00 00 00 	mov    DWORD PTR [rbp+rax*1+0x0],ebx
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1df0:	0f 8e 7a 10 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    1df6:	4d 63 f0             	movsxd r14,r8d
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1df9:	83 c6 02             	add    esi,0x2
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    1dfc:	49 c1 e6 02          	shl    r14,0x2
    1e00:	45 8b bc 16 00 00 00 	mov    r15d,DWORD PTR [r14+rdx*1+0x0]
    1e07:	00 
    1e08:	41 d3 ef             	shr    r15d,cl
    1e0b:	45 21 df             	and    r15d,r11d
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1e0e:	41 39 f2             	cmp    r10d,esi
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    1e11:	45 89 bc 06 00 00 00 	mov    DWORD PTR [r14+rax*1+0x0],r15d
    1e18:	00 
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1e19:	0f 8e 51 10 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    1e1f:	4c 63 e6             	movsxd r12,esi
    1e22:	49 c1 e4 02          	shl    r12,0x2
    1e26:	41 8b 94 14 00 00 00 	mov    edx,DWORD PTR [r12+rdx*1+0x0]
    1e2d:	00 
    1e2e:	d3 ea                	shr    edx,cl
    1e30:	41 21 d3             	and    r11d,edx
    1e33:	45 89 9c 04 00 00 00 	mov    DWORD PTR [r12+rax*1+0x0],r11d
    1e3a:	00 
    1e3b:	e9 30 10 00 00       	jmp    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:427
					A[indx].f = 1.0f-B[indx].f;
	      		}
	      		break;
			case GPUOP_FMAX:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1e40:	44 8b 15 00 00 00 00 	mov    r10d,DWORD PTR [rip+0x0]        # 1e47 <gpu_run+0x19f7>
/home/simon/prog/C/EMULATOR/GPU.c:426
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = 1.0f-B[indx].f;
	      		}
	      		break;
			case GPUOP_FMAX:
				cycles += 1;
    1e47:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:427
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1e4d:	45 85 d2             	test   r10d,r10d
    1e50:	0f 8e 1a 10 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:429
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
    1e56:	4c 63 1d 00 00 00 00 	movsxd r11,DWORD PTR [rip+0x0]        # 1e5d <gpu_run+0x1a0d>
    1e5d:	45 8d 42 ff          	lea    r8d,[r10-0x1]
    1e61:	b9 00 00 00 00       	mov    ecx,0x0
    1e66:	4e 8d 34 85 00 00 00 	lea    r14,[r8*4+0x0]
    1e6d:	00 
    1e6e:	41 83 e0 07          	and    r8d,0x7
    1e72:	49 c1 e3 02          	shl    r11,0x2
/home/simon/prog/C/EMULATOR/GPU.c:427
					A[indx].f = 1.0f-B[indx].f;
	      		}
	      		break;
			case GPUOP_FMAX:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1e76:	4c 39 f1             	cmp    rcx,r14
/home/simon/prog/C/EMULATOR/GPU.c:429
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
    1e79:	f3 45 0f 10 84 13 00 	movss  xmm8,DWORD PTR [r11+rdx*1+0x0]
    1e80:	00 00 00 
    1e83:	f3 45 0f 5f 84 33 00 	maxss  xmm8,DWORD PTR [r11+rsi*1+0x0]
    1e8a:	00 00 00 
    1e8d:	f3 45 0f 11 84 03 00 	movss  DWORD PTR [r11+rax*1+0x0],xmm8
    1e94:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:427
					A[indx].f = 1.0f-B[indx].f;
	      		}
	      		break;
			case GPUOP_FMAX:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1e97:	0f 84 d3 0f 00 00    	je     2e70 <gpu_run+0x2a20>
    1e9d:	4d 85 c0             	test   r8,r8
    1ea0:	0f 84 6a 01 00 00    	je     2010 <gpu_run+0x1bc0>
    1ea6:	49 83 f8 01          	cmp    r8,0x1
    1eaa:	0f 84 25 01 00 00    	je     1fd5 <gpu_run+0x1b85>
    1eb0:	49 83 f8 02          	cmp    r8,0x2
    1eb4:	0f 84 f2 00 00 00    	je     1fac <gpu_run+0x1b5c>
    1eba:	49 83 f8 03          	cmp    r8,0x3
    1ebe:	0f 84 bf 00 00 00    	je     1f83 <gpu_run+0x1b33>
    1ec4:	49 83 f8 04          	cmp    r8,0x4
    1ec8:	0f 84 8c 00 00 00    	je     1f5a <gpu_run+0x1b0a>
    1ece:	49 83 f8 05          	cmp    r8,0x5
    1ed2:	74 5d                	je     1f31 <gpu_run+0x1ae1>
    1ed4:	49 83 f8 06          	cmp    r8,0x6
    1ed8:	74 2e                	je     1f08 <gpu_run+0x1ab8>
/home/simon/prog/C/EMULATOR/GPU.c:429
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
    1eda:	48 63 3d 00 00 00 00 	movsxd rdi,DWORD PTR [rip+0x0]        # 1ee1 <gpu_run+0x1a91>
    1ee1:	b9 00 00 00 00       	mov    ecx,0x0
    1ee6:	48 c1 e7 02          	shl    rdi,0x2
    1eea:	f3 44 0f 10 8c 3a 00 	movss  xmm9,DWORD PTR [rdx+rdi*1+0x0]
    1ef1:	00 00 00 
    1ef4:	f3 44 0f 5f 8c 3e 00 	maxss  xmm9,DWORD PTR [rsi+rdi*1+0x0]
    1efb:	00 00 00 
    1efe:	f3 44 0f 11 8c 38 00 	movss  DWORD PTR [rax+rdi*1+0x0],xmm9
    1f05:	00 00 00 
    1f08:	4c 63 09             	movsxd r9,DWORD PTR [rcx]
    1f0b:	48 83 c1 04          	add    rcx,0x4
    1f0f:	49 c1 e1 02          	shl    r9,0x2
    1f13:	f3 46 0f 10 94 0a 00 	movss  xmm10,DWORD PTR [rdx+r9*1+0x0]
    1f1a:	00 00 00 
    1f1d:	f3 46 0f 5f 94 0e 00 	maxss  xmm10,DWORD PTR [rsi+r9*1+0x0]
    1f24:	00 00 00 
    1f27:	f3 46 0f 11 94 08 00 	movss  DWORD PTR [rax+r9*1+0x0],xmm10
    1f2e:	00 00 00 
    1f31:	4c 63 39             	movsxd r15,DWORD PTR [rcx]
    1f34:	48 83 c1 04          	add    rcx,0x4
    1f38:	49 c1 e7 02          	shl    r15,0x2
    1f3c:	f3 46 0f 10 9c 3a 00 	movss  xmm11,DWORD PTR [rdx+r15*1+0x0]
    1f43:	00 00 00 
    1f46:	f3 46 0f 5f 9c 3e 00 	maxss  xmm11,DWORD PTR [rsi+r15*1+0x0]
    1f4d:	00 00 00 
    1f50:	f3 46 0f 11 9c 38 00 	movss  DWORD PTR [rax+r15*1+0x0],xmm11
    1f57:	00 00 00 
    1f5a:	4c 63 11             	movsxd r10,DWORD PTR [rcx]
    1f5d:	48 83 c1 04          	add    rcx,0x4
    1f61:	49 c1 e2 02          	shl    r10,0x2
    1f65:	f3 46 0f 10 a4 12 00 	movss  xmm12,DWORD PTR [rdx+r10*1+0x0]
    1f6c:	00 00 00 
    1f6f:	f3 46 0f 5f a4 16 00 	maxss  xmm12,DWORD PTR [rsi+r10*1+0x0]
    1f76:	00 00 00 
    1f79:	f3 46 0f 11 a4 10 00 	movss  DWORD PTR [rax+r10*1+0x0],xmm12
    1f80:	00 00 00 
    1f83:	4c 63 01             	movsxd r8,DWORD PTR [rcx]
    1f86:	48 83 c1 04          	add    rcx,0x4
    1f8a:	49 c1 e0 02          	shl    r8,0x2
    1f8e:	f3 46 0f 10 ac 02 00 	movss  xmm13,DWORD PTR [rdx+r8*1+0x0]
    1f95:	00 00 00 
    1f98:	f3 46 0f 5f ac 06 00 	maxss  xmm13,DWORD PTR [rsi+r8*1+0x0]
    1f9f:	00 00 00 
    1fa2:	f3 46 0f 11 ac 00 00 	movss  DWORD PTR [rax+r8*1+0x0],xmm13
    1fa9:	00 00 00 
    1fac:	4c 63 19             	movsxd r11,DWORD PTR [rcx]
    1faf:	48 83 c1 04          	add    rcx,0x4
    1fb3:	49 c1 e3 02          	shl    r11,0x2
    1fb7:	f3 46 0f 10 b4 1a 00 	movss  xmm14,DWORD PTR [rdx+r11*1+0x0]
    1fbe:	00 00 00 
    1fc1:	f3 46 0f 5f b4 1e 00 	maxss  xmm14,DWORD PTR [rsi+r11*1+0x0]
    1fc8:	00 00 00 
    1fcb:	f3 46 0f 11 b4 18 00 	movss  DWORD PTR [rax+r11*1+0x0],xmm14
    1fd2:	00 00 00 
    1fd5:	48 63 39             	movsxd rdi,DWORD PTR [rcx]
    1fd8:	48 83 c1 04          	add    rcx,0x4
    1fdc:	48 c1 e7 02          	shl    rdi,0x2
/home/simon/prog/C/EMULATOR/GPU.c:427
					A[indx].f = 1.0f-B[indx].f;
	      		}
	      		break;
			case GPUOP_FMAX:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    1fe0:	4c 39 f1             	cmp    rcx,r14
/home/simon/prog/C/EMULATOR/GPU.c:429
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
    1fe3:	f3 44 0f 10 bc 3a 00 	movss  xmm15,DWORD PTR [rdx+rdi*1+0x0]
    1fea:	00 00 00 
    1fed:	f3 44 0f 5f bc 3e 00 	maxss  xmm15,DWORD PTR [rsi+rdi*1+0x0]
    1ff4:	00 00 00 
    1ff7:	f3 44 0f 11 bc 38 00 	movss  DWORD PTR [rax+rdi*1+0x0],xmm15
    1ffe:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:427
					A[indx].f = 1.0f-B[indx].f;
	      		}
	      		break;
			case GPUOP_FMAX:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2001:	0f 84 69 0e 00 00    	je     2e70 <gpu_run+0x2a20>
    2007:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    200e:	00 00 
/home/simon/prog/C/EMULATOR/GPU.c:429
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
    2010:	48 63 11             	movsxd rdx,DWORD PTR [rcx]
    2013:	48 63 41 04          	movsxd rax,DWORD PTR [rcx+0x4]
    2017:	48 83 c1 20          	add    rcx,0x20
    201b:	48 63 71 e8          	movsxd rsi,DWORD PTR [rcx-0x18]
    201f:	4c 63 49 ec          	movsxd r9,DWORD PTR [rcx-0x14]
    2023:	4c 63 79 f0          	movsxd r15,DWORD PTR [rcx-0x10]
    2027:	4c 63 51 f4          	movsxd r10,DWORD PTR [rcx-0xc]
    202b:	4c 63 41 f8          	movsxd r8,DWORD PTR [rcx-0x8]
    202f:	f3 0f 10 4c 95 00    	movss  xmm1,DWORD PTR [rbp+rdx*4+0x0]
    2035:	4c 63 59 fc          	movsxd r11,DWORD PTR [rcx-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:427
					A[indx].f = 1.0f-B[indx].f;
	      		}
	      		break;
			case GPUOP_FMAX:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2039:	4c 39 f1             	cmp    rcx,r14
/home/simon/prog/C/EMULATOR/GPU.c:429
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
    203c:	f3 41 0f 5f 0c 94    	maxss  xmm1,DWORD PTR [r12+rdx*4]
    2042:	f3 0f 11 0c 93       	movss  DWORD PTR [rbx+rdx*4],xmm1
    2047:	f3 0f 10 44 85 00    	movss  xmm0,DWORD PTR [rbp+rax*4+0x0]
    204d:	f3 41 0f 5f 04 84    	maxss  xmm0,DWORD PTR [r12+rax*4]
    2053:	f3 0f 11 04 83       	movss  DWORD PTR [rbx+rax*4],xmm0
    2058:	f3 0f 10 54 b5 00    	movss  xmm2,DWORD PTR [rbp+rsi*4+0x0]
    205e:	f3 41 0f 5f 14 b4    	maxss  xmm2,DWORD PTR [r12+rsi*4]
    2064:	f3 0f 11 14 b3       	movss  DWORD PTR [rbx+rsi*4],xmm2
    2069:	f3 42 0f 10 5c 8d 00 	movss  xmm3,DWORD PTR [rbp+r9*4+0x0]
    2070:	f3 43 0f 5f 1c 8c    	maxss  xmm3,DWORD PTR [r12+r9*4]
    2076:	f3 42 0f 11 1c 8b    	movss  DWORD PTR [rbx+r9*4],xmm3
    207c:	f3 42 0f 10 64 bd 00 	movss  xmm4,DWORD PTR [rbp+r15*4+0x0]
    2083:	f3 43 0f 5f 24 bc    	maxss  xmm4,DWORD PTR [r12+r15*4]
    2089:	f3 42 0f 11 24 bb    	movss  DWORD PTR [rbx+r15*4],xmm4
    208f:	f3 42 0f 10 6c 95 00 	movss  xmm5,DWORD PTR [rbp+r10*4+0x0]
    2096:	f3 43 0f 5f 2c 94    	maxss  xmm5,DWORD PTR [r12+r10*4]
    209c:	f3 42 0f 11 2c 93    	movss  DWORD PTR [rbx+r10*4],xmm5
    20a2:	f3 42 0f 10 74 85 00 	movss  xmm6,DWORD PTR [rbp+r8*4+0x0]
    20a9:	f3 43 0f 5f 34 84    	maxss  xmm6,DWORD PTR [r12+r8*4]
    20af:	f3 42 0f 11 34 83    	movss  DWORD PTR [rbx+r8*4],xmm6
    20b5:	f3 42 0f 10 7c 9d 00 	movss  xmm7,DWORD PTR [rbp+r11*4+0x0]
    20bc:	f3 43 0f 5f 3c 9c    	maxss  xmm7,DWORD PTR [r12+r11*4]
    20c2:	f3 42 0f 11 3c 9b    	movss  DWORD PTR [rbx+r11*4],xmm7
/home/simon/prog/C/EMULATOR/GPU.c:427
					A[indx].f = 1.0f-B[indx].f;
	      		}
	      		break;
			case GPUOP_FMAX:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    20c8:	0f 85 42 ff ff ff    	jne    2010 <gpu_run+0x1bc0>
    20ce:	e9 9d 0d 00 00       	jmp    2e70 <gpu_run+0x2a20>
    20d3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:420
	      			}
				}
	      		break;
			case GPUOP_FSUB1://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    20d8:	44 8b 25 00 00 00 00 	mov    r12d,DWORD PTR [rip+0x0]        # 20df <gpu_run+0x1c8f>
/home/simon/prog/C/EMULATOR/GPU.c:419
						A[i].f = B[i].f * C[i].f;
	      			}
				}
	      		break;
			case GPUOP_FSUB1://float sub
				cycles += 3;
    20df:	48 83 44 24 08 03    	add    QWORD PTR [rsp+0x8],0x3
/home/simon/prog/C/EMULATOR/GPU.c:420
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    20e5:	45 85 e4             	test   r12d,r12d
    20e8:	0f 8e 82 0d 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:422 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = 1.0f-B[indx].f;
    20ee:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 20f5 <gpu_run+0x1ca5>
    20f5:	f3 44 0f 10 05 00 00 	movss  xmm8,DWORD PTR [rip+0x0]        # 20fe <gpu_run+0x1cae>
    20fc:	00 00 
    20fe:	45 8d 74 24 ff       	lea    r14d,[r12-0x1]
    2103:	41 b9 00 00 00 00    	mov    r9d,0x0
    2109:	4a 8d 34 b5 00 00 00 	lea    rsi,[r14*4+0x0]
    2110:	00 
    2111:	41 83 e6 07          	and    r14d,0x7
    2115:	48 c1 e1 02          	shl    rcx,0x2
    2119:	f3 44 0f 5c 84 11 00 	subss  xmm8,DWORD PTR [rcx+rdx*1+0x0]
    2120:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:420 (discriminator 3)
	      			}
				}
	      		break;
			case GPUOP_FSUB1://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2123:	49 39 f1             	cmp    r9,rsi
/home/simon/prog/C/EMULATOR/GPU.c:422 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = 1.0f-B[indx].f;
    2126:	f3 44 0f 11 84 01 00 	movss  DWORD PTR [rcx+rax*1+0x0],xmm8
    212d:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:420 (discriminator 3)
	      			}
				}
	      		break;
			case GPUOP_FSUB1://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2130:	0f 84 3a 0d 00 00    	je     2e70 <gpu_run+0x2a20>
    2136:	4d 85 f6             	test   r14,r14
    2139:	0f 84 61 01 00 00    	je     22a0 <gpu_run+0x1e50>
    213f:	49 83 fe 01          	cmp    r14,0x1
    2143:	0f 84 20 01 00 00    	je     2269 <gpu_run+0x1e19>
    2149:	49 83 fe 02          	cmp    r14,0x2
    214d:	0f 84 ee 00 00 00    	je     2241 <gpu_run+0x1df1>
    2153:	49 83 fe 03          	cmp    r14,0x3
    2157:	0f 84 bc 00 00 00    	je     2219 <gpu_run+0x1dc9>
    215d:	49 83 fe 04          	cmp    r14,0x4
    2161:	0f 84 8a 00 00 00    	je     21f1 <gpu_run+0x1da1>
    2167:	49 83 fe 05          	cmp    r14,0x5
    216b:	74 5c                	je     21c9 <gpu_run+0x1d79>
    216d:	49 83 fe 06          	cmp    r14,0x6
    2171:	74 2e                	je     21a1 <gpu_run+0x1d51>
/home/simon/prog/C/EMULATOR/GPU.c:422
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = 1.0f-B[indx].f;
    2173:	48 63 3d 00 00 00 00 	movsxd rdi,DWORD PTR [rip+0x0]        # 217a <gpu_run+0x1d2a>
    217a:	f3 44 0f 10 0d 00 00 	movss  xmm9,DWORD PTR [rip+0x0]        # 2183 <gpu_run+0x1d33>
    2181:	00 00 
    2183:	41 b9 00 00 00 00    	mov    r9d,0x0
    2189:	48 c1 e7 02          	shl    rdi,0x2
    218d:	f3 44 0f 5c 8c 3a 00 	subss  xmm9,DWORD PTR [rdx+rdi*1+0x0]
    2194:	00 00 00 
    2197:	f3 44 0f 11 8c 38 00 	movss  DWORD PTR [rax+rdi*1+0x0],xmm9
    219e:	00 00 00 
    21a1:	4d 63 39             	movsxd r15,DWORD PTR [r9]
    21a4:	f3 44 0f 10 15 00 00 	movss  xmm10,DWORD PTR [rip+0x0]        # 21ad <gpu_run+0x1d5d>
    21ab:	00 00 
    21ad:	49 83 c1 04          	add    r9,0x4
    21b1:	49 c1 e7 02          	shl    r15,0x2
    21b5:	f3 46 0f 5c 94 3a 00 	subss  xmm10,DWORD PTR [rdx+r15*1+0x0]
    21bc:	00 00 00 
    21bf:	f3 46 0f 11 94 38 00 	movss  DWORD PTR [rax+r15*1+0x0],xmm10
    21c6:	00 00 00 
    21c9:	4d 63 11             	movsxd r10,DWORD PTR [r9]
    21cc:	f3 44 0f 10 1d 00 00 	movss  xmm11,DWORD PTR [rip+0x0]        # 21d5 <gpu_run+0x1d85>
    21d3:	00 00 
    21d5:	49 83 c1 04          	add    r9,0x4
    21d9:	49 c1 e2 02          	shl    r10,0x2
    21dd:	f3 46 0f 5c 9c 12 00 	subss  xmm11,DWORD PTR [rdx+r10*1+0x0]
    21e4:	00 00 00 
    21e7:	f3 46 0f 11 9c 10 00 	movss  DWORD PTR [rax+r10*1+0x0],xmm11
    21ee:	00 00 00 
    21f1:	4d 63 01             	movsxd r8,DWORD PTR [r9]
    21f4:	f3 44 0f 10 25 00 00 	movss  xmm12,DWORD PTR [rip+0x0]        # 21fd <gpu_run+0x1dad>
    21fb:	00 00 
    21fd:	49 83 c1 04          	add    r9,0x4
    2201:	49 c1 e0 02          	shl    r8,0x2
    2205:	f3 46 0f 5c a4 02 00 	subss  xmm12,DWORD PTR [rdx+r8*1+0x0]
    220c:	00 00 00 
    220f:	f3 46 0f 11 a4 00 00 	movss  DWORD PTR [rax+r8*1+0x0],xmm12
    2216:	00 00 00 
    2219:	4d 63 19             	movsxd r11,DWORD PTR [r9]
    221c:	f3 44 0f 10 2d 00 00 	movss  xmm13,DWORD PTR [rip+0x0]        # 2225 <gpu_run+0x1dd5>
    2223:	00 00 
    2225:	49 83 c1 04          	add    r9,0x4
    2229:	49 c1 e3 02          	shl    r11,0x2
    222d:	f3 46 0f 5c ac 1a 00 	subss  xmm13,DWORD PTR [rdx+r11*1+0x0]
    2234:	00 00 00 
    2237:	f3 46 0f 11 ac 18 00 	movss  DWORD PTR [rax+r11*1+0x0],xmm13
    223e:	00 00 00 
    2241:	4d 63 21             	movsxd r12,DWORD PTR [r9]
    2244:	f3 44 0f 10 35 00 00 	movss  xmm14,DWORD PTR [rip+0x0]        # 224d <gpu_run+0x1dfd>
    224b:	00 00 
    224d:	49 83 c1 04          	add    r9,0x4
    2251:	49 c1 e4 02          	shl    r12,0x2
    2255:	f3 46 0f 5c b4 22 00 	subss  xmm14,DWORD PTR [rdx+r12*1+0x0]
    225c:	00 00 00 
    225f:	f3 46 0f 11 b4 20 00 	movss  DWORD PTR [rax+r12*1+0x0],xmm14
    2266:	00 00 00 
    2269:	4d 63 31             	movsxd r14,DWORD PTR [r9]
    226c:	f3 44 0f 10 3d 00 00 	movss  xmm15,DWORD PTR [rip+0x0]        # 2275 <gpu_run+0x1e25>
    2273:	00 00 
    2275:	49 83 c1 04          	add    r9,0x4
    2279:	49 c1 e6 02          	shl    r14,0x2
/home/simon/prog/C/EMULATOR/GPU.c:420
	      			}
				}
	      		break;
			case GPUOP_FSUB1://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    227d:	49 39 f1             	cmp    r9,rsi
/home/simon/prog/C/EMULATOR/GPU.c:422
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = 1.0f-B[indx].f;
    2280:	f3 46 0f 5c bc 32 00 	subss  xmm15,DWORD PTR [rdx+r14*1+0x0]
    2287:	00 00 00 
    228a:	f3 46 0f 11 bc 30 00 	movss  DWORD PTR [rax+r14*1+0x0],xmm15
    2291:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:420
	      			}
				}
	      		break;
			case GPUOP_FSUB1://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2294:	0f 84 d6 0b 00 00    	je     2e70 <gpu_run+0x2a20>
    229a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:422 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = 1.0f-B[indx].f;
    22a0:	49 63 11             	movsxd rdx,DWORD PTR [r9]
    22a3:	f3 0f 10 0d 00 00 00 	movss  xmm1,DWORD PTR [rip+0x0]        # 22ab <gpu_run+0x1e5b>
    22aa:	00 
    22ab:	49 63 41 04          	movsxd rax,DWORD PTR [r9+0x4]
    22af:	49 83 c1 20          	add    r9,0x20
    22b3:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 22bb <gpu_run+0x1e6b>
    22ba:	00 
    22bb:	49 63 49 e8          	movsxd rcx,DWORD PTR [r9-0x18]
    22bf:	f3 0f 10 15 00 00 00 	movss  xmm2,DWORD PTR [rip+0x0]        # 22c7 <gpu_run+0x1e77>
    22c6:	00 
    22c7:	49 63 79 ec          	movsxd rdi,DWORD PTR [r9-0x14]
    22cb:	f3 0f 5c 4c 95 00    	subss  xmm1,DWORD PTR [rbp+rdx*4+0x0]
    22d1:	f3 0f 10 1d 00 00 00 	movss  xmm3,DWORD PTR [rip+0x0]        # 22d9 <gpu_run+0x1e89>
    22d8:	00 
    22d9:	4d 63 79 f0          	movsxd r15,DWORD PTR [r9-0x10]
    22dd:	f3 0f 10 25 00 00 00 	movss  xmm4,DWORD PTR [rip+0x0]        # 22e5 <gpu_run+0x1e95>
    22e4:	00 
    22e5:	4d 63 51 f4          	movsxd r10,DWORD PTR [r9-0xc]
    22e9:	f3 0f 10 2d 00 00 00 	movss  xmm5,DWORD PTR [rip+0x0]        # 22f1 <gpu_run+0x1ea1>
    22f0:	00 
    22f1:	4d 63 41 f8          	movsxd r8,DWORD PTR [r9-0x8]
    22f5:	f3 0f 10 35 00 00 00 	movss  xmm6,DWORD PTR [rip+0x0]        # 22fd <gpu_run+0x1ead>
    22fc:	00 
    22fd:	4d 63 59 fc          	movsxd r11,DWORD PTR [r9-0x4]
    2301:	f3 0f 10 3d 00 00 00 	movss  xmm7,DWORD PTR [rip+0x0]        # 2309 <gpu_run+0x1eb9>
    2308:	00 
/home/simon/prog/C/EMULATOR/GPU.c:420 (discriminator 3)
	      			}
				}
	      		break;
			case GPUOP_FSUB1://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2309:	49 39 f1             	cmp    r9,rsi
/home/simon/prog/C/EMULATOR/GPU.c:422 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = 1.0f-B[indx].f;
    230c:	f3 0f 11 0c 93       	movss  DWORD PTR [rbx+rdx*4],xmm1
    2311:	f3 0f 5c 44 85 00    	subss  xmm0,DWORD PTR [rbp+rax*4+0x0]
    2317:	f3 0f 11 04 83       	movss  DWORD PTR [rbx+rax*4],xmm0
    231c:	f3 0f 5c 54 8d 00    	subss  xmm2,DWORD PTR [rbp+rcx*4+0x0]
    2322:	f3 0f 11 14 8b       	movss  DWORD PTR [rbx+rcx*4],xmm2
    2327:	f3 0f 5c 5c bd 00    	subss  xmm3,DWORD PTR [rbp+rdi*4+0x0]
    232d:	f3 0f 11 1c bb       	movss  DWORD PTR [rbx+rdi*4],xmm3
    2332:	f3 42 0f 5c 64 bd 00 	subss  xmm4,DWORD PTR [rbp+r15*4+0x0]
    2339:	f3 42 0f 11 24 bb    	movss  DWORD PTR [rbx+r15*4],xmm4
    233f:	f3 42 0f 5c 6c 95 00 	subss  xmm5,DWORD PTR [rbp+r10*4+0x0]
    2346:	f3 42 0f 11 2c 93    	movss  DWORD PTR [rbx+r10*4],xmm5
    234c:	f3 42 0f 5c 74 85 00 	subss  xmm6,DWORD PTR [rbp+r8*4+0x0]
    2353:	f3 42 0f 11 34 83    	movss  DWORD PTR [rbx+r8*4],xmm6
    2359:	f3 42 0f 5c 7c 9d 00 	subss  xmm7,DWORD PTR [rbp+r11*4+0x0]
    2360:	f3 42 0f 11 3c 9b    	movss  DWORD PTR [rbx+r11*4],xmm7
/home/simon/prog/C/EMULATOR/GPU.c:420 (discriminator 3)
	      			}
				}
	      		break;
			case GPUOP_FSUB1://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2366:	0f 85 34 ff ff ff    	jne    22a0 <gpu_run+0x1e50>
    236c:	e9 ff 0a 00 00       	jmp    2e70 <gpu_run+0x2a20>
    2371:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:404
					int i = 0;
					cycles += 1;
					v4f * restrict Av = (v4f*)A;
					v4f * restrict Bv = (v4f*)B;
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
    2378:	44 8b 0d 00 00 00 00 	mov    r9d,DWORD PTR [rip+0x0]        # 237f <gpu_run+0x1f2f>
/home/simon/prog/C/EMULATOR/GPU.c:400
	      		}
	      		break;
			case GPUOP_FMUL://float mul
				{
					int i = 0;
					cycles += 1;
    237f:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:404
					v4f * restrict Av = (v4f*)A;
					v4f * restrict Bv = (v4f*)B;
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
    2385:	45 89 ce             	mov    r14d,r9d
    2388:	44 89 4c 24 10       	mov    DWORD PTR [rsp+0x10],r9d
    238d:	41 c1 fe 02          	sar    r14d,0x2
    2391:	45 85 f6             	test   r14d,r14d
    2394:	0f 8e 44 3a 00 00    	jle    5dde <gpu_run+0x598e>
/home/simon/prog/C/EMULATOR/GPU.c:405 (discriminator 2)
						Av[i] = Bv[i] * Cv[i];
    239a:	44 0f 28 04 bd 00 00 	movaps xmm8,XMMWORD PTR [rdi*4+0x0]
    23a1:	00 00 
    23a3:	45 8d 7e ff          	lea    r15d,[r14-0x1]
    23a7:	44 0f 59 04 8d 00 00 	mulps  xmm8,XMMWORD PTR [rcx*4+0x0]
    23ae:	00 00 
    23b0:	49 83 c7 01          	add    r15,0x1
    23b4:	49 c1 e7 04          	shl    r15,0x4
    23b8:	b9 10 00 00 00       	mov    ecx,0x10
    23bd:	4d 8d 57 f0          	lea    r10,[r15-0x10]
    23c1:	49 c1 ea 04          	shr    r10,0x4
    23c5:	41 83 e2 07          	and    r10d,0x7
/home/simon/prog/C/EMULATOR/GPU.c:404 (discriminator 2)
					int i = 0;
					cycles += 1;
					v4f * restrict Av = (v4f*)A;
					v4f * restrict Bv = (v4f*)B;
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
    23c9:	49 83 ff 10          	cmp    r15,0x10
/home/simon/prog/C/EMULATOR/GPU.c:405 (discriminator 2)
						Av[i] = Bv[i] * Cv[i];
    23cd:	46 0f 29 04 85 00 00 	movaps XMMWORD PTR [r8*4+0x0],xmm8
    23d4:	00 00 
/home/simon/prog/C/EMULATOR/GPU.c:404 (discriminator 2)
					int i = 0;
					cycles += 1;
					v4f * restrict Av = (v4f*)A;
					v4f * restrict Bv = (v4f*)B;
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
    23d6:	0f 84 9c 01 00 00    	je     2578 <gpu_run+0x2128>
    23dc:	4d 85 d2             	test   r10,r10
    23df:	0f 84 08 01 00 00    	je     24ed <gpu_run+0x209d>
    23e5:	49 83 fa 01          	cmp    r10,0x1
    23e9:	0f 84 d6 00 00 00    	je     24c5 <gpu_run+0x2075>
    23ef:	49 83 fa 02          	cmp    r10,0x2
    23f3:	0f 84 ad 00 00 00    	je     24a6 <gpu_run+0x2056>
    23f9:	49 83 fa 03          	cmp    r10,0x3
    23fd:	0f 84 84 00 00 00    	je     2487 <gpu_run+0x2037>
    2403:	49 83 fa 04          	cmp    r10,0x4
    2407:	74 5f                	je     2468 <gpu_run+0x2018>
    2409:	49 83 fa 05          	cmp    r10,0x5
    240d:	74 3a                	je     2449 <gpu_run+0x1ff9>
    240f:	49 83 fa 06          	cmp    r10,0x6
    2413:	74 15                	je     242a <gpu_run+0x1fda>
/home/simon/prog/C/EMULATOR/GPU.c:405
						Av[i] = Bv[i] * Cv[i];
    2415:	44 0f 28 4d 10       	movaps xmm9,XMMWORD PTR [rbp+0x10]
    241a:	b9 20 00 00 00       	mov    ecx,0x20
    241f:	45 0f 59 4c 24 10    	mulps  xmm9,XMMWORD PTR [r12+0x10]
    2425:	44 0f 29 4b 10       	movaps XMMWORD PTR [rbx+0x10],xmm9
    242a:	44 0f 28 94 0a 00 00 	movaps xmm10,XMMWORD PTR [rdx+rcx*1+0x0]
    2431:	00 00 
    2433:	44 0f 59 94 0e 00 00 	mulps  xmm10,XMMWORD PTR [rsi+rcx*1+0x0]
    243a:	00 00 
    243c:	44 0f 29 94 08 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm10
    2443:	00 00 
    2445:	48 83 c1 10          	add    rcx,0x10
    2449:	44 0f 28 9c 0a 00 00 	movaps xmm11,XMMWORD PTR [rdx+rcx*1+0x0]
    2450:	00 00 
    2452:	44 0f 59 9c 0e 00 00 	mulps  xmm11,XMMWORD PTR [rsi+rcx*1+0x0]
    2459:	00 00 
    245b:	44 0f 29 9c 08 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm11
    2462:	00 00 
    2464:	48 83 c1 10          	add    rcx,0x10
    2468:	44 0f 28 a4 0a 00 00 	movaps xmm12,XMMWORD PTR [rdx+rcx*1+0x0]
    246f:	00 00 
    2471:	44 0f 59 a4 0e 00 00 	mulps  xmm12,XMMWORD PTR [rsi+rcx*1+0x0]
    2478:	00 00 
    247a:	44 0f 29 a4 08 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm12
    2481:	00 00 
    2483:	48 83 c1 10          	add    rcx,0x10
    2487:	44 0f 28 ac 0a 00 00 	movaps xmm13,XMMWORD PTR [rdx+rcx*1+0x0]
    248e:	00 00 
    2490:	44 0f 59 ac 0e 00 00 	mulps  xmm13,XMMWORD PTR [rsi+rcx*1+0x0]
    2497:	00 00 
    2499:	44 0f 29 ac 08 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm13
    24a0:	00 00 
    24a2:	48 83 c1 10          	add    rcx,0x10
    24a6:	44 0f 28 b4 0a 00 00 	movaps xmm14,XMMWORD PTR [rdx+rcx*1+0x0]
    24ad:	00 00 
    24af:	44 0f 59 b4 0e 00 00 	mulps  xmm14,XMMWORD PTR [rsi+rcx*1+0x0]
    24b6:	00 00 
    24b8:	44 0f 29 b4 08 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm14
    24bf:	00 00 
    24c1:	48 83 c1 10          	add    rcx,0x10
    24c5:	44 0f 28 bc 0a 00 00 	movaps xmm15,XMMWORD PTR [rdx+rcx*1+0x0]
    24cc:	00 00 
    24ce:	44 0f 59 bc 0e 00 00 	mulps  xmm15,XMMWORD PTR [rsi+rcx*1+0x0]
    24d5:	00 00 
    24d7:	44 0f 29 bc 08 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm15
    24de:	00 00 
    24e0:	48 83 c1 10          	add    rcx,0x10
/home/simon/prog/C/EMULATOR/GPU.c:404
					int i = 0;
					cycles += 1;
					v4f * restrict Av = (v4f*)A;
					v4f * restrict Bv = (v4f*)B;
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
    24e4:	49 39 cf             	cmp    r15,rcx
    24e7:	0f 84 8b 00 00 00    	je     2578 <gpu_run+0x2128>
/home/simon/prog/C/EMULATOR/GPU.c:405 (discriminator 2)
						Av[i] = Bv[i] * Cv[i];
    24ed:	0f 28 4c 0d 00       	movaps xmm1,XMMWORD PTR [rbp+rcx*1+0x0]
    24f2:	41 0f 59 0c 0c       	mulps  xmm1,XMMWORD PTR [r12+rcx*1]
    24f7:	0f 29 0c 0b          	movaps XMMWORD PTR [rbx+rcx*1],xmm1
    24fb:	0f 28 44 0d 10       	movaps xmm0,XMMWORD PTR [rbp+rcx*1+0x10]
    2500:	41 0f 59 44 0c 10    	mulps  xmm0,XMMWORD PTR [r12+rcx*1+0x10]
    2506:	0f 29 44 0b 10       	movaps XMMWORD PTR [rbx+rcx*1+0x10],xmm0
    250b:	0f 28 54 0d 20       	movaps xmm2,XMMWORD PTR [rbp+rcx*1+0x20]
    2510:	41 0f 59 54 0c 20    	mulps  xmm2,XMMWORD PTR [r12+rcx*1+0x20]
    2516:	0f 29 54 0b 20       	movaps XMMWORD PTR [rbx+rcx*1+0x20],xmm2
    251b:	0f 28 5c 0d 30       	movaps xmm3,XMMWORD PTR [rbp+rcx*1+0x30]
    2520:	41 0f 59 5c 0c 30    	mulps  xmm3,XMMWORD PTR [r12+rcx*1+0x30]
    2526:	0f 29 5c 0b 30       	movaps XMMWORD PTR [rbx+rcx*1+0x30],xmm3
    252b:	0f 28 64 0d 40       	movaps xmm4,XMMWORD PTR [rbp+rcx*1+0x40]
    2530:	41 0f 59 64 0c 40    	mulps  xmm4,XMMWORD PTR [r12+rcx*1+0x40]
    2536:	0f 29 64 0b 40       	movaps XMMWORD PTR [rbx+rcx*1+0x40],xmm4
    253b:	0f 28 6c 0d 50       	movaps xmm5,XMMWORD PTR [rbp+rcx*1+0x50]
    2540:	41 0f 59 6c 0c 50    	mulps  xmm5,XMMWORD PTR [r12+rcx*1+0x50]
    2546:	0f 29 6c 0b 50       	movaps XMMWORD PTR [rbx+rcx*1+0x50],xmm5
    254b:	0f 28 74 0d 60       	movaps xmm6,XMMWORD PTR [rbp+rcx*1+0x60]
    2550:	41 0f 59 74 0c 60    	mulps  xmm6,XMMWORD PTR [r12+rcx*1+0x60]
    2556:	0f 29 74 0b 60       	movaps XMMWORD PTR [rbx+rcx*1+0x60],xmm6
    255b:	0f 28 7c 0d 70       	movaps xmm7,XMMWORD PTR [rbp+rcx*1+0x70]
    2560:	41 0f 59 7c 0c 70    	mulps  xmm7,XMMWORD PTR [r12+rcx*1+0x70]
    2566:	0f 29 7c 0b 70       	movaps XMMWORD PTR [rbx+rcx*1+0x70],xmm7
    256b:	48 83 e9 80          	sub    rcx,0xffffffffffffff80
/home/simon/prog/C/EMULATOR/GPU.c:404 (discriminator 2)
					int i = 0;
					cycles += 1;
					v4f * restrict Av = (v4f*)A;
					v4f * restrict Bv = (v4f*)B;
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
    256f:	49 39 cf             	cmp    r15,rcx
    2572:	0f 85 75 ff ff ff    	jne    24ed <gpu_run+0x209d>
/home/simon/prog/C/EMULATOR/GPU.c:404
    2578:	46 8d 3c b5 00 00 00 	lea    r15d,[r14*4+0x0]
    257f:	00 
/home/simon/prog/C/EMULATOR/GPU.c:408
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    2580:	8b 7c 24 10          	mov    edi,DWORD PTR [rsp+0x10]
    2584:	44 39 ff             	cmp    edi,r15d
    2587:	0f 8e e3 08 00 00    	jle    2e70 <gpu_run+0x2a20>
    258d:	4d 63 df             	movsxd r11,r15d
    2590:	41 89 f8             	mov    r8d,edi
    2593:	4e 8d 0c 9d 10 00 00 	lea    r9,[r11*4+0x10]
    259a:	00 
    259b:	4c 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],r11
    25a0:	45 29 f8             	sub    r8d,r15d
    25a3:	4d 8d 51 f0          	lea    r10,[r9-0x10]
    25a7:	4e 8d 1c 0b          	lea    r11,[rbx+r9*1]
    25ab:	4e 8d 74 0d 00       	lea    r14,[rbp+r9*1+0x0]
    25b0:	4a 8d 4c 15 00       	lea    rcx,[rbp+r10*1+0x0]
    25b5:	4a 8d 3c 13          	lea    rdi,[rbx+r10*1]
    25b9:	4c 39 d9             	cmp    rcx,r11
    25bc:	0f 93 44 24 18       	setae  BYTE PTR [rsp+0x18]
    25c1:	4c 39 f7             	cmp    rdi,r14
    25c4:	41 0f 93 c6          	setae  r14b
    25c8:	44 0a 74 24 18       	or     r14b,BYTE PTR [rsp+0x18]
    25cd:	44 88 74 24 18       	mov    BYTE PTR [rsp+0x18],r14b
    25d2:	4f 8d 34 14          	lea    r14,[r12+r10*1]
    25d6:	4d 39 de             	cmp    r14,r11
    25d9:	41 0f 93 c3          	setae  r11b
    25dd:	4d 01 e1             	add    r9,r12
    25e0:	4c 39 cf             	cmp    rdi,r9
    25e3:	41 0f 93 c1          	setae  r9b
    25e7:	45 09 cb             	or     r11d,r9d
    25ea:	44 84 5c 24 18       	test   BYTE PTR [rsp+0x18],r11b
    25ef:	0f 84 ef 2c 00 00    	je     52e4 <gpu_run+0x4e94>
    25f5:	41 83 f8 08          	cmp    r8d,0x8
    25f9:	0f 86 e5 2c 00 00    	jbe    52e4 <gpu_run+0x4e94>
    25ff:	83 e1 0f             	and    ecx,0xf
    2602:	48 c1 e9 02          	shr    rcx,0x2
    2606:	48 f7 d9             	neg    rcx
    2609:	83 e1 03             	and    ecx,0x3
    260c:	44 39 c1             	cmp    ecx,r8d
    260f:	49 0f 47 c8          	cmova  rcx,r8
    2613:	85 c9                	test   ecx,ecx
    2615:	0f 84 80 00 00 00    	je     269b <gpu_run+0x224b>
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    261b:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    2620:	45 8d 5f 01          	lea    r11d,[r15+0x1]
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    2624:	48 c1 e7 02          	shl    rdi,0x2
    2628:	83 f9 01             	cmp    ecx,0x1
    262b:	f3 44 0f 10 84 37 00 	movss  xmm8,DWORD PTR [rdi+rsi*1+0x0]
    2632:	00 00 00 
    2635:	f3 44 0f 59 84 17 00 	mulss  xmm8,DWORD PTR [rdi+rdx*1+0x0]
    263c:	00 00 00 
    263f:	f3 44 0f 11 84 07 00 	movss  DWORD PTR [rdi+rax*1+0x0],xmm8
    2646:	00 00 00 
    2649:	0f 84 8d 2c 00 00    	je     52dc <gpu_run+0x4e8c>
    264f:	4d 63 f3             	movsxd r14,r11d
    2652:	83 f9 03             	cmp    ecx,0x3
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    2655:	45 8d 5f 02          	lea    r11d,[r15+0x2]
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    2659:	f3 47 0f 10 0c b4    	movss  xmm9,DWORD PTR [r12+r14*4]
    265f:	f3 46 0f 59 4c b5 00 	mulss  xmm9,DWORD PTR [rbp+r14*4+0x0]
    2666:	f3 46 0f 11 0c b3    	movss  DWORD PTR [rbx+r14*4],xmm9
    266c:	0f 85 6a 2c 00 00    	jne    52dc <gpu_run+0x4e8c>
    2672:	4d 63 cb             	movsxd r9,r11d
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    2675:	41 83 c7 03          	add    r15d,0x3
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    2679:	49 c1 e1 02          	shl    r9,0x2
    267d:	f3 45 0f 10 94 31 00 	movss  xmm10,DWORD PTR [r9+rsi*1+0x0]
    2684:	00 00 00 
    2687:	f3 45 0f 59 94 11 00 	mulss  xmm10,DWORD PTR [r9+rdx*1+0x0]
    268e:	00 00 00 
    2691:	f3 45 0f 11 94 01 00 	movss  DWORD PTR [r9+rax*1+0x0],xmm10
    2698:	00 00 00 
    269b:	4d 8d 14 8a          	lea    r10,[r10+rcx*4]
    269f:	41 29 c8             	sub    r8d,ecx
    26a2:	41 bb 01 00 00 00    	mov    r11d,0x1
    26a8:	45 89 c1             	mov    r9d,r8d
    26ab:	45 8d 40 fc          	lea    r8d,[r8-0x4]
    26af:	b9 10 00 00 00       	mov    ecx,0x10
    26b4:	4d 01 d4             	add    r12,r10
    26b7:	4c 01 d5             	add    rbp,r10
    26ba:	4c 01 d3             	add    rbx,r10
    26bd:	45 0f 10 1c 24       	movups xmm11,XMMWORD PTR [r12]
    26c2:	41 c1 e8 02          	shr    r8d,0x2
    26c6:	41 8d 78 01          	lea    edi,[r8+0x1]
    26ca:	41 83 e0 07          	and    r8d,0x7
    26ce:	44 0f 59 5d 00       	mulps  xmm11,XMMWORD PTR [rbp+0x0]
    26d3:	83 ff 01             	cmp    edi,0x1
    26d6:	44 8d 34 bd 00 00 00 	lea    r14d,[rdi*4+0x0]
    26dd:	00 
    26de:	44 0f 11 1b          	movups XMMWORD PTR [rbx],xmm11
    26e2:	0f 86 e3 00 00 00    	jbe    27cb <gpu_run+0x237b>
    26e8:	45 85 c0             	test   r8d,r8d
    26eb:	0f 84 53 36 00 00    	je     5d44 <gpu_run+0x58f4>
    26f1:	41 83 f8 01          	cmp    r8d,0x1
    26f5:	0f 84 b1 00 00 00    	je     27ac <gpu_run+0x235c>
    26fb:	41 83 f8 02          	cmp    r8d,0x2
    26ff:	0f 84 91 00 00 00    	je     2796 <gpu_run+0x2346>
    2705:	41 83 f8 03          	cmp    r8d,0x3
    2709:	74 75                	je     2780 <gpu_run+0x2330>
    270b:	41 83 f8 04          	cmp    r8d,0x4
    270f:	74 57                	je     2768 <gpu_run+0x2318>
    2711:	41 83 f8 05          	cmp    r8d,0x5
    2715:	74 39                	je     2750 <gpu_run+0x2300>
    2717:	41 83 f8 06          	cmp    r8d,0x6
    271b:	74 1b                	je     2738 <gpu_run+0x22e8>
    271d:	45 0f 10 64 24 10    	movups xmm12,XMMWORD PTR [r12+0x10]
    2723:	41 bb 02 00 00 00    	mov    r11d,0x2
    2729:	b9 20 00 00 00       	mov    ecx,0x20
    272e:	44 0f 59 65 10       	mulps  xmm12,XMMWORD PTR [rbp+0x10]
    2733:	44 0f 11 63 10       	movups XMMWORD PTR [rbx+0x10],xmm12
    2738:	41 83 c3 01          	add    r11d,0x1
    273c:	45 0f 10 2c 0c       	movups xmm13,XMMWORD PTR [r12+rcx*1]
    2741:	44 0f 59 6c 0d 00    	mulps  xmm13,XMMWORD PTR [rbp+rcx*1+0x0]
    2747:	44 0f 11 2c 0b       	movups XMMWORD PTR [rbx+rcx*1],xmm13
    274c:	48 83 c1 10          	add    rcx,0x10
    2750:	41 83 c3 01          	add    r11d,0x1
    2754:	45 0f 10 34 0c       	movups xmm14,XMMWORD PTR [r12+rcx*1]
    2759:	44 0f 59 74 0d 00    	mulps  xmm14,XMMWORD PTR [rbp+rcx*1+0x0]
    275f:	44 0f 11 34 0b       	movups XMMWORD PTR [rbx+rcx*1],xmm14
    2764:	48 83 c1 10          	add    rcx,0x10
    2768:	41 83 c3 01          	add    r11d,0x1
    276c:	45 0f 10 3c 0c       	movups xmm15,XMMWORD PTR [r12+rcx*1]
    2771:	44 0f 59 7c 0d 00    	mulps  xmm15,XMMWORD PTR [rbp+rcx*1+0x0]
    2777:	44 0f 11 3c 0b       	movups XMMWORD PTR [rbx+rcx*1],xmm15
    277c:	48 83 c1 10          	add    rcx,0x10
    2780:	41 83 c3 01          	add    r11d,0x1
    2784:	41 0f 10 0c 0c       	movups xmm1,XMMWORD PTR [r12+rcx*1]
    2789:	0f 59 4c 0d 00       	mulps  xmm1,XMMWORD PTR [rbp+rcx*1+0x0]
    278e:	0f 11 0c 0b          	movups XMMWORD PTR [rbx+rcx*1],xmm1
    2792:	48 83 c1 10          	add    rcx,0x10
    2796:	41 83 c3 01          	add    r11d,0x1
    279a:	41 0f 10 04 0c       	movups xmm0,XMMWORD PTR [r12+rcx*1]
    279f:	0f 59 44 0d 00       	mulps  xmm0,XMMWORD PTR [rbp+rcx*1+0x0]
    27a4:	0f 11 04 0b          	movups XMMWORD PTR [rbx+rcx*1],xmm0
    27a8:	48 83 c1 10          	add    rcx,0x10
    27ac:	41 83 c3 01          	add    r11d,0x1
    27b0:	41 0f 10 14 0c       	movups xmm2,XMMWORD PTR [r12+rcx*1]
    27b5:	0f 59 54 0d 00       	mulps  xmm2,XMMWORD PTR [rbp+rcx*1+0x0]
    27ba:	0f 11 14 0b          	movups XMMWORD PTR [rbx+rcx*1],xmm2
    27be:	48 83 c1 10          	add    rcx,0x10
    27c2:	44 39 df             	cmp    edi,r11d
    27c5:	0f 87 79 35 00 00    	ja     5d44 <gpu_run+0x58f4>
    27cb:	45 39 ce             	cmp    r14d,r9d
    27ce:	43 8d 2c 3e          	lea    ebp,[r14+r15*1]
    27d2:	0f 84 98 06 00 00    	je     2e70 <gpu_run+0x2a20>
    27d8:	48 63 dd             	movsxd rbx,ebp
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    27db:	44 8b 44 24 10       	mov    r8d,DWORD PTR [rsp+0x10]
    27e0:	44 8d 65 01          	lea    r12d,[rbp+0x1]
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    27e4:	48 c1 e3 02          	shl    rbx,0x2
    27e8:	f3 44 0f 10 9c 33 00 	movss  xmm11,DWORD PTR [rbx+rsi*1+0x0]
    27ef:	00 00 00 
    27f2:	f3 44 0f 59 9c 13 00 	mulss  xmm11,DWORD PTR [rbx+rdx*1+0x0]
    27f9:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    27fc:	45 39 c4             	cmp    r12d,r8d
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    27ff:	f3 44 0f 11 9c 03 00 	movss  DWORD PTR [rbx+rax*1+0x0],xmm11
    2806:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    2809:	0f 8d 61 06 00 00    	jge    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    280f:	49 63 fc             	movsxd rdi,r12d
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    2812:	83 c5 02             	add    ebp,0x2
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    2815:	48 c1 e7 02          	shl    rdi,0x2
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    2819:	44 39 c5             	cmp    ebp,r8d
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    281c:	f3 44 0f 10 a4 37 00 	movss  xmm12,DWORD PTR [rdi+rsi*1+0x0]
    2823:	00 00 00 
    2826:	f3 44 0f 59 a4 17 00 	mulss  xmm12,DWORD PTR [rdi+rdx*1+0x0]
    282d:	00 00 00 
    2830:	f3 44 0f 11 a4 07 00 	movss  DWORD PTR [rdi+rax*1+0x0],xmm12
    2837:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    283a:	0f 8d 30 06 00 00    	jge    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    2840:	4c 63 d5             	movsxd r10,ebp
    2843:	49 c1 e2 02          	shl    r10,0x2
    2847:	f3 45 0f 10 ac 32 00 	movss  xmm13,DWORD PTR [r10+rsi*1+0x0]
    284e:	00 00 00 
    2851:	f3 45 0f 59 ac 12 00 	mulss  xmm13,DWORD PTR [r10+rdx*1+0x0]
    2858:	00 00 00 
    285b:	f3 45 0f 11 ac 02 00 	movss  DWORD PTR [r10+rax*1+0x0],xmm13
    2862:	00 00 00 
    2865:	e9 06 06 00 00       	jmp    2e70 <gpu_run+0x2a20>
    286a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:392
					A[i].f = B[i].f + C[i].f;
				}
				break;
			case GPUOP_FSUB://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2870:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 2876 <gpu_run+0x2426>
/home/simon/prog/C/EMULATOR/GPU.c:391
					//}
					A[i].f = B[i].f + C[i].f;
				}
				break;
			case GPUOP_FSUB://float sub
				cycles += 3;
    2876:	48 83 44 24 08 03    	add    QWORD PTR [rsp+0x8],0x3
/home/simon/prog/C/EMULATOR/GPU.c:392
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    287c:	85 c9                	test   ecx,ecx
    287e:	0f 8e ec 05 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:394 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f - C[indx].f;
    2884:	4c 63 15 00 00 00 00 	movsxd r10,DWORD PTR [rip+0x0]        # 288b <gpu_run+0x243b>
    288b:	44 8d 71 ff          	lea    r14d,[rcx-0x1]
    288f:	41 bf 00 00 00 00    	mov    r15d,0x0
    2895:	4a 8d 3c b5 00 00 00 	lea    rdi,[r14*4+0x0]
    289c:	00 
    289d:	41 83 e6 07          	and    r14d,0x7
    28a1:	49 c1 e2 02          	shl    r10,0x2
/home/simon/prog/C/EMULATOR/GPU.c:392 (discriminator 3)
					A[i].f = B[i].f + C[i].f;
				}
				break;
			case GPUOP_FSUB://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    28a5:	49 39 ff             	cmp    r15,rdi
/home/simon/prog/C/EMULATOR/GPU.c:394 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f - C[indx].f;
    28a8:	f3 45 0f 10 b4 12 00 	movss  xmm14,DWORD PTR [r10+rdx*1+0x0]
    28af:	00 00 00 
    28b2:	f3 45 0f 5c b4 32 00 	subss  xmm14,DWORD PTR [r10+rsi*1+0x0]
    28b9:	00 00 00 
    28bc:	f3 45 0f 11 b4 02 00 	movss  DWORD PTR [r10+rax*1+0x0],xmm14
    28c3:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:392 (discriminator 3)
					A[i].f = B[i].f + C[i].f;
				}
				break;
			case GPUOP_FSUB://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    28c6:	0f 84 a4 05 00 00    	je     2e70 <gpu_run+0x2a20>
    28cc:	4d 85 f6             	test   r14,r14
    28cf:	0f 84 63 01 00 00    	je     2a38 <gpu_run+0x25e8>
    28d5:	49 83 fe 01          	cmp    r14,0x1
    28d9:	0f 84 23 01 00 00    	je     2a02 <gpu_run+0x25b2>
    28df:	49 83 fe 02          	cmp    r14,0x2
    28e3:	0f 84 f0 00 00 00    	je     29d9 <gpu_run+0x2589>
    28e9:	49 83 fe 03          	cmp    r14,0x3
    28ed:	0f 84 bd 00 00 00    	je     29b0 <gpu_run+0x2560>
    28f3:	49 83 fe 04          	cmp    r14,0x4
    28f7:	0f 84 8d 00 00 00    	je     298a <gpu_run+0x253a>
    28fd:	49 83 fe 05          	cmp    r14,0x5
    2901:	74 5e                	je     2961 <gpu_run+0x2511>
    2903:	49 83 fe 06          	cmp    r14,0x6
    2907:	74 2f                	je     2938 <gpu_run+0x24e8>
/home/simon/prog/C/EMULATOR/GPU.c:394
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f - C[indx].f;
    2909:	4c 63 1d 00 00 00 00 	movsxd r11,DWORD PTR [rip+0x0]        # 2910 <gpu_run+0x24c0>
    2910:	41 bf 00 00 00 00    	mov    r15d,0x0
    2916:	49 c1 e3 02          	shl    r11,0x2
    291a:	f3 46 0f 10 bc 1a 00 	movss  xmm15,DWORD PTR [rdx+r11*1+0x0]
    2921:	00 00 00 
    2924:	f3 46 0f 5c bc 1e 00 	subss  xmm15,DWORD PTR [rsi+r11*1+0x0]
    292b:	00 00 00 
    292e:	f3 46 0f 11 bc 18 00 	movss  DWORD PTR [rax+r11*1+0x0],xmm15
    2935:	00 00 00 
    2938:	4d 63 0f             	movsxd r9,DWORD PTR [r15]
    293b:	49 83 c7 04          	add    r15,0x4
    293f:	49 c1 e1 02          	shl    r9,0x2
    2943:	f3 42 0f 10 8c 0a 00 	movss  xmm1,DWORD PTR [rdx+r9*1+0x0]
    294a:	00 00 00 
    294d:	f3 42 0f 5c 8c 0e 00 	subss  xmm1,DWORD PTR [rsi+r9*1+0x0]
    2954:	00 00 00 
    2957:	f3 42 0f 11 8c 08 00 	movss  DWORD PTR [rax+r9*1+0x0],xmm1
    295e:	00 00 00 
    2961:	4d 63 07             	movsxd r8,DWORD PTR [r15]
    2964:	49 83 c7 04          	add    r15,0x4
    2968:	49 c1 e0 02          	shl    r8,0x2
    296c:	f3 42 0f 10 84 02 00 	movss  xmm0,DWORD PTR [rdx+r8*1+0x0]
    2973:	00 00 00 
    2976:	f3 42 0f 5c 84 06 00 	subss  xmm0,DWORD PTR [rsi+r8*1+0x0]
    297d:	00 00 00 
    2980:	f3 42 0f 11 84 00 00 	movss  DWORD PTR [rax+r8*1+0x0],xmm0
    2987:	00 00 00 
    298a:	49 63 0f             	movsxd rcx,DWORD PTR [r15]
    298d:	49 83 c7 04          	add    r15,0x4
    2991:	48 c1 e1 02          	shl    rcx,0x2
    2995:	f3 0f 10 94 0a 00 00 	movss  xmm2,DWORD PTR [rdx+rcx*1+0x0]
    299c:	00 00 
    299e:	f3 0f 5c 94 0e 00 00 	subss  xmm2,DWORD PTR [rsi+rcx*1+0x0]
    29a5:	00 00 
    29a7:	f3 0f 11 94 08 00 00 	movss  DWORD PTR [rax+rcx*1+0x0],xmm2
    29ae:	00 00 
    29b0:	4d 63 37             	movsxd r14,DWORD PTR [r15]
    29b3:	49 83 c7 04          	add    r15,0x4
    29b7:	49 c1 e6 02          	shl    r14,0x2
    29bb:	f3 42 0f 10 9c 32 00 	movss  xmm3,DWORD PTR [rdx+r14*1+0x0]
    29c2:	00 00 00 
    29c5:	f3 42 0f 5c 9c 36 00 	subss  xmm3,DWORD PTR [rsi+r14*1+0x0]
    29cc:	00 00 00 
    29cf:	f3 42 0f 11 9c 30 00 	movss  DWORD PTR [rax+r14*1+0x0],xmm3
    29d6:	00 00 00 
    29d9:	4d 63 17             	movsxd r10,DWORD PTR [r15]
    29dc:	49 83 c7 04          	add    r15,0x4
    29e0:	49 c1 e2 02          	shl    r10,0x2
    29e4:	f3 42 0f 10 a4 12 00 	movss  xmm4,DWORD PTR [rdx+r10*1+0x0]
    29eb:	00 00 00 
    29ee:	f3 42 0f 5c a4 16 00 	subss  xmm4,DWORD PTR [rsi+r10*1+0x0]
    29f5:	00 00 00 
    29f8:	f3 42 0f 11 a4 10 00 	movss  DWORD PTR [rax+r10*1+0x0],xmm4
    29ff:	00 00 00 
    2a02:	4d 63 1f             	movsxd r11,DWORD PTR [r15]
    2a05:	49 83 c7 04          	add    r15,0x4
    2a09:	49 c1 e3 02          	shl    r11,0x2
/home/simon/prog/C/EMULATOR/GPU.c:392
					A[i].f = B[i].f + C[i].f;
				}
				break;
			case GPUOP_FSUB://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2a0d:	49 39 ff             	cmp    r15,rdi
/home/simon/prog/C/EMULATOR/GPU.c:394
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f - C[indx].f;
    2a10:	f3 42 0f 10 ac 1a 00 	movss  xmm5,DWORD PTR [rdx+r11*1+0x0]
    2a17:	00 00 00 
    2a1a:	f3 42 0f 5c ac 1e 00 	subss  xmm5,DWORD PTR [rsi+r11*1+0x0]
    2a21:	00 00 00 
    2a24:	f3 42 0f 11 ac 18 00 	movss  DWORD PTR [rax+r11*1+0x0],xmm5
    2a2b:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:392
					A[i].f = B[i].f + C[i].f;
				}
				break;
			case GPUOP_FSUB://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2a2e:	0f 84 3c 04 00 00    	je     2e70 <gpu_run+0x2a20>
    2a34:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:394 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f - C[indx].f;
    2a38:	49 63 37             	movsxd rsi,DWORD PTR [r15]
    2a3b:	49 63 47 04          	movsxd rax,DWORD PTR [r15+0x4]
    2a3f:	49 83 c7 20          	add    r15,0x20
    2a43:	49 63 57 e8          	movsxd rdx,DWORD PTR [r15-0x18]
    2a47:	4d 63 4f ec          	movsxd r9,DWORD PTR [r15-0x14]
    2a4b:	4d 63 47 f0          	movsxd r8,DWORD PTR [r15-0x10]
    2a4f:	49 63 4f f4          	movsxd rcx,DWORD PTR [r15-0xc]
    2a53:	4d 63 77 f8          	movsxd r14,DWORD PTR [r15-0x8]
    2a57:	f3 0f 10 74 b5 00    	movss  xmm6,DWORD PTR [rbp+rsi*4+0x0]
    2a5d:	4d 63 57 fc          	movsxd r10,DWORD PTR [r15-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:392 (discriminator 3)
					A[i].f = B[i].f + C[i].f;
				}
				break;
			case GPUOP_FSUB://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2a61:	49 39 ff             	cmp    r15,rdi
/home/simon/prog/C/EMULATOR/GPU.c:394 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f - C[indx].f;
    2a64:	f3 41 0f 5c 34 b4    	subss  xmm6,DWORD PTR [r12+rsi*4]
    2a6a:	f3 0f 11 34 b3       	movss  DWORD PTR [rbx+rsi*4],xmm6
    2a6f:	f3 0f 10 7c 85 00    	movss  xmm7,DWORD PTR [rbp+rax*4+0x0]
    2a75:	f3 41 0f 5c 3c 84    	subss  xmm7,DWORD PTR [r12+rax*4]
    2a7b:	f3 0f 11 3c 83       	movss  DWORD PTR [rbx+rax*4],xmm7
    2a80:	f3 44 0f 10 44 95 00 	movss  xmm8,DWORD PTR [rbp+rdx*4+0x0]
    2a87:	f3 45 0f 5c 04 94    	subss  xmm8,DWORD PTR [r12+rdx*4]
    2a8d:	f3 44 0f 11 04 93    	movss  DWORD PTR [rbx+rdx*4],xmm8
    2a93:	f3 46 0f 10 4c 8d 00 	movss  xmm9,DWORD PTR [rbp+r9*4+0x0]
    2a9a:	f3 47 0f 5c 0c 8c    	subss  xmm9,DWORD PTR [r12+r9*4]
    2aa0:	f3 46 0f 11 0c 8b    	movss  DWORD PTR [rbx+r9*4],xmm9
    2aa6:	f3 46 0f 10 54 85 00 	movss  xmm10,DWORD PTR [rbp+r8*4+0x0]
    2aad:	f3 47 0f 5c 14 84    	subss  xmm10,DWORD PTR [r12+r8*4]
    2ab3:	f3 46 0f 11 14 83    	movss  DWORD PTR [rbx+r8*4],xmm10
    2ab9:	f3 44 0f 10 5c 8d 00 	movss  xmm11,DWORD PTR [rbp+rcx*4+0x0]
    2ac0:	f3 45 0f 5c 1c 8c    	subss  xmm11,DWORD PTR [r12+rcx*4]
    2ac6:	f3 44 0f 11 1c 8b    	movss  DWORD PTR [rbx+rcx*4],xmm11
    2acc:	f3 46 0f 10 64 b5 00 	movss  xmm12,DWORD PTR [rbp+r14*4+0x0]
    2ad3:	f3 47 0f 5c 24 b4    	subss  xmm12,DWORD PTR [r12+r14*4]
    2ad9:	f3 46 0f 11 24 b3    	movss  DWORD PTR [rbx+r14*4],xmm12
    2adf:	f3 46 0f 10 6c 95 00 	movss  xmm13,DWORD PTR [rbp+r10*4+0x0]
    2ae6:	f3 47 0f 5c 2c 94    	subss  xmm13,DWORD PTR [r12+r10*4]
    2aec:	f3 46 0f 11 2c 93    	movss  DWORD PTR [rbx+r10*4],xmm13
/home/simon/prog/C/EMULATOR/GPU.c:392 (discriminator 3)
					A[i].f = B[i].f + C[i].f;
				}
				break;
			case GPUOP_FSUB://float sub
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2af2:	0f 85 40 ff ff ff    	jne    2a38 <gpu_run+0x25e8>
    2af8:	e9 73 03 00 00       	jmp    2e70 <gpu_run+0x2a20>
    2afd:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:441
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FCMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2b00:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # 2b07 <gpu_run+0x26b7>
/home/simon/prog/C/EMULATOR/GPU.c:440
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FCMP:
				cycles += 2;
    2b07:	48 83 44 24 08 02    	add    QWORD PTR [rsp+0x8],0x2
/home/simon/prog/C/EMULATOR/GPU.c:441
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2b0d:	45 85 db             	test   r11d,r11d
    2b10:	0f 8e 5a 03 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:443
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].f < C[indx].f ? -1 : (B[indx].f > C[indx].f ? 1 : 0);
    2b16:	48 63 3d 00 00 00 00 	movsxd rdi,DWORD PTR [rip+0x0]        # 2b1d <gpu_run+0x26cd>
    2b1d:	41 83 eb 01          	sub    r11d,0x1
    2b21:	41 ba ff ff ff ff    	mov    r10d,0xffffffff
    2b27:	4e 8d 3c 9d 00 00 00 	lea    r15,[r11*4+0x0]
    2b2e:	00 
    2b2f:	41 83 e3 03          	and    r11d,0x3
    2b33:	4d 89 d9             	mov    r9,r11
    2b36:	48 c1 e7 02          	shl    rdi,0x2
    2b3a:	f3 0f 10 8c 17 00 00 	movss  xmm1,DWORD PTR [rdi+rdx*1+0x0]
    2b41:	00 00 
    2b43:	f3 0f 10 84 37 00 00 	movss  xmm0,DWORD PTR [rdi+rsi*1+0x0]
    2b4a:	00 00 
    2b4c:	0f 2e c1             	ucomiss xmm0,xmm1
    2b4f:	0f 86 ee 26 00 00    	jbe    5243 <gpu_run+0x4df3>
    2b55:	b9 00 00 00 00       	mov    ecx,0x0
    2b5a:	44 89 94 07 00 00 00 	mov    DWORD PTR [rdi+rax*1+0x0],r10d
    2b61:	00 
/home/simon/prog/C/EMULATOR/GPU.c:441
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FCMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2b62:	4c 39 f9             	cmp    rcx,r15
    2b65:	0f 84 05 03 00 00    	je     2e70 <gpu_run+0x2a20>
    2b6b:	4d 85 c9             	test   r9,r9
    2b6e:	0f 84 cc 00 00 00    	je     2c40 <gpu_run+0x27f0>
    2b74:	49 83 f9 01          	cmp    r9,0x1
    2b78:	0f 84 82 00 00 00    	je     2c00 <gpu_run+0x27b0>
    2b7e:	49 83 f9 02          	cmp    r9,0x2
    2b82:	74 40                	je     2bc4 <gpu_run+0x2774>
/home/simon/prog/C/EMULATOR/GPU.c:443
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].f < C[indx].f ? -1 : (B[indx].f > C[indx].f ? 1 : 0);
    2b84:	4c 63 05 00 00 00 00 	movsxd r8,DWORD PTR [rip+0x0]        # 2b8b <gpu_run+0x273b>
    2b8b:	41 be ff ff ff ff    	mov    r14d,0xffffffff
    2b91:	49 c1 e0 02          	shl    r8,0x2
    2b95:	f3 42 0f 10 94 02 00 	movss  xmm2,DWORD PTR [rdx+r8*1+0x0]
    2b9c:	00 00 00 
    2b9f:	f3 42 0f 10 9c 06 00 	movss  xmm3,DWORD PTR [rsi+r8*1+0x0]
    2ba6:	00 00 00 
    2ba9:	0f 2e da             	ucomiss xmm3,xmm2
    2bac:	77 0a                	ja     2bb8 <gpu_run+0x2768>
    2bae:	45 31 f6             	xor    r14d,r14d
    2bb1:	0f 2e d3             	ucomiss xmm2,xmm3
    2bb4:	41 0f 97 c6          	seta   r14b
    2bb8:	46 89 b4 00 00 00 00 	mov    DWORD PTR [rax+r8*1+0x0],r14d
    2bbf:	00 
    2bc0:	48 83 c1 04          	add    rcx,0x4
    2bc4:	4c 63 19             	movsxd r11,DWORD PTR [rcx]
    2bc7:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
    2bcd:	49 c1 e3 02          	shl    r11,0x2
    2bd1:	f3 42 0f 10 a4 1a 00 	movss  xmm4,DWORD PTR [rdx+r11*1+0x0]
    2bd8:	00 00 00 
    2bdb:	f3 42 0f 10 ac 1e 00 	movss  xmm5,DWORD PTR [rsi+r11*1+0x0]
    2be2:	00 00 00 
    2be5:	0f 2e ec             	ucomiss xmm5,xmm4
    2be8:	77 0a                	ja     2bf4 <gpu_run+0x27a4>
    2bea:	45 31 c9             	xor    r9d,r9d
    2bed:	0f 2e e5             	ucomiss xmm4,xmm5
    2bf0:	41 0f 97 c1          	seta   r9b
    2bf4:	46 89 8c 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],r9d
    2bfb:	00 
    2bfc:	48 83 c1 04          	add    rcx,0x4
    2c00:	48 63 39             	movsxd rdi,DWORD PTR [rcx]
    2c03:	48 c1 e7 02          	shl    rdi,0x2
    2c07:	f3 0f 10 b4 3a 00 00 	movss  xmm6,DWORD PTR [rdx+rdi*1+0x0]
    2c0e:	00 00 
    2c10:	ba ff ff ff ff       	mov    edx,0xffffffff
    2c15:	f3 0f 10 bc 3e 00 00 	movss  xmm7,DWORD PTR [rsi+rdi*1+0x0]
    2c1c:	00 00 
    2c1e:	0f 2e fe             	ucomiss xmm7,xmm6
    2c21:	77 08                	ja     2c2b <gpu_run+0x27db>
    2c23:	31 d2                	xor    edx,edx
    2c25:	0f 2e f7             	ucomiss xmm6,xmm7
    2c28:	0f 97 c2             	seta   dl
    2c2b:	48 83 c1 04          	add    rcx,0x4
    2c2f:	89 94 38 00 00 00 00 	mov    DWORD PTR [rax+rdi*1+0x0],edx
/home/simon/prog/C/EMULATOR/GPU.c:441
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FCMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2c36:	4c 39 f9             	cmp    rcx,r15
    2c39:	0f 84 31 02 00 00    	je     2e70 <gpu_run+0x2a20>
    2c3f:	90                   	nop
/home/simon/prog/C/EMULATOR/GPU.c:443
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].f < C[indx].f ? -1 : (B[indx].f > C[indx].f ? 1 : 0);
    2c40:	48 63 01             	movsxd rax,DWORD PTR [rcx]
    2c43:	be ff ff ff ff       	mov    esi,0xffffffff
    2c48:	f3 44 0f 10 44 85 00 	movss  xmm8,DWORD PTR [rbp+rax*4+0x0]
    2c4f:	f3 45 0f 10 0c 84    	movss  xmm9,DWORD PTR [r12+rax*4]
    2c55:	45 0f 2e c8          	ucomiss xmm9,xmm8
    2c59:	77 0a                	ja     2c65 <gpu_run+0x2815>
    2c5b:	31 f6                	xor    esi,esi
    2c5d:	45 0f 2e c1          	ucomiss xmm8,xmm9
    2c61:	40 0f 97 c6          	seta   sil
    2c65:	4c 63 41 04          	movsxd r8,DWORD PTR [rcx+0x4]
    2c69:	89 34 83             	mov    DWORD PTR [rbx+rax*4],esi
    2c6c:	4c 8d 51 04          	lea    r10,[rcx+0x4]
    2c70:	b9 ff ff ff ff       	mov    ecx,0xffffffff
    2c75:	f3 46 0f 10 54 85 00 	movss  xmm10,DWORD PTR [rbp+r8*4+0x0]
    2c7c:	f3 47 0f 10 1c 84    	movss  xmm11,DWORD PTR [r12+r8*4]
    2c82:	45 0f 2e da          	ucomiss xmm11,xmm10
    2c86:	77 09                	ja     2c91 <gpu_run+0x2841>
    2c88:	31 c9                	xor    ecx,ecx
    2c8a:	45 0f 2e d3          	ucomiss xmm10,xmm11
    2c8e:	0f 97 c1             	seta   cl
    2c91:	4d 63 72 04          	movsxd r14,DWORD PTR [r10+0x4]
    2c95:	42 89 0c 83          	mov    DWORD PTR [rbx+r8*4],ecx
    2c99:	41 bb ff ff ff ff    	mov    r11d,0xffffffff
    2c9f:	f3 46 0f 10 64 b5 00 	movss  xmm12,DWORD PTR [rbp+r14*4+0x0]
    2ca6:	f3 47 0f 10 2c b4    	movss  xmm13,DWORD PTR [r12+r14*4]
    2cac:	45 0f 2e ec          	ucomiss xmm13,xmm12
    2cb0:	77 0b                	ja     2cbd <gpu_run+0x286d>
    2cb2:	45 31 db             	xor    r11d,r11d
    2cb5:	45 0f 2e e5          	ucomiss xmm12,xmm13
    2cb9:	41 0f 97 c3          	seta   r11b
    2cbd:	4d 63 4a 08          	movsxd r9,DWORD PTR [r10+0x8]
    2cc1:	46 89 1c b3          	mov    DWORD PTR [rbx+r14*4],r11d
    2cc5:	bf ff ff ff ff       	mov    edi,0xffffffff
    2cca:	f3 46 0f 10 74 8d 00 	movss  xmm14,DWORD PTR [rbp+r9*4+0x0]
    2cd1:	f3 47 0f 10 3c 8c    	movss  xmm15,DWORD PTR [r12+r9*4]
    2cd7:	45 0f 2e fe          	ucomiss xmm15,xmm14
    2cdb:	77 0a                	ja     2ce7 <gpu_run+0x2897>
    2cdd:	31 ff                	xor    edi,edi
    2cdf:	45 0f 2e f7          	ucomiss xmm14,xmm15
    2ce3:	40 0f 97 c7          	seta   dil
    2ce7:	49 8d 4a 0c          	lea    rcx,[r10+0xc]
    2ceb:	42 89 3c 8b          	mov    DWORD PTR [rbx+r9*4],edi
/home/simon/prog/C/EMULATOR/GPU.c:441
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FCMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2cef:	4c 39 f9             	cmp    rcx,r15
    2cf2:	0f 85 48 ff ff ff    	jne    2c40 <gpu_run+0x27f0>
    2cf8:	e9 73 01 00 00       	jmp    2e70 <gpu_run+0x2a20>
    2cfd:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:434
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FMIN:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2d00:	44 8b 3d 00 00 00 00 	mov    r15d,DWORD PTR [rip+0x0]        # 2d07 <gpu_run+0x28b7>
/home/simon/prog/C/EMULATOR/GPU.c:433
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FMIN:
				cycles += 1;
    2d07:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:434
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2d0d:	45 85 ff             	test   r15d,r15d
    2d10:	0f 8e 5a 01 00 00    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:436
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
    2d16:	4c 63 35 00 00 00 00 	movsxd r14,DWORD PTR [rip+0x0]        # 2d1d <gpu_run+0x28cd>
    2d1d:	41 83 ef 01          	sub    r15d,0x1
    2d21:	bf 00 00 00 00       	mov    edi,0x0
    2d26:	4e 8d 14 bd 00 00 00 	lea    r10,[r15*4+0x0]
    2d2d:	00 
    2d2e:	41 83 e7 03          	and    r15d,0x3
    2d32:	49 c1 e6 02          	shl    r14,0x2
/home/simon/prog/C/EMULATOR/GPU.c:434
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FMIN:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2d36:	4c 39 d7             	cmp    rdi,r10
/home/simon/prog/C/EMULATOR/GPU.c:436
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
    2d39:	f3 41 0f 10 8c 16 00 	movss  xmm1,DWORD PTR [r14+rdx*1+0x0]
    2d40:	00 00 00 
    2d43:	f3 41 0f 5d 8c 36 00 	minss  xmm1,DWORD PTR [r14+rsi*1+0x0]
    2d4a:	00 00 00 
    2d4d:	f3 41 0f 11 8c 06 00 	movss  DWORD PTR [r14+rax*1+0x0],xmm1
    2d54:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:434
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FMIN:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2d57:	0f 84 13 01 00 00    	je     2e70 <gpu_run+0x2a20>
    2d5d:	4d 85 ff             	test   r15,r15
    2d60:	0f 84 92 00 00 00    	je     2df8 <gpu_run+0x29a8>
    2d66:	49 83 ff 01          	cmp    r15,0x1
    2d6a:	74 5d                	je     2dc9 <gpu_run+0x2979>
    2d6c:	49 83 ff 02          	cmp    r15,0x2
    2d70:	74 2e                	je     2da0 <gpu_run+0x2950>
/home/simon/prog/C/EMULATOR/GPU.c:436
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
    2d72:	4c 63 1d 00 00 00 00 	movsxd r11,DWORD PTR [rip+0x0]        # 2d79 <gpu_run+0x2929>
    2d79:	bf 00 00 00 00       	mov    edi,0x0
    2d7e:	49 c1 e3 02          	shl    r11,0x2
    2d82:	f3 42 0f 10 84 1a 00 	movss  xmm0,DWORD PTR [rdx+r11*1+0x0]
    2d89:	00 00 00 
    2d8c:	f3 42 0f 5d 84 1e 00 	minss  xmm0,DWORD PTR [rsi+r11*1+0x0]
    2d93:	00 00 00 
    2d96:	f3 42 0f 11 84 18 00 	movss  DWORD PTR [rax+r11*1+0x0],xmm0
    2d9d:	00 00 00 
    2da0:	4c 63 0f             	movsxd r9,DWORD PTR [rdi]
    2da3:	48 83 c7 04          	add    rdi,0x4
    2da7:	49 c1 e1 02          	shl    r9,0x2
    2dab:	f3 42 0f 10 94 0a 00 	movss  xmm2,DWORD PTR [rdx+r9*1+0x0]
    2db2:	00 00 00 
    2db5:	f3 42 0f 5d 94 0e 00 	minss  xmm2,DWORD PTR [rsi+r9*1+0x0]
    2dbc:	00 00 00 
    2dbf:	f3 42 0f 11 94 08 00 	movss  DWORD PTR [rax+r9*1+0x0],xmm2
    2dc6:	00 00 00 
    2dc9:	48 63 0f             	movsxd rcx,DWORD PTR [rdi]
    2dcc:	48 83 c7 04          	add    rdi,0x4
    2dd0:	48 c1 e1 02          	shl    rcx,0x2
/home/simon/prog/C/EMULATOR/GPU.c:434
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FMIN:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2dd4:	4c 39 d7             	cmp    rdi,r10
/home/simon/prog/C/EMULATOR/GPU.c:436
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
    2dd7:	f3 0f 10 9c 0a 00 00 	movss  xmm3,DWORD PTR [rdx+rcx*1+0x0]
    2dde:	00 00 
    2de0:	f3 0f 5d 9c 0e 00 00 	minss  xmm3,DWORD PTR [rsi+rcx*1+0x0]
    2de7:	00 00 
    2de9:	f3 0f 11 9c 08 00 00 	movss  DWORD PTR [rax+rcx*1+0x0],xmm3
    2df0:	00 00 
/home/simon/prog/C/EMULATOR/GPU.c:434
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FMIN:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2df2:	74 7c                	je     2e70 <gpu_run+0x2a20>
    2df4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:436
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
    2df8:	48 63 17             	movsxd rdx,DWORD PTR [rdi]
    2dfb:	48 63 47 04          	movsxd rax,DWORD PTR [rdi+0x4]
    2dff:	48 83 c7 10          	add    rdi,0x10
    2e03:	48 63 77 f8          	movsxd rsi,DWORD PTR [rdi-0x8]
    2e07:	4c 63 7f fc          	movsxd r15,DWORD PTR [rdi-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:434
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FMIN:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2e0b:	4c 39 d7             	cmp    rdi,r10
/home/simon/prog/C/EMULATOR/GPU.c:436
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f < C[indx].f ? B[indx].f : C[indx].f;
    2e0e:	f3 0f 10 64 95 00    	movss  xmm4,DWORD PTR [rbp+rdx*4+0x0]
    2e14:	f3 41 0f 5d 24 94    	minss  xmm4,DWORD PTR [r12+rdx*4]
    2e1a:	f3 0f 11 24 93       	movss  DWORD PTR [rbx+rdx*4],xmm4
    2e1f:	f3 0f 10 6c 85 00    	movss  xmm5,DWORD PTR [rbp+rax*4+0x0]
    2e25:	f3 41 0f 5d 2c 84    	minss  xmm5,DWORD PTR [r12+rax*4]
    2e2b:	f3 0f 11 2c 83       	movss  DWORD PTR [rbx+rax*4],xmm5
    2e30:	f3 0f 10 74 b5 00    	movss  xmm6,DWORD PTR [rbp+rsi*4+0x0]
    2e36:	f3 41 0f 5d 34 b4    	minss  xmm6,DWORD PTR [r12+rsi*4]
    2e3c:	f3 0f 11 34 b3       	movss  DWORD PTR [rbx+rsi*4],xmm6
    2e41:	f3 42 0f 10 7c bd 00 	movss  xmm7,DWORD PTR [rbp+r15*4+0x0]
    2e48:	f3 43 0f 5d 3c bc    	minss  xmm7,DWORD PTR [r12+r15*4]
    2e4e:	f3 42 0f 11 3c bb    	movss  DWORD PTR [rbx+r15*4],xmm7
/home/simon/prog/C/EMULATOR/GPU.c:434
					A[indx].f = B[indx].f > C[indx].f ? B[indx].f : C[indx].f;
				}
				break;
			case GPUOP_FMIN:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2e54:	75 a2                	jne    2df8 <gpu_run+0x29a8>
    2e56:	eb 18                	jmp    2e70 <gpu_run+0x2a20>
    2e58:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    2e5f:	00 
/home/simon/prog/C/EMULATOR/GPU.c:345
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = indx;
				}
				break;
			case GPUOP_CEND:
				cycles += 1;//TODO
    2e60:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
    2e66:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    2e6d:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:158
		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOOP;
	}

	while(numThreadsRunning) {
		//abort execution if address exceeds some amount
		if(currentPC >= GPU_COMMAND_BUFFER_SIZE) {
    2e70:	41 81 fd ff 0f 00 00 	cmp    r13d,0xfff
    2e77:	0f 86 13 d6 ff ff    	jbe    490 <gpu_run+0x40>
    2e7d:	e9 3e de ff ff       	jmp    cc0 <gpu_run+0x870>
    2e82:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:339
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2e88:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 2e8e <gpu_run+0x2a3e>
/home/simon/prog/C/EMULATOR/GPU.c:338
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
				}
				break;
			case GPUOP_TID:
				cycles += 1;
    2e8e:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:339
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2e94:	85 c9                	test   ecx,ecx
    2e96:	7e d8                	jle    2e70 <gpu_run+0x2a20>
    2e98:	44 8d 51 ff          	lea    r10d,[rcx-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:340 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
    2e9c:	48 63 2d 00 00 00 00 	movsxd rbp,DWORD PTR [rip+0x0]        # 2ea3 <gpu_run+0x2a53>
    2ea3:	bf 00 00 00 00       	mov    edi,0x0
    2ea8:	4e 8d 1c 95 00 00 00 	lea    r11,[r10*4+0x0]
    2eaf:	00 
    2eb0:	41 83 e2 07          	and    r10d,0x7
/home/simon/prog/C/EMULATOR/GPU.c:339 (discriminator 3)
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2eb4:	4c 39 df             	cmp    rdi,r11
/home/simon/prog/C/EMULATOR/GPU.c:341 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = indx;
    2eb7:	89 2c ab             	mov    DWORD PTR [rbx+rbp*4],ebp
/home/simon/prog/C/EMULATOR/GPU.c:339 (discriminator 3)
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2eba:	74 b4                	je     2e70 <gpu_run+0x2a20>
    2ebc:	4d 85 d2             	test   r10,r10
    2ebf:	74 7f                	je     2f40 <gpu_run+0x2af0>
    2ec1:	49 83 fa 01          	cmp    r10,0x1
    2ec5:	74 63                	je     2f2a <gpu_run+0x2ada>
    2ec7:	49 83 fa 02          	cmp    r10,0x2
    2ecb:	74 52                	je     2f1f <gpu_run+0x2acf>
    2ecd:	49 83 fa 03          	cmp    r10,0x3
    2ed1:	74 41                	je     2f14 <gpu_run+0x2ac4>
    2ed3:	49 83 fa 04          	cmp    r10,0x4
    2ed7:	74 31                	je     2f0a <gpu_run+0x2aba>
    2ed9:	49 83 fa 05          	cmp    r10,0x5
    2edd:	74 20                	je     2eff <gpu_run+0x2aaf>
    2edf:	49 83 fa 06          	cmp    r10,0x6
    2ee3:	74 10                	je     2ef5 <gpu_run+0x2aa5>
/home/simon/prog/C/EMULATOR/GPU.c:340
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
    2ee5:	4c 63 0d 00 00 00 00 	movsxd r9,DWORD PTR [rip+0x0]        # 2eec <gpu_run+0x2a9c>
    2eec:	bf 00 00 00 00       	mov    edi,0x0
/home/simon/prog/C/EMULATOR/GPU.c:341
					A[indx].i = indx;
    2ef1:	46 89 0c 8b          	mov    DWORD PTR [rbx+r9*4],r9d
/home/simon/prog/C/EMULATOR/GPU.c:340
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
    2ef5:	48 63 37             	movsxd rsi,DWORD PTR [rdi]
    2ef8:	48 83 c7 04          	add    rdi,0x4
/home/simon/prog/C/EMULATOR/GPU.c:341
					A[indx].i = indx;
    2efc:	89 34 b3             	mov    DWORD PTR [rbx+rsi*4],esi
/home/simon/prog/C/EMULATOR/GPU.c:340
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
    2eff:	4c 63 3f             	movsxd r15,DWORD PTR [rdi]
    2f02:	48 83 c7 04          	add    rdi,0x4
/home/simon/prog/C/EMULATOR/GPU.c:341
					A[indx].i = indx;
    2f06:	46 89 3c bb          	mov    DWORD PTR [rbx+r15*4],r15d
/home/simon/prog/C/EMULATOR/GPU.c:340
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
    2f0a:	48 63 0f             	movsxd rcx,DWORD PTR [rdi]
    2f0d:	48 83 c7 04          	add    rdi,0x4
/home/simon/prog/C/EMULATOR/GPU.c:341
					A[indx].i = indx;
    2f11:	89 0c 8b             	mov    DWORD PTR [rbx+rcx*4],ecx
/home/simon/prog/C/EMULATOR/GPU.c:340
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
    2f14:	4c 63 17             	movsxd r10,DWORD PTR [rdi]
    2f17:	48 83 c7 04          	add    rdi,0x4
/home/simon/prog/C/EMULATOR/GPU.c:341
					A[indx].i = indx;
    2f1b:	46 89 14 93          	mov    DWORD PTR [rbx+r10*4],r10d
/home/simon/prog/C/EMULATOR/GPU.c:340
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
    2f1f:	4c 63 07             	movsxd r8,DWORD PTR [rdi]
    2f22:	48 83 c7 04          	add    rdi,0x4
/home/simon/prog/C/EMULATOR/GPU.c:341
					A[indx].i = indx;
    2f26:	46 89 04 83          	mov    DWORD PTR [rbx+r8*4],r8d
/home/simon/prog/C/EMULATOR/GPU.c:340
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
    2f2a:	48 63 07             	movsxd rax,DWORD PTR [rdi]
    2f2d:	48 83 c7 04          	add    rdi,0x4
/home/simon/prog/C/EMULATOR/GPU.c:339
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2f31:	4c 39 df             	cmp    rdi,r11
/home/simon/prog/C/EMULATOR/GPU.c:341
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = indx;
    2f34:	89 04 83             	mov    DWORD PTR [rbx+rax*4],eax
/home/simon/prog/C/EMULATOR/GPU.c:339
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2f37:	0f 84 33 ff ff ff    	je     2e70 <gpu_run+0x2a20>
    2f3d:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:340 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
    2f40:	4c 63 37             	movsxd r14,DWORD PTR [rdi]
    2f43:	4c 63 67 04          	movsxd r12,DWORD PTR [rdi+0x4]
    2f47:	48 83 c7 20          	add    rdi,0x20
    2f4b:	4c 63 57 e8          	movsxd r10,DWORD PTR [rdi-0x18]
    2f4f:	48 63 6f ec          	movsxd rbp,DWORD PTR [rdi-0x14]
    2f53:	4c 63 4f f0          	movsxd r9,DWORD PTR [rdi-0x10]
    2f57:	48 63 77 f4          	movsxd rsi,DWORD PTR [rdi-0xc]
    2f5b:	4c 63 7f f8          	movsxd r15,DWORD PTR [rdi-0x8]
    2f5f:	48 63 4f fc          	movsxd rcx,DWORD PTR [rdi-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:339 (discriminator 3)
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2f63:	4c 39 df             	cmp    rdi,r11
/home/simon/prog/C/EMULATOR/GPU.c:341 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = indx;
    2f66:	46 89 34 b3          	mov    DWORD PTR [rbx+r14*4],r14d
    2f6a:	46 89 24 a3          	mov    DWORD PTR [rbx+r12*4],r12d
    2f6e:	46 89 14 93          	mov    DWORD PTR [rbx+r10*4],r10d
    2f72:	89 2c ab             	mov    DWORD PTR [rbx+rbp*4],ebp
    2f75:	46 89 0c 8b          	mov    DWORD PTR [rbx+r9*4],r9d
    2f79:	89 34 b3             	mov    DWORD PTR [rbx+rsi*4],esi
    2f7c:	46 89 3c bb          	mov    DWORD PTR [rbx+r15*4],r15d
    2f80:	89 0c 8b             	mov    DWORD PTR [rbx+rcx*4],ecx
/home/simon/prog/C/EMULATOR/GPU.c:339 (discriminator 3)
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
				}
				break;
			case GPUOP_TID:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2f83:	75 bb                	jne    2f40 <gpu_run+0x2af0>
    2f85:	e9 e6 fe ff ff       	jmp    2e70 <gpu_run+0x2a20>
    2f8a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:332
					}
				}
				break;
			case GPUOP_SEL:
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2f90:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # 2f97 <gpu_run+0x2b47>
/home/simon/prog/C/EMULATOR/GPU.c:331
						A[indx].i = tmp;
					}
				}
				break;
			case GPUOP_SEL:
				cycles += 3;
    2f97:	48 83 44 24 08 03    	add    QWORD PTR [rsp+0x8],0x3
/home/simon/prog/C/EMULATOR/GPU.c:332
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2f9d:	45 85 db             	test   r11d,r11d
    2fa0:	0f 8e ca fe ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:334
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
    2fa6:	48 63 05 00 00 00 00 	movsxd rax,DWORD PTR [rip+0x0]        # 2fad <gpu_run+0x2b5d>
    2fad:	41 83 eb 01          	sub    r11d,0x1
    2fb1:	4a 8d 0c 9d 00 00 00 	lea    rcx,[r11*4+0x0]
    2fb8:	00 
    2fb9:	41 83 e3 03          	and    r11d,0x3
    2fbd:	4c 89 df             	mov    rdi,r11
    2fc0:	48 c1 e0 02          	shl    rax,0x2
    2fc4:	44 8b 84 30 00 00 00 	mov    r8d,DWORD PTR [rax+rsi*1+0x0]
    2fcb:	00 
    2fcc:	4c 8d 0c 03          	lea    r9,[rbx+rax*1]
    2fd0:	45 85 c0             	test   r8d,r8d
    2fd3:	0f 85 79 22 00 00    	jne    5252 <gpu_run+0x4e02>
    2fd9:	44 8b b4 10 00 00 00 	mov    r14d,DWORD PTR [rax+rdx*1+0x0]
    2fe0:	00 
    2fe1:	b8 00 00 00 00       	mov    eax,0x0
    2fe6:	45 89 31             	mov    DWORD PTR [r9],r14d
/home/simon/prog/C/EMULATOR/GPU.c:332
					}
				}
				break;
			case GPUOP_SEL:
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    2fe9:	48 39 c8             	cmp    rax,rcx
    2fec:	0f 84 7e fe ff ff    	je     2e70 <gpu_run+0x2a20>
    2ff2:	48 85 ff             	test   rdi,rdi
    2ff5:	0f 84 07 01 00 00    	je     3102 <gpu_run+0x2cb2>
    2ffb:	48 83 ff 01          	cmp    rdi,0x1
    2fff:	74 60                	je     3061 <gpu_run+0x2c11>
    3001:	48 83 ff 02          	cmp    rdi,0x2
    3005:	74 2f                	je     3036 <gpu_run+0x2be6>
/home/simon/prog/C/EMULATOR/GPU.c:334
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
    3007:	4c 63 15 00 00 00 00 	movsxd r10,DWORD PTR [rip+0x0]        # 300e <gpu_run+0x2bbe>
    300e:	49 c1 e2 02          	shl    r10,0x2
    3012:	46 8b bc 16 00 00 00 	mov    r15d,DWORD PTR [rsi+r10*1+0x0]
    3019:	00 
    301a:	4e 8d 1c 13          	lea    r11,[rbx+r10*1]
    301e:	45 85 ff             	test   r15d,r15d
    3021:	0f 85 81 22 00 00    	jne    52a8 <gpu_run+0x4e58>
    3027:	42 8b bc 12 00 00 00 	mov    edi,DWORD PTR [rdx+r10*1+0x0]
    302e:	00 
    302f:	41 89 3b             	mov    DWORD PTR [r11],edi
    3032:	48 83 c0 04          	add    rax,0x4
    3036:	4c 63 00             	movsxd r8,DWORD PTR [rax]
    3039:	49 c1 e0 02          	shl    r8,0x2
    303d:	46 8b b4 06 00 00 00 	mov    r14d,DWORD PTR [rsi+r8*1+0x0]
    3044:	00 
    3045:	4e 8d 0c 03          	lea    r9,[rbx+r8*1]
    3049:	45 85 f6             	test   r14d,r14d
    304c:	0f 85 5e 22 00 00    	jne    52b0 <gpu_run+0x4e60>
    3052:	46 8b 94 02 00 00 00 	mov    r10d,DWORD PTR [rdx+r8*1+0x0]
    3059:	00 
    305a:	45 89 11             	mov    DWORD PTR [r9],r10d
    305d:	48 83 c0 04          	add    rax,0x4
    3061:	4c 63 38             	movsxd r15,DWORD PTR [rax]
    3064:	49 c1 e7 02          	shl    r15,0x2
    3068:	42 8b b4 3e 00 00 00 	mov    esi,DWORD PTR [rsi+r15*1+0x0]
    306f:	00 
    3070:	4a 8d 3c 3b          	lea    rdi,[rbx+r15*1]
    3074:	85 f6                	test   esi,esi
    3076:	0f 85 3c 22 00 00    	jne    52b8 <gpu_run+0x4e68>
    307c:	42 8b 94 3a 00 00 00 	mov    edx,DWORD PTR [rdx+r15*1+0x0]
    3083:	00 
    3084:	48 83 c0 04          	add    rax,0x4
    3088:	89 17                	mov    DWORD PTR [rdi],edx
/home/simon/prog/C/EMULATOR/GPU.c:332
					}
				}
				break;
			case GPUOP_SEL:
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    308a:	48 39 c8             	cmp    rax,rcx
    308d:	75 73                	jne    3102 <gpu_run+0x2cb2>
    308f:	e9 dc fd ff ff       	jmp    2e70 <gpu_run+0x2a20>
    3094:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:334 (discriminator 1)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
    3098:	45 8b 30             	mov    r14d,DWORD PTR [r8]
    309b:	4c 8d 78 04          	lea    r15,[rax+0x4]
/home/simon/prog/C/EMULATOR/GPU.c:334 (discriminator 4)
    309f:	48 63 40 04          	movsxd rax,DWORD PTR [rax+0x4]
    30a3:	45 89 30             	mov    DWORD PTR [r8],r14d
    30a6:	41 8b 3c 84          	mov    edi,DWORD PTR [r12+rax*4]
    30aa:	4c 8d 14 83          	lea    r10,[rbx+rax*4]
    30ae:	85 ff                	test   edi,edi
    30b0:	0f 84 da 21 00 00    	je     5290 <gpu_run+0x4e40>
/home/simon/prog/C/EMULATOR/GPU.c:334
    30b6:	41 8b 32             	mov    esi,DWORD PTR [r10]
    30b9:	49 63 57 04          	movsxd rdx,DWORD PTR [r15+0x4]
    30bd:	41 89 32             	mov    DWORD PTR [r10],esi
    30c0:	45 8b 04 94          	mov    r8d,DWORD PTR [r12+rdx*4]
    30c4:	4c 8d 1c 93          	lea    r11,[rbx+rdx*4]
    30c8:	45 85 c0             	test   r8d,r8d
    30cb:	0f 85 af 21 00 00    	jne    5280 <gpu_run+0x4e30>
    30d1:	44 8b 4c 95 00       	mov    r9d,DWORD PTR [rbp+rdx*4+0x0]
    30d6:	4d 63 77 08          	movsxd r14,DWORD PTR [r15+0x8]
    30da:	45 89 0b             	mov    DWORD PTR [r11],r9d
    30dd:	43 8b 04 b4          	mov    eax,DWORD PTR [r12+r14*4]
    30e1:	4e 8d 14 b3          	lea    r10,[rbx+r14*4]
    30e5:	85 c0                	test   eax,eax
    30e7:	0f 85 b3 21 00 00    	jne    52a0 <gpu_run+0x4e50>
    30ed:	42 8b 7c b5 00       	mov    edi,DWORD PTR [rbp+r14*4+0x0]
    30f2:	49 8d 47 0c          	lea    rax,[r15+0xc]
    30f6:	41 89 3a             	mov    DWORD PTR [r10],edi
/home/simon/prog/C/EMULATOR/GPU.c:332
					}
				}
				break;
			case GPUOP_SEL:
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    30f9:	48 39 c8             	cmp    rax,rcx
    30fc:	0f 84 6e fd ff ff    	je     2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:334
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
    3102:	4c 63 18             	movsxd r11,DWORD PTR [rax]
    3105:	47 8b 0c 9c          	mov    r9d,DWORD PTR [r12+r11*4]
    3109:	4e 8d 04 9b          	lea    r8,[rbx+r11*4]
    310d:	45 85 c9             	test   r9d,r9d
    3110:	75 86                	jne    3098 <gpu_run+0x2c48>
/home/simon/prog/C/EMULATOR/GPU.c:334 (discriminator 2)
    3112:	46 8b 74 9d 00       	mov    r14d,DWORD PTR [rbp+r11*4+0x0]
    3117:	eb 82                	jmp    309b <gpu_run+0x2c4b>
    3119:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:324
				break;
			case GPUOP_MOVIH:
				{
					cycles += 1;
					uint32_t tmp = (inst&0xffff0000);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3120:	8b 2d 00 00 00 00    	mov    ebp,DWORD PTR [rip+0x0]        # 3126 <gpu_run+0x2cd6>
/home/simon/prog/C/EMULATOR/GPU.c:322
					}
				}
				break;
			case GPUOP_MOVIH:
				{
					cycles += 1;
    3126:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:323
					uint32_t tmp = (inst&0xffff0000);
    312c:	66 45 31 db          	xor    r11w,r11w
/home/simon/prog/C/EMULATOR/GPU.c:324
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3130:	85 ed                	test   ebp,ebp
    3132:	0f 8e 38 fd ff ff    	jle    2e70 <gpu_run+0x2a20>
    3138:	44 8d 65 ff          	lea    r12d,[rbp-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:326 (discriminator 3)
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = tmp;
    313c:	4c 63 3d 00 00 00 00 	movsxd r15,DWORD PTR [rip+0x0]        # 3143 <gpu_run+0x2cf3>
    3143:	41 b8 00 00 00 00    	mov    r8d,0x0
    3149:	4a 8d 0c a5 00 00 00 	lea    rcx,[r12*4+0x0]
    3150:	00 
    3151:	41 83 e4 07          	and    r12d,0x7
/home/simon/prog/C/EMULATOR/GPU.c:324 (discriminator 3)
				break;
			case GPUOP_MOVIH:
				{
					cycles += 1;
					uint32_t tmp = (inst&0xffff0000);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3155:	49 39 c8             	cmp    r8,rcx
/home/simon/prog/C/EMULATOR/GPU.c:326 (discriminator 3)
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = tmp;
    3158:	46 89 1c bb          	mov    DWORD PTR [rbx+r15*4],r11d
/home/simon/prog/C/EMULATOR/GPU.c:324 (discriminator 3)
				break;
			case GPUOP_MOVIH:
				{
					cycles += 1;
					uint32_t tmp = (inst&0xffff0000);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    315c:	0f 84 0e fd ff ff    	je     2e70 <gpu_run+0x2a20>
    3162:	4d 85 e4             	test   r12,r12
    3165:	0f 84 85 00 00 00    	je     31f0 <gpu_run+0x2da0>
    316b:	49 83 fc 01          	cmp    r12,0x1
    316f:	74 66                	je     31d7 <gpu_run+0x2d87>
    3171:	49 83 fc 02          	cmp    r12,0x2
    3175:	74 55                	je     31cc <gpu_run+0x2d7c>
    3177:	49 83 fc 03          	cmp    r12,0x3
    317b:	74 44                	je     31c1 <gpu_run+0x2d71>
    317d:	49 83 fc 04          	cmp    r12,0x4
    3181:	74 33                	je     31b6 <gpu_run+0x2d66>
    3183:	49 83 fc 05          	cmp    r12,0x5
    3187:	74 22                	je     31ab <gpu_run+0x2d5b>
    3189:	49 83 fc 06          	cmp    r12,0x6
    318d:	74 11                	je     31a0 <gpu_run+0x2d50>
/home/simon/prog/C/EMULATOR/GPU.c:326
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = tmp;
    318f:	48 63 35 00 00 00 00 	movsxd rsi,DWORD PTR [rip+0x0]        # 3196 <gpu_run+0x2d46>
    3196:	41 b8 00 00 00 00    	mov    r8d,0x0
    319c:	44 89 1c b3          	mov    DWORD PTR [rbx+rsi*4],r11d
    31a0:	49 63 10             	movsxd rdx,DWORD PTR [r8]
    31a3:	49 83 c0 04          	add    r8,0x4
    31a7:	44 89 1c 93          	mov    DWORD PTR [rbx+rdx*4],r11d
    31ab:	4d 63 08             	movsxd r9,DWORD PTR [r8]
    31ae:	49 83 c0 04          	add    r8,0x4
    31b2:	46 89 1c 8b          	mov    DWORD PTR [rbx+r9*4],r11d
    31b6:	4d 63 30             	movsxd r14,DWORD PTR [r8]
    31b9:	49 83 c0 04          	add    r8,0x4
    31bd:	46 89 1c b3          	mov    DWORD PTR [rbx+r14*4],r11d
    31c1:	4d 63 10             	movsxd r10,DWORD PTR [r8]
    31c4:	49 83 c0 04          	add    r8,0x4
    31c8:	46 89 1c 93          	mov    DWORD PTR [rbx+r10*4],r11d
    31cc:	49 63 38             	movsxd rdi,DWORD PTR [r8]
    31cf:	49 83 c0 04          	add    r8,0x4
    31d3:	44 89 1c bb          	mov    DWORD PTR [rbx+rdi*4],r11d
    31d7:	49 63 00             	movsxd rax,DWORD PTR [r8]
    31da:	49 83 c0 04          	add    r8,0x4
/home/simon/prog/C/EMULATOR/GPU.c:324
				break;
			case GPUOP_MOVIH:
				{
					cycles += 1;
					uint32_t tmp = (inst&0xffff0000);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    31de:	49 39 c8             	cmp    r8,rcx
/home/simon/prog/C/EMULATOR/GPU.c:326
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = tmp;
    31e1:	44 89 1c 83          	mov    DWORD PTR [rbx+rax*4],r11d
/home/simon/prog/C/EMULATOR/GPU.c:324
				break;
			case GPUOP_MOVIH:
				{
					cycles += 1;
					uint32_t tmp = (inst&0xffff0000);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    31e5:	0f 84 85 fc ff ff    	je     2e70 <gpu_run+0x2a20>
    31eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:326 (discriminator 3)
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = tmp;
    31f0:	49 63 28             	movsxd rbp,DWORD PTR [r8]
    31f3:	4d 63 60 04          	movsxd r12,DWORD PTR [r8+0x4]
    31f7:	49 83 c0 20          	add    r8,0x20
    31fb:	4d 63 78 e8          	movsxd r15,DWORD PTR [r8-0x18]
    31ff:	49 63 70 ec          	movsxd rsi,DWORD PTR [r8-0x14]
    3203:	49 63 50 f0          	movsxd rdx,DWORD PTR [r8-0x10]
    3207:	4d 63 48 f4          	movsxd r9,DWORD PTR [r8-0xc]
    320b:	4d 63 70 f8          	movsxd r14,DWORD PTR [r8-0x8]
    320f:	4d 63 50 fc          	movsxd r10,DWORD PTR [r8-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:324 (discriminator 3)
				break;
			case GPUOP_MOVIH:
				{
					cycles += 1;
					uint32_t tmp = (inst&0xffff0000);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3213:	49 39 c8             	cmp    r8,rcx
/home/simon/prog/C/EMULATOR/GPU.c:326 (discriminator 3)
						int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].i = tmp;
    3216:	44 89 1c ab          	mov    DWORD PTR [rbx+rbp*4],r11d
    321a:	46 89 1c a3          	mov    DWORD PTR [rbx+r12*4],r11d
    321e:	46 89 1c bb          	mov    DWORD PTR [rbx+r15*4],r11d
    3222:	44 89 1c b3          	mov    DWORD PTR [rbx+rsi*4],r11d
    3226:	44 89 1c 93          	mov    DWORD PTR [rbx+rdx*4],r11d
    322a:	46 89 1c 8b          	mov    DWORD PTR [rbx+r9*4],r11d
    322e:	46 89 1c b3          	mov    DWORD PTR [rbx+r14*4],r11d
    3232:	46 89 1c 93          	mov    DWORD PTR [rbx+r10*4],r11d
/home/simon/prog/C/EMULATOR/GPU.c:324 (discriminator 3)
				break;
			case GPUOP_MOVIH:
				{
					cycles += 1;
					uint32_t tmp = (inst&0xffff0000);
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3236:	75 b8                	jne    31f0 <gpu_run+0x2da0>
    3238:	e9 33 fc ff ff       	jmp    2e70 <gpu_run+0x2a20>
    323d:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:249
	        		A[indx].i = B[indx].i & C[indx].i;
	      		}
				break;
			case GPUOP_OR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3240:	44 8b 35 00 00 00 00 	mov    r14d,DWORD PTR [rip+0x0]        # 3247 <gpu_run+0x2df7>
/home/simon/prog/C/EMULATOR/GPU.c:248
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i & C[indx].i;
	      		}
				break;
			case GPUOP_OR:
				cycles += 1;
    3247:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:249
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    324d:	45 85 f6             	test   r14d,r14d
    3250:	0f 8e 1a fc ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:251 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i | C[indx].i;
    3256:	4c 63 3d 00 00 00 00 	movsxd r15,DWORD PTR [rip+0x0]        # 325d <gpu_run+0x2e0d>
    325d:	45 8d 46 ff          	lea    r8d,[r14-0x1]
    3261:	41 be 00 00 00 00    	mov    r14d,0x0
    3267:	4e 8d 1c 85 00 00 00 	lea    r11,[r8*4+0x0]
    326e:	00 
    326f:	41 83 e0 07          	and    r8d,0x7
    3273:	49 c1 e7 02          	shl    r15,0x2
    3277:	41 8b bc 17 00 00 00 	mov    edi,DWORD PTR [r15+rdx*1+0x0]
    327e:	00 
    327f:	41 0b bc 37 00 00 00 	or     edi,DWORD PTR [r15+rsi*1+0x0]
    3286:	00 
/home/simon/prog/C/EMULATOR/GPU.c:249 (discriminator 3)
	        		A[indx].i = B[indx].i & C[indx].i;
	      		}
				break;
			case GPUOP_OR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3287:	4d 39 f3             	cmp    r11,r14
/home/simon/prog/C/EMULATOR/GPU.c:251 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i | C[indx].i;
    328a:	41 89 bc 07 00 00 00 	mov    DWORD PTR [r15+rax*1+0x0],edi
    3291:	00 
/home/simon/prog/C/EMULATOR/GPU.c:249 (discriminator 3)
	        		A[indx].i = B[indx].i & C[indx].i;
	      		}
				break;
			case GPUOP_OR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3292:	0f 84 d8 fb ff ff    	je     2e70 <gpu_run+0x2a20>
    3298:	4d 85 c0             	test   r8,r8
    329b:	0f 84 37 01 00 00    	je     33d8 <gpu_run+0x2f88>
    32a1:	49 83 f8 01          	cmp    r8,0x1
    32a5:	0f 84 fe 00 00 00    	je     33a9 <gpu_run+0x2f59>
    32ab:	49 83 f8 02          	cmp    r8,0x2
    32af:	0f 84 d1 00 00 00    	je     3386 <gpu_run+0x2f36>
    32b5:	49 83 f8 03          	cmp    r8,0x3
    32b9:	0f 84 a4 00 00 00    	je     3363 <gpu_run+0x2f13>
    32bf:	49 83 f8 04          	cmp    r8,0x4
    32c3:	74 7b                	je     3340 <gpu_run+0x2ef0>
    32c5:	49 83 f8 05          	cmp    r8,0x5
    32c9:	74 52                	je     331d <gpu_run+0x2ecd>
    32cb:	49 83 f8 06          	cmp    r8,0x6
    32cf:	74 29                	je     32fa <gpu_run+0x2eaa>
/home/simon/prog/C/EMULATOR/GPU.c:251
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i | C[indx].i;
    32d1:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 32d8 <gpu_run+0x2e88>
    32d8:	41 be 00 00 00 00    	mov    r14d,0x0
    32de:	48 c1 e1 02          	shl    rcx,0x2
    32e2:	44 8b 8c 0a 00 00 00 	mov    r9d,DWORD PTR [rdx+rcx*1+0x0]
    32e9:	00 
    32ea:	44 0b 8c 0e 00 00 00 	or     r9d,DWORD PTR [rsi+rcx*1+0x0]
    32f1:	00 
    32f2:	44 89 8c 08 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],r9d
    32f9:	00 
    32fa:	4d 63 06             	movsxd r8,DWORD PTR [r14]
    32fd:	49 83 c6 04          	add    r14,0x4
    3301:	49 c1 e0 02          	shl    r8,0x2
    3305:	46 8b 94 02 00 00 00 	mov    r10d,DWORD PTR [rdx+r8*1+0x0]
    330c:	00 
    330d:	46 0b 94 06 00 00 00 	or     r10d,DWORD PTR [rsi+r8*1+0x0]
    3314:	00 
    3315:	46 89 94 00 00 00 00 	mov    DWORD PTR [rax+r8*1+0x0],r10d
    331c:	00 
    331d:	4d 63 3e             	movsxd r15,DWORD PTR [r14]
    3320:	49 83 c6 04          	add    r14,0x4
    3324:	49 c1 e7 02          	shl    r15,0x2
    3328:	42 8b bc 3a 00 00 00 	mov    edi,DWORD PTR [rdx+r15*1+0x0]
    332f:	00 
    3330:	42 0b bc 3e 00 00 00 	or     edi,DWORD PTR [rsi+r15*1+0x0]
    3337:	00 
    3338:	42 89 bc 38 00 00 00 	mov    DWORD PTR [rax+r15*1+0x0],edi
    333f:	00 
    3340:	49 63 0e             	movsxd rcx,DWORD PTR [r14]
    3343:	49 83 c6 04          	add    r14,0x4
    3347:	48 c1 e1 02          	shl    rcx,0x2
    334b:	44 8b 8c 0a 00 00 00 	mov    r9d,DWORD PTR [rdx+rcx*1+0x0]
    3352:	00 
    3353:	44 0b 8c 0e 00 00 00 	or     r9d,DWORD PTR [rsi+rcx*1+0x0]
    335a:	00 
    335b:	44 89 8c 08 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],r9d
    3362:	00 
    3363:	4d 63 06             	movsxd r8,DWORD PTR [r14]
    3366:	49 83 c6 04          	add    r14,0x4
    336a:	49 c1 e0 02          	shl    r8,0x2
    336e:	46 8b 94 02 00 00 00 	mov    r10d,DWORD PTR [rdx+r8*1+0x0]
    3375:	00 
    3376:	46 0b 94 06 00 00 00 	or     r10d,DWORD PTR [rsi+r8*1+0x0]
    337d:	00 
    337e:	46 89 94 00 00 00 00 	mov    DWORD PTR [rax+r8*1+0x0],r10d
    3385:	00 
    3386:	4d 63 3e             	movsxd r15,DWORD PTR [r14]
    3389:	49 83 c6 04          	add    r14,0x4
    338d:	49 c1 e7 02          	shl    r15,0x2
    3391:	42 8b bc 3a 00 00 00 	mov    edi,DWORD PTR [rdx+r15*1+0x0]
    3398:	00 
    3399:	42 0b bc 3e 00 00 00 	or     edi,DWORD PTR [rsi+r15*1+0x0]
    33a0:	00 
    33a1:	42 89 bc 38 00 00 00 	mov    DWORD PTR [rax+r15*1+0x0],edi
    33a8:	00 
    33a9:	49 63 0e             	movsxd rcx,DWORD PTR [r14]
    33ac:	49 83 c6 04          	add    r14,0x4
    33b0:	48 c1 e1 02          	shl    rcx,0x2
    33b4:	8b 94 0a 00 00 00 00 	mov    edx,DWORD PTR [rdx+rcx*1+0x0]
    33bb:	0b 94 0e 00 00 00 00 	or     edx,DWORD PTR [rsi+rcx*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:249
	        		A[indx].i = B[indx].i & C[indx].i;
	      		}
				break;
			case GPUOP_OR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    33c2:	4d 39 f3             	cmp    r11,r14
/home/simon/prog/C/EMULATOR/GPU.c:251
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i | C[indx].i;
    33c5:	89 94 08 00 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],edx
/home/simon/prog/C/EMULATOR/GPU.c:249
	        		A[indx].i = B[indx].i & C[indx].i;
	      		}
				break;
			case GPUOP_OR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    33cc:	0f 84 9e fa ff ff    	je     2e70 <gpu_run+0x2a20>
    33d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:251 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i | C[indx].i;
    33d8:	49 63 06             	movsxd rax,DWORD PTR [r14]
    33db:	4d 63 4e 04          	movsxd r9,DWORD PTR [r14+0x4]
    33df:	49 83 c6 20          	add    r14,0x20
    33e3:	4d 63 56 e8          	movsxd r10,DWORD PTR [r14-0x18]
    33e7:	49 63 7e ec          	movsxd rdi,DWORD PTR [r14-0x14]
    33eb:	8b 74 85 00          	mov    esi,DWORD PTR [rbp+rax*4+0x0]
    33ef:	41 0b 34 84          	or     esi,DWORD PTR [r12+rax*4]
    33f3:	89 34 83             	mov    DWORD PTR [rbx+rax*4],esi
    33f6:	46 8b 44 8d 00       	mov    r8d,DWORD PTR [rbp+r9*4+0x0]
    33fb:	47 0b 04 8c          	or     r8d,DWORD PTR [r12+r9*4]
    33ff:	49 63 46 f0          	movsxd rax,DWORD PTR [r14-0x10]
    3403:	49 63 76 f4          	movsxd rsi,DWORD PTR [r14-0xc]
    3407:	46 89 04 8b          	mov    DWORD PTR [rbx+r9*4],r8d
    340b:	46 8b 7c 95 00       	mov    r15d,DWORD PTR [rbp+r10*4+0x0]
    3410:	47 0b 3c 94          	or     r15d,DWORD PTR [r12+r10*4]
    3414:	4d 63 46 f8          	movsxd r8,DWORD PTR [r14-0x8]
    3418:	46 89 3c 93          	mov    DWORD PTR [rbx+r10*4],r15d
    341c:	8b 4c bd 00          	mov    ecx,DWORD PTR [rbp+rdi*4+0x0]
    3420:	41 0b 0c bc          	or     ecx,DWORD PTR [r12+rdi*4]
    3424:	4d 63 7e fc          	movsxd r15,DWORD PTR [r14-0x4]
    3428:	89 0c bb             	mov    DWORD PTR [rbx+rdi*4],ecx
    342b:	8b 54 85 00          	mov    edx,DWORD PTR [rbp+rax*4+0x0]
    342f:	41 0b 14 84          	or     edx,DWORD PTR [r12+rax*4]
    3433:	89 14 83             	mov    DWORD PTR [rbx+rax*4],edx
    3436:	44 8b 4c b5 00       	mov    r9d,DWORD PTR [rbp+rsi*4+0x0]
    343b:	45 0b 0c b4          	or     r9d,DWORD PTR [r12+rsi*4]
    343f:	44 89 0c b3          	mov    DWORD PTR [rbx+rsi*4],r9d
    3443:	46 8b 54 85 00       	mov    r10d,DWORD PTR [rbp+r8*4+0x0]
    3448:	47 0b 14 84          	or     r10d,DWORD PTR [r12+r8*4]
    344c:	46 89 14 83          	mov    DWORD PTR [rbx+r8*4],r10d
    3450:	42 8b 7c bd 00       	mov    edi,DWORD PTR [rbp+r15*4+0x0]
    3455:	43 0b 3c bc          	or     edi,DWORD PTR [r12+r15*4]
/home/simon/prog/C/EMULATOR/GPU.c:249 (discriminator 3)
	        		A[indx].i = B[indx].i & C[indx].i;
	      		}
				break;
			case GPUOP_OR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3459:	4d 39 f3             	cmp    r11,r14
/home/simon/prog/C/EMULATOR/GPU.c:251 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i | C[indx].i;
    345c:	42 89 3c bb          	mov    DWORD PTR [rbx+r15*4],edi
/home/simon/prog/C/EMULATOR/GPU.c:249 (discriminator 3)
	        		A[indx].i = B[indx].i & C[indx].i;
	      		}
				break;
			case GPUOP_OR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3460:	0f 85 72 ff ff ff    	jne    33d8 <gpu_run+0x2f88>
    3466:	e9 05 fa ff ff       	jmp    2e70 <gpu_run+0x2a20>
    346b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:242
	        		A[indx].i = B[indx].i >> C[indx].i;
	      		}
				break;
			case GPUOP_AND:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3470:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # 3477 <gpu_run+0x3027>
/home/simon/prog/C/EMULATOR/GPU.c:241
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i >> C[indx].i;
	      		}
				break;
			case GPUOP_AND:
				cycles += 1;
    3477:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:242
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    347d:	45 85 db             	test   r11d,r11d
    3480:	0f 8e ea f9 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:244 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i & C[indx].i;
    3486:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 348d <gpu_run+0x303d>
    348d:	45 8d 73 ff          	lea    r14d,[r11-0x1]
    3491:	bf 00 00 00 00       	mov    edi,0x0
    3496:	4e 8d 04 b5 00 00 00 	lea    r8,[r14*4+0x0]
    349d:	00 
    349e:	41 83 e6 07          	and    r14d,0x7
    34a2:	48 c1 e1 02          	shl    rcx,0x2
    34a6:	44 8b 8c 11 00 00 00 	mov    r9d,DWORD PTR [rcx+rdx*1+0x0]
    34ad:	00 
    34ae:	44 23 8c 31 00 00 00 	and    r9d,DWORD PTR [rcx+rsi*1+0x0]
    34b5:	00 
/home/simon/prog/C/EMULATOR/GPU.c:242 (discriminator 3)
	        		A[indx].i = B[indx].i >> C[indx].i;
	      		}
				break;
			case GPUOP_AND:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    34b6:	49 39 f8             	cmp    r8,rdi
/home/simon/prog/C/EMULATOR/GPU.c:244 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i & C[indx].i;
    34b9:	44 89 8c 01 00 00 00 	mov    DWORD PTR [rcx+rax*1+0x0],r9d
    34c0:	00 
/home/simon/prog/C/EMULATOR/GPU.c:242 (discriminator 3)
	        		A[indx].i = B[indx].i >> C[indx].i;
	      		}
				break;
			case GPUOP_AND:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    34c1:	0f 84 a9 f9 ff ff    	je     2e70 <gpu_run+0x2a20>
    34c7:	4d 85 f6             	test   r14,r14
    34ca:	0f 84 38 01 00 00    	je     3608 <gpu_run+0x31b8>
    34d0:	49 83 fe 01          	cmp    r14,0x1
    34d4:	0f 84 fd 00 00 00    	je     35d7 <gpu_run+0x3187>
    34da:	49 83 fe 02          	cmp    r14,0x2
    34de:	0f 84 d0 00 00 00    	je     35b4 <gpu_run+0x3164>
    34e4:	49 83 fe 03          	cmp    r14,0x3
    34e8:	0f 84 a3 00 00 00    	je     3591 <gpu_run+0x3141>
    34ee:	49 83 fe 04          	cmp    r14,0x4
    34f2:	74 7a                	je     356e <gpu_run+0x311e>
    34f4:	49 83 fe 05          	cmp    r14,0x5
    34f8:	74 51                	je     354b <gpu_run+0x30fb>
    34fa:	49 83 fe 06          	cmp    r14,0x6
    34fe:	74 28                	je     3528 <gpu_run+0x30d8>
/home/simon/prog/C/EMULATOR/GPU.c:244
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i & C[indx].i;
    3500:	4c 63 15 00 00 00 00 	movsxd r10,DWORD PTR [rip+0x0]        # 3507 <gpu_run+0x30b7>
    3507:	bf 00 00 00 00       	mov    edi,0x0
    350c:	49 c1 e2 02          	shl    r10,0x2
    3510:	46 8b bc 12 00 00 00 	mov    r15d,DWORD PTR [rdx+r10*1+0x0]
    3517:	00 
    3518:	46 23 bc 16 00 00 00 	and    r15d,DWORD PTR [rsi+r10*1+0x0]
    351f:	00 
    3520:	46 89 bc 10 00 00 00 	mov    DWORD PTR [rax+r10*1+0x0],r15d
    3527:	00 
    3528:	4c 63 1f             	movsxd r11,DWORD PTR [rdi]
    352b:	48 83 c7 04          	add    rdi,0x4
    352f:	49 c1 e3 02          	shl    r11,0x2
    3533:	46 8b b4 1a 00 00 00 	mov    r14d,DWORD PTR [rdx+r11*1+0x0]
    353a:	00 
    353b:	46 23 b4 1e 00 00 00 	and    r14d,DWORD PTR [rsi+r11*1+0x0]
    3542:	00 
    3543:	46 89 b4 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],r14d
    354a:	00 
    354b:	48 63 0f             	movsxd rcx,DWORD PTR [rdi]
    354e:	48 83 c7 04          	add    rdi,0x4
    3552:	48 c1 e1 02          	shl    rcx,0x2
    3556:	44 8b 8c 0a 00 00 00 	mov    r9d,DWORD PTR [rdx+rcx*1+0x0]
    355d:	00 
    355e:	44 23 8c 0e 00 00 00 	and    r9d,DWORD PTR [rsi+rcx*1+0x0]
    3565:	00 
    3566:	44 89 8c 08 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],r9d
    356d:	00 
    356e:	4c 63 3f             	movsxd r15,DWORD PTR [rdi]
    3571:	48 83 c7 04          	add    rdi,0x4
    3575:	49 c1 e7 02          	shl    r15,0x2
    3579:	46 8b 94 3a 00 00 00 	mov    r10d,DWORD PTR [rdx+r15*1+0x0]
    3580:	00 
    3581:	46 23 94 3e 00 00 00 	and    r10d,DWORD PTR [rsi+r15*1+0x0]
    3588:	00 
    3589:	46 89 94 38 00 00 00 	mov    DWORD PTR [rax+r15*1+0x0],r10d
    3590:	00 
    3591:	4c 63 1f             	movsxd r11,DWORD PTR [rdi]
    3594:	48 83 c7 04          	add    rdi,0x4
    3598:	49 c1 e3 02          	shl    r11,0x2
    359c:	46 8b b4 1a 00 00 00 	mov    r14d,DWORD PTR [rdx+r11*1+0x0]
    35a3:	00 
    35a4:	46 23 b4 1e 00 00 00 	and    r14d,DWORD PTR [rsi+r11*1+0x0]
    35ab:	00 
    35ac:	46 89 b4 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],r14d
    35b3:	00 
    35b4:	48 63 0f             	movsxd rcx,DWORD PTR [rdi]
    35b7:	48 83 c7 04          	add    rdi,0x4
    35bb:	48 c1 e1 02          	shl    rcx,0x2
    35bf:	44 8b 8c 0a 00 00 00 	mov    r9d,DWORD PTR [rdx+rcx*1+0x0]
    35c6:	00 
    35c7:	44 23 8c 0e 00 00 00 	and    r9d,DWORD PTR [rsi+rcx*1+0x0]
    35ce:	00 
    35cf:	44 89 8c 08 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],r9d
    35d6:	00 
    35d7:	4c 63 3f             	movsxd r15,DWORD PTR [rdi]
    35da:	48 83 c7 04          	add    rdi,0x4
    35de:	49 c1 e7 02          	shl    r15,0x2
    35e2:	42 8b 94 3a 00 00 00 	mov    edx,DWORD PTR [rdx+r15*1+0x0]
    35e9:	00 
    35ea:	42 23 94 3e 00 00 00 	and    edx,DWORD PTR [rsi+r15*1+0x0]
    35f1:	00 
/home/simon/prog/C/EMULATOR/GPU.c:242
	        		A[indx].i = B[indx].i >> C[indx].i;
	      		}
				break;
			case GPUOP_AND:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    35f2:	49 39 f8             	cmp    r8,rdi
/home/simon/prog/C/EMULATOR/GPU.c:244
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i & C[indx].i;
    35f5:	42 89 94 38 00 00 00 	mov    DWORD PTR [rax+r15*1+0x0],edx
    35fc:	00 
/home/simon/prog/C/EMULATOR/GPU.c:242
	        		A[indx].i = B[indx].i >> C[indx].i;
	      		}
				break;
			case GPUOP_AND:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    35fd:	0f 84 6d f8 ff ff    	je     2e70 <gpu_run+0x2a20>
    3603:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:244 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i & C[indx].i;
    3608:	48 63 07             	movsxd rax,DWORD PTR [rdi]
    360b:	4c 63 57 04          	movsxd r10,DWORD PTR [rdi+0x4]
    360f:	48 83 c7 20          	add    rdi,0x20
    3613:	4c 63 77 e8          	movsxd r14,DWORD PTR [rdi-0x18]
    3617:	4c 63 4f ec          	movsxd r9,DWORD PTR [rdi-0x14]
    361b:	8b 74 85 00          	mov    esi,DWORD PTR [rbp+rax*4+0x0]
    361f:	41 23 34 84          	and    esi,DWORD PTR [r12+rax*4]
    3623:	89 34 83             	mov    DWORD PTR [rbx+rax*4],esi
    3626:	46 8b 5c 95 00       	mov    r11d,DWORD PTR [rbp+r10*4+0x0]
    362b:	47 23 1c 94          	and    r11d,DWORD PTR [r12+r10*4]
    362f:	48 63 47 f0          	movsxd rax,DWORD PTR [rdi-0x10]
    3633:	48 63 77 f4          	movsxd rsi,DWORD PTR [rdi-0xc]
    3637:	46 89 1c 93          	mov    DWORD PTR [rbx+r10*4],r11d
    363b:	42 8b 4c b5 00       	mov    ecx,DWORD PTR [rbp+r14*4+0x0]
    3640:	43 23 0c b4          	and    ecx,DWORD PTR [r12+r14*4]
    3644:	4c 63 5f f8          	movsxd r11,DWORD PTR [rdi-0x8]
    3648:	42 89 0c b3          	mov    DWORD PTR [rbx+r14*4],ecx
    364c:	46 8b 7c 8d 00       	mov    r15d,DWORD PTR [rbp+r9*4+0x0]
    3651:	47 23 3c 8c          	and    r15d,DWORD PTR [r12+r9*4]
    3655:	48 63 4f fc          	movsxd rcx,DWORD PTR [rdi-0x4]
    3659:	46 89 3c 8b          	mov    DWORD PTR [rbx+r9*4],r15d
    365d:	8b 54 85 00          	mov    edx,DWORD PTR [rbp+rax*4+0x0]
    3661:	41 23 14 84          	and    edx,DWORD PTR [r12+rax*4]
    3665:	89 14 83             	mov    DWORD PTR [rbx+rax*4],edx
    3668:	44 8b 54 b5 00       	mov    r10d,DWORD PTR [rbp+rsi*4+0x0]
    366d:	45 23 14 b4          	and    r10d,DWORD PTR [r12+rsi*4]
    3671:	44 89 14 b3          	mov    DWORD PTR [rbx+rsi*4],r10d
    3675:	46 8b 74 9d 00       	mov    r14d,DWORD PTR [rbp+r11*4+0x0]
    367a:	47 23 34 9c          	and    r14d,DWORD PTR [r12+r11*4]
    367e:	46 89 34 9b          	mov    DWORD PTR [rbx+r11*4],r14d
    3682:	44 8b 4c 8d 00       	mov    r9d,DWORD PTR [rbp+rcx*4+0x0]
    3687:	45 23 0c 8c          	and    r9d,DWORD PTR [r12+rcx*4]
/home/simon/prog/C/EMULATOR/GPU.c:242 (discriminator 3)
	        		A[indx].i = B[indx].i >> C[indx].i;
	      		}
				break;
			case GPUOP_AND:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    368b:	49 39 f8             	cmp    r8,rdi
/home/simon/prog/C/EMULATOR/GPU.c:244 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i & C[indx].i;
    368e:	44 89 0c 8b          	mov    DWORD PTR [rbx+rcx*4],r9d
/home/simon/prog/C/EMULATOR/GPU.c:242 (discriminator 3)
	        		A[indx].i = B[indx].i >> C[indx].i;
	      		}
				break;
			case GPUOP_AND:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3692:	0f 85 70 ff ff ff    	jne    3608 <gpu_run+0x31b8>
    3698:	e9 d3 f7 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    369d:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:235
	        		A[indx].i = B[indx].i << C[indx].i;
	      		}
				break;
			case GPUOP_SR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    36a0:	44 8b 05 00 00 00 00 	mov    r8d,DWORD PTR [rip+0x0]        # 36a7 <gpu_run+0x3257>
/home/simon/prog/C/EMULATOR/GPU.c:234
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i << C[indx].i;
	      		}
				break;
			case GPUOP_SR:
				cycles += 1;
    36a7:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:235
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    36ad:	45 85 c0             	test   r8d,r8d
    36b0:	0f 8e ba f7 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:237 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i >> C[indx].i;
    36b6:	48 63 3d 00 00 00 00 	movsxd rdi,DWORD PTR [rip+0x0]        # 36bd <gpu_run+0x326d>
    36bd:	45 8d 50 ff          	lea    r10d,[r8-0x1]
    36c1:	4e 8d 1c 95 00 00 00 	lea    r11,[r10*4+0x0]
    36c8:	00 
    36c9:	41 83 e2 07          	and    r10d,0x7
    36cd:	48 c1 e7 02          	shl    rdi,0x2
    36d1:	8b 8c 37 00 00 00 00 	mov    ecx,DWORD PTR [rdi+rsi*1+0x0]
    36d8:	44 8b bc 17 00 00 00 	mov    r15d,DWORD PTR [rdi+rdx*1+0x0]
    36df:	00 
    36e0:	41 d3 ef             	shr    r15d,cl
    36e3:	44 89 bc 07 00 00 00 	mov    DWORD PTR [rdi+rax*1+0x0],r15d
    36ea:	00 
    36eb:	bf 00 00 00 00       	mov    edi,0x0
/home/simon/prog/C/EMULATOR/GPU.c:235 (discriminator 3)
	        		A[indx].i = B[indx].i << C[indx].i;
	      		}
				break;
			case GPUOP_SR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    36f0:	49 39 fb             	cmp    r11,rdi
    36f3:	0f 84 77 f7 ff ff    	je     2e70 <gpu_run+0x2a20>
    36f9:	4d 85 d2             	test   r10,r10
    36fc:	0f 84 4e 01 00 00    	je     3850 <gpu_run+0x3400>
    3702:	49 83 fa 01          	cmp    r10,0x1
    3706:	0f 84 13 01 00 00    	je     381f <gpu_run+0x33cf>
    370c:	49 83 fa 02          	cmp    r10,0x2
    3710:	0f 84 e3 00 00 00    	je     37f9 <gpu_run+0x33a9>
    3716:	49 83 fa 03          	cmp    r10,0x3
    371a:	0f 84 b3 00 00 00    	je     37d3 <gpu_run+0x3383>
    3720:	49 83 fa 04          	cmp    r10,0x4
    3724:	0f 84 83 00 00 00    	je     37ad <gpu_run+0x335d>
    372a:	49 83 fa 05          	cmp    r10,0x5
    372e:	74 57                	je     3787 <gpu_run+0x3337>
    3730:	49 83 fa 06          	cmp    r10,0x6
    3734:	74 2b                	je     3761 <gpu_run+0x3311>
/home/simon/prog/C/EMULATOR/GPU.c:237
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i >> C[indx].i;
    3736:	4c 63 0d 00 00 00 00 	movsxd r9,DWORD PTR [rip+0x0]        # 373d <gpu_run+0x32ed>
    373d:	bf 00 00 00 00       	mov    edi,0x0
    3742:	49 c1 e1 02          	shl    r9,0x2
    3746:	42 8b 8c 0e 00 00 00 	mov    ecx,DWORD PTR [rsi+r9*1+0x0]
    374d:	00 
    374e:	46 8b 84 0a 00 00 00 	mov    r8d,DWORD PTR [rdx+r9*1+0x0]
    3755:	00 
    3756:	41 d3 e8             	shr    r8d,cl
    3759:	46 89 84 08 00 00 00 	mov    DWORD PTR [rax+r9*1+0x0],r8d
    3760:	00 
    3761:	4c 63 37             	movsxd r14,DWORD PTR [rdi]
    3764:	48 83 c7 04          	add    rdi,0x4
    3768:	49 c1 e6 02          	shl    r14,0x2
    376c:	42 8b 8c 36 00 00 00 	mov    ecx,DWORD PTR [rsi+r14*1+0x0]
    3773:	00 
    3774:	46 8b bc 32 00 00 00 	mov    r15d,DWORD PTR [rdx+r14*1+0x0]
    377b:	00 
    377c:	41 d3 ef             	shr    r15d,cl
    377f:	46 89 bc 30 00 00 00 	mov    DWORD PTR [rax+r14*1+0x0],r15d
    3786:	00 
    3787:	4c 63 07             	movsxd r8,DWORD PTR [rdi]
    378a:	48 83 c7 04          	add    rdi,0x4
    378e:	49 c1 e0 02          	shl    r8,0x2
    3792:	42 8b 8c 06 00 00 00 	mov    ecx,DWORD PTR [rsi+r8*1+0x0]
    3799:	00 
    379a:	46 8b 94 02 00 00 00 	mov    r10d,DWORD PTR [rdx+r8*1+0x0]
    37a1:	00 
    37a2:	41 d3 ea             	shr    r10d,cl
    37a5:	46 89 94 00 00 00 00 	mov    DWORD PTR [rax+r8*1+0x0],r10d
    37ac:	00 
    37ad:	4c 63 0f             	movsxd r9,DWORD PTR [rdi]
    37b0:	48 83 c7 04          	add    rdi,0x4
    37b4:	49 c1 e1 02          	shl    r9,0x2
    37b8:	42 8b 8c 0e 00 00 00 	mov    ecx,DWORD PTR [rsi+r9*1+0x0]
    37bf:	00 
    37c0:	46 8b bc 0a 00 00 00 	mov    r15d,DWORD PTR [rdx+r9*1+0x0]
    37c7:	00 
    37c8:	41 d3 ef             	shr    r15d,cl
    37cb:	46 89 bc 08 00 00 00 	mov    DWORD PTR [rax+r9*1+0x0],r15d
    37d2:	00 
    37d3:	4c 63 17             	movsxd r10,DWORD PTR [rdi]
    37d6:	48 83 c7 04          	add    rdi,0x4
    37da:	49 c1 e2 02          	shl    r10,0x2
    37de:	42 8b 8c 16 00 00 00 	mov    ecx,DWORD PTR [rsi+r10*1+0x0]
    37e5:	00 
    37e6:	46 8b b4 12 00 00 00 	mov    r14d,DWORD PTR [rdx+r10*1+0x0]
    37ed:	00 
    37ee:	41 d3 ee             	shr    r14d,cl
    37f1:	46 89 b4 10 00 00 00 	mov    DWORD PTR [rax+r10*1+0x0],r14d
    37f8:	00 
    37f9:	4c 63 07             	movsxd r8,DWORD PTR [rdi]
    37fc:	48 83 c7 04          	add    rdi,0x4
    3800:	49 c1 e0 02          	shl    r8,0x2
    3804:	42 8b 8c 06 00 00 00 	mov    ecx,DWORD PTR [rsi+r8*1+0x0]
    380b:	00 
    380c:	46 8b bc 02 00 00 00 	mov    r15d,DWORD PTR [rdx+r8*1+0x0]
    3813:	00 
    3814:	41 d3 ef             	shr    r15d,cl
    3817:	46 89 bc 00 00 00 00 	mov    DWORD PTR [rax+r8*1+0x0],r15d
    381e:	00 
    381f:	4c 63 37             	movsxd r14,DWORD PTR [rdi]
    3822:	48 83 c7 04          	add    rdi,0x4
    3826:	49 c1 e6 02          	shl    r14,0x2
    382a:	42 8b 8c 36 00 00 00 	mov    ecx,DWORD PTR [rsi+r14*1+0x0]
    3831:	00 
    3832:	42 8b 94 32 00 00 00 	mov    edx,DWORD PTR [rdx+r14*1+0x0]
    3839:	00 
    383a:	d3 ea                	shr    edx,cl
/home/simon/prog/C/EMULATOR/GPU.c:235
	        		A[indx].i = B[indx].i << C[indx].i;
	      		}
				break;
			case GPUOP_SR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    383c:	49 39 fb             	cmp    r11,rdi
/home/simon/prog/C/EMULATOR/GPU.c:237
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i >> C[indx].i;
    383f:	42 89 94 30 00 00 00 	mov    DWORD PTR [rax+r14*1+0x0],edx
    3846:	00 
/home/simon/prog/C/EMULATOR/GPU.c:235
	        		A[indx].i = B[indx].i << C[indx].i;
	      		}
				break;
			case GPUOP_SR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3847:	0f 84 23 f6 ff ff    	je     2e70 <gpu_run+0x2a20>
    384d:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:237 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i >> C[indx].i;
    3850:	48 63 07             	movsxd rax,DWORD PTR [rdi]
    3853:	4c 63 4f 04          	movsxd r9,DWORD PTR [rdi+0x4]
    3857:	48 83 c7 20          	add    rdi,0x20
    385b:	4c 63 7f e8          	movsxd r15,DWORD PTR [rdi-0x18]
    385f:	4c 63 77 ec          	movsxd r14,DWORD PTR [rdi-0x14]
    3863:	41 8b 0c 84          	mov    ecx,DWORD PTR [r12+rax*4]
    3867:	8b 74 85 00          	mov    esi,DWORD PTR [rbp+rax*4+0x0]
    386b:	d3 ee                	shr    esi,cl
    386d:	89 34 83             	mov    DWORD PTR [rbx+rax*4],esi
    3870:	43 8b 0c 8c          	mov    ecx,DWORD PTR [r12+r9*4]
    3874:	46 8b 44 8d 00       	mov    r8d,DWORD PTR [rbp+r9*4+0x0]
    3879:	48 63 47 f0          	movsxd rax,DWORD PTR [rdi-0x10]
    387d:	41 d3 e8             	shr    r8d,cl
    3880:	46 89 04 8b          	mov    DWORD PTR [rbx+r9*4],r8d
    3884:	43 8b 0c bc          	mov    ecx,DWORD PTR [r12+r15*4]
    3888:	46 8b 54 bd 00       	mov    r10d,DWORD PTR [rbp+r15*4+0x0]
    388d:	4c 63 4f f4          	movsxd r9,DWORD PTR [rdi-0xc]
    3891:	41 d3 ea             	shr    r10d,cl
    3894:	46 89 14 bb          	mov    DWORD PTR [rbx+r15*4],r10d
    3898:	43 8b 0c b4          	mov    ecx,DWORD PTR [r12+r14*4]
    389c:	42 8b 54 b5 00       	mov    edx,DWORD PTR [rbp+r14*4+0x0]
    38a1:	4c 63 7f f8          	movsxd r15,DWORD PTR [rdi-0x8]
    38a5:	d3 ea                	shr    edx,cl
    38a7:	42 89 14 b3          	mov    DWORD PTR [rbx+r14*4],edx
    38ab:	41 8b 0c 84          	mov    ecx,DWORD PTR [r12+rax*4]
    38af:	8b 74 85 00          	mov    esi,DWORD PTR [rbp+rax*4+0x0]
    38b3:	4c 63 77 fc          	movsxd r14,DWORD PTR [rdi-0x4]
    38b7:	d3 ee                	shr    esi,cl
    38b9:	89 34 83             	mov    DWORD PTR [rbx+rax*4],esi
    38bc:	43 8b 0c 8c          	mov    ecx,DWORD PTR [r12+r9*4]
    38c0:	46 8b 44 8d 00       	mov    r8d,DWORD PTR [rbp+r9*4+0x0]
    38c5:	41 d3 e8             	shr    r8d,cl
    38c8:	46 89 04 8b          	mov    DWORD PTR [rbx+r9*4],r8d
    38cc:	43 8b 0c bc          	mov    ecx,DWORD PTR [r12+r15*4]
    38d0:	46 8b 54 bd 00       	mov    r10d,DWORD PTR [rbp+r15*4+0x0]
    38d5:	41 d3 ea             	shr    r10d,cl
    38d8:	46 89 14 bb          	mov    DWORD PTR [rbx+r15*4],r10d
    38dc:	43 8b 0c b4          	mov    ecx,DWORD PTR [r12+r14*4]
    38e0:	42 8b 54 b5 00       	mov    edx,DWORD PTR [rbp+r14*4+0x0]
    38e5:	d3 ea                	shr    edx,cl
/home/simon/prog/C/EMULATOR/GPU.c:235 (discriminator 3)
	        		A[indx].i = B[indx].i << C[indx].i;
	      		}
				break;
			case GPUOP_SR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    38e7:	49 39 fb             	cmp    r11,rdi
/home/simon/prog/C/EMULATOR/GPU.c:237 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i >> C[indx].i;
    38ea:	42 89 14 b3          	mov    DWORD PTR [rbx+r14*4],edx
/home/simon/prog/C/EMULATOR/GPU.c:235 (discriminator 3)
	        		A[indx].i = B[indx].i << C[indx].i;
	      		}
				break;
			case GPUOP_SR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    38ee:	0f 85 5c ff ff ff    	jne    3850 <gpu_run+0x3400>
    38f4:	e9 77 f5 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    38f9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:228
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
	      		}
				break;
			case GPUOP_SL:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3900:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # 3907 <gpu_run+0x34b7>
/home/simon/prog/C/EMULATOR/GPU.c:227
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
	      		}
				break;
			case GPUOP_SL:
				cycles += 1;
    3907:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:228
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    390d:	45 85 db             	test   r11d,r11d
    3910:	0f 8e 5a f5 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:230 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i << C[indx].i;
    3916:	48 63 3d 00 00 00 00 	movsxd rdi,DWORD PTR [rip+0x0]        # 391d <gpu_run+0x34cd>
    391d:	45 8d 43 ff          	lea    r8d,[r11-0x1]
    3921:	4e 8d 0c 85 00 00 00 	lea    r9,[r8*4+0x0]
    3928:	00 
    3929:	41 83 e0 07          	and    r8d,0x7
    392d:	48 c1 e7 02          	shl    rdi,0x2
    3931:	8b 8c 37 00 00 00 00 	mov    ecx,DWORD PTR [rdi+rsi*1+0x0]
    3938:	44 8b bc 17 00 00 00 	mov    r15d,DWORD PTR [rdi+rdx*1+0x0]
    393f:	00 
    3940:	41 d3 e7             	shl    r15d,cl
    3943:	44 89 bc 07 00 00 00 	mov    DWORD PTR [rdi+rax*1+0x0],r15d
    394a:	00 
    394b:	bf 00 00 00 00       	mov    edi,0x0
/home/simon/prog/C/EMULATOR/GPU.c:228 (discriminator 3)
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
	      		}
				break;
			case GPUOP_SL:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3950:	49 39 f9             	cmp    r9,rdi
    3953:	0f 84 17 f5 ff ff    	je     2e70 <gpu_run+0x2a20>
    3959:	4d 85 c0             	test   r8,r8
    395c:	0f 84 4e 01 00 00    	je     3ab0 <gpu_run+0x3660>
    3962:	49 83 f8 01          	cmp    r8,0x1
    3966:	0f 84 13 01 00 00    	je     3a7f <gpu_run+0x362f>
    396c:	49 83 f8 02          	cmp    r8,0x2
    3970:	0f 84 e3 00 00 00    	je     3a59 <gpu_run+0x3609>
    3976:	49 83 f8 03          	cmp    r8,0x3
    397a:	0f 84 b3 00 00 00    	je     3a33 <gpu_run+0x35e3>
    3980:	49 83 f8 04          	cmp    r8,0x4
    3984:	0f 84 83 00 00 00    	je     3a0d <gpu_run+0x35bd>
    398a:	49 83 f8 05          	cmp    r8,0x5
    398e:	74 57                	je     39e7 <gpu_run+0x3597>
    3990:	49 83 f8 06          	cmp    r8,0x6
    3994:	74 2b                	je     39c1 <gpu_run+0x3571>
/home/simon/prog/C/EMULATOR/GPU.c:230
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i << C[indx].i;
    3996:	4c 63 35 00 00 00 00 	movsxd r14,DWORD PTR [rip+0x0]        # 399d <gpu_run+0x354d>
    399d:	bf 00 00 00 00       	mov    edi,0x0
    39a2:	49 c1 e6 02          	shl    r14,0x2
    39a6:	42 8b 8c 36 00 00 00 	mov    ecx,DWORD PTR [rsi+r14*1+0x0]
    39ad:	00 
    39ae:	46 8b 9c 32 00 00 00 	mov    r11d,DWORD PTR [rdx+r14*1+0x0]
    39b5:	00 
    39b6:	41 d3 e3             	shl    r11d,cl
    39b9:	46 89 9c 30 00 00 00 	mov    DWORD PTR [rax+r14*1+0x0],r11d
    39c0:	00 
    39c1:	4c 63 17             	movsxd r10,DWORD PTR [rdi]
    39c4:	48 83 c7 04          	add    rdi,0x4
    39c8:	49 c1 e2 02          	shl    r10,0x2
    39cc:	42 8b 8c 16 00 00 00 	mov    ecx,DWORD PTR [rsi+r10*1+0x0]
    39d3:	00 
    39d4:	46 8b bc 12 00 00 00 	mov    r15d,DWORD PTR [rdx+r10*1+0x0]
    39db:	00 
    39dc:	41 d3 e7             	shl    r15d,cl
    39df:	46 89 bc 10 00 00 00 	mov    DWORD PTR [rax+r10*1+0x0],r15d
    39e6:	00 
    39e7:	4c 63 1f             	movsxd r11,DWORD PTR [rdi]
    39ea:	48 83 c7 04          	add    rdi,0x4
    39ee:	49 c1 e3 02          	shl    r11,0x2
    39f2:	42 8b 8c 1e 00 00 00 	mov    ecx,DWORD PTR [rsi+r11*1+0x0]
    39f9:	00 
    39fa:	46 8b 84 1a 00 00 00 	mov    r8d,DWORD PTR [rdx+r11*1+0x0]
    3a01:	00 
    3a02:	41 d3 e0             	shl    r8d,cl
    3a05:	46 89 84 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],r8d
    3a0c:	00 
    3a0d:	4c 63 37             	movsxd r14,DWORD PTR [rdi]
    3a10:	48 83 c7 04          	add    rdi,0x4
    3a14:	49 c1 e6 02          	shl    r14,0x2
    3a18:	42 8b 8c 36 00 00 00 	mov    ecx,DWORD PTR [rsi+r14*1+0x0]
    3a1f:	00 
    3a20:	46 8b bc 32 00 00 00 	mov    r15d,DWORD PTR [rdx+r14*1+0x0]
    3a27:	00 
    3a28:	41 d3 e7             	shl    r15d,cl
    3a2b:	46 89 bc 30 00 00 00 	mov    DWORD PTR [rax+r14*1+0x0],r15d
    3a32:	00 
    3a33:	4c 63 07             	movsxd r8,DWORD PTR [rdi]
    3a36:	48 83 c7 04          	add    rdi,0x4
    3a3a:	49 c1 e0 02          	shl    r8,0x2
    3a3e:	42 8b 8c 06 00 00 00 	mov    ecx,DWORD PTR [rsi+r8*1+0x0]
    3a45:	00 
    3a46:	46 8b 94 02 00 00 00 	mov    r10d,DWORD PTR [rdx+r8*1+0x0]
    3a4d:	00 
    3a4e:	41 d3 e2             	shl    r10d,cl
    3a51:	46 89 94 00 00 00 00 	mov    DWORD PTR [rax+r8*1+0x0],r10d
    3a58:	00 
    3a59:	4c 63 1f             	movsxd r11,DWORD PTR [rdi]
    3a5c:	48 83 c7 04          	add    rdi,0x4
    3a60:	49 c1 e3 02          	shl    r11,0x2
    3a64:	42 8b 8c 1e 00 00 00 	mov    ecx,DWORD PTR [rsi+r11*1+0x0]
    3a6b:	00 
    3a6c:	46 8b bc 1a 00 00 00 	mov    r15d,DWORD PTR [rdx+r11*1+0x0]
    3a73:	00 
    3a74:	41 d3 e7             	shl    r15d,cl
    3a77:	46 89 bc 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],r15d
    3a7e:	00 
    3a7f:	4c 63 17             	movsxd r10,DWORD PTR [rdi]
    3a82:	48 83 c7 04          	add    rdi,0x4
    3a86:	49 c1 e2 02          	shl    r10,0x2
    3a8a:	42 8b 8c 16 00 00 00 	mov    ecx,DWORD PTR [rsi+r10*1+0x0]
    3a91:	00 
    3a92:	42 8b b4 12 00 00 00 	mov    esi,DWORD PTR [rdx+r10*1+0x0]
    3a99:	00 
    3a9a:	d3 e6                	shl    esi,cl
/home/simon/prog/C/EMULATOR/GPU.c:228
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
	      		}
				break;
			case GPUOP_SL:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3a9c:	49 39 f9             	cmp    r9,rdi
/home/simon/prog/C/EMULATOR/GPU.c:230
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i << C[indx].i;
    3a9f:	42 89 b4 10 00 00 00 	mov    DWORD PTR [rax+r10*1+0x0],esi
    3aa6:	00 
/home/simon/prog/C/EMULATOR/GPU.c:228
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
	      		}
				break;
			case GPUOP_SL:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3aa7:	0f 84 c3 f3 ff ff    	je     2e70 <gpu_run+0x2a20>
    3aad:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:230 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i << C[indx].i;
    3ab0:	48 63 07             	movsxd rax,DWORD PTR [rdi]
    3ab3:	4c 63 77 04          	movsxd r14,DWORD PTR [rdi+0x4]
    3ab7:	48 83 c7 20          	add    rdi,0x20
    3abb:	4c 63 7f e8          	movsxd r15,DWORD PTR [rdi-0x18]
    3abf:	4c 63 57 ec          	movsxd r10,DWORD PTR [rdi-0x14]
    3ac3:	41 8b 0c 84          	mov    ecx,DWORD PTR [r12+rax*4]
    3ac7:	8b 54 85 00          	mov    edx,DWORD PTR [rbp+rax*4+0x0]
    3acb:	d3 e2                	shl    edx,cl
    3acd:	89 14 83             	mov    DWORD PTR [rbx+rax*4],edx
    3ad0:	43 8b 0c b4          	mov    ecx,DWORD PTR [r12+r14*4]
    3ad4:	46 8b 5c b5 00       	mov    r11d,DWORD PTR [rbp+r14*4+0x0]
    3ad9:	48 63 47 f0          	movsxd rax,DWORD PTR [rdi-0x10]
    3add:	41 d3 e3             	shl    r11d,cl
    3ae0:	46 89 1c b3          	mov    DWORD PTR [rbx+r14*4],r11d
    3ae4:	43 8b 0c bc          	mov    ecx,DWORD PTR [r12+r15*4]
    3ae8:	46 8b 44 bd 00       	mov    r8d,DWORD PTR [rbp+r15*4+0x0]
    3aed:	4c 63 77 f4          	movsxd r14,DWORD PTR [rdi-0xc]
    3af1:	41 d3 e0             	shl    r8d,cl
    3af4:	46 89 04 bb          	mov    DWORD PTR [rbx+r15*4],r8d
    3af8:	43 8b 0c 94          	mov    ecx,DWORD PTR [r12+r10*4]
    3afc:	42 8b 74 95 00       	mov    esi,DWORD PTR [rbp+r10*4+0x0]
    3b01:	4c 63 7f f8          	movsxd r15,DWORD PTR [rdi-0x8]
    3b05:	d3 e6                	shl    esi,cl
    3b07:	42 89 34 93          	mov    DWORD PTR [rbx+r10*4],esi
    3b0b:	41 8b 0c 84          	mov    ecx,DWORD PTR [r12+rax*4]
    3b0f:	8b 54 85 00          	mov    edx,DWORD PTR [rbp+rax*4+0x0]
    3b13:	4c 63 57 fc          	movsxd r10,DWORD PTR [rdi-0x4]
    3b17:	d3 e2                	shl    edx,cl
    3b19:	89 14 83             	mov    DWORD PTR [rbx+rax*4],edx
    3b1c:	43 8b 0c b4          	mov    ecx,DWORD PTR [r12+r14*4]
    3b20:	46 8b 5c b5 00       	mov    r11d,DWORD PTR [rbp+r14*4+0x0]
    3b25:	41 d3 e3             	shl    r11d,cl
    3b28:	46 89 1c b3          	mov    DWORD PTR [rbx+r14*4],r11d
    3b2c:	43 8b 0c bc          	mov    ecx,DWORD PTR [r12+r15*4]
    3b30:	46 8b 44 bd 00       	mov    r8d,DWORD PTR [rbp+r15*4+0x0]
    3b35:	41 d3 e0             	shl    r8d,cl
    3b38:	46 89 04 bb          	mov    DWORD PTR [rbx+r15*4],r8d
    3b3c:	43 8b 0c 94          	mov    ecx,DWORD PTR [r12+r10*4]
    3b40:	42 8b 74 95 00       	mov    esi,DWORD PTR [rbp+r10*4+0x0]
    3b45:	d3 e6                	shl    esi,cl
/home/simon/prog/C/EMULATOR/GPU.c:228 (discriminator 3)
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
	      		}
				break;
			case GPUOP_SL:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3b47:	49 39 f9             	cmp    r9,rdi
/home/simon/prog/C/EMULATOR/GPU.c:230 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i << C[indx].i;
    3b4a:	42 89 34 93          	mov    DWORD PTR [rbx+r10*4],esi
/home/simon/prog/C/EMULATOR/GPU.c:228 (discriminator 3)
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
	      		}
				break;
			case GPUOP_SL:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3b4e:	0f 85 5c ff ff ff    	jne    3ab0 <gpu_run+0x3660>
    3b54:	e9 17 f3 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    3b59:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3b60:	8b 2d 00 00 00 00    	mov    ebp,DWORD PTR [rip+0x0]        # 3b66 <gpu_run+0x3716>
/home/simon/prog/C/EMULATOR/GPU.c:447
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].f < C[indx].f ? -1 : (B[indx].f > C[indx].f ? 1 : 0);
				}
				break;
			case GPUOP_BR://branch
				cycles += 2+GPU_CORE_COUNT;
    3b66:	48 83 44 24 08 22    	add    QWORD PTR [rsp+0x8],0x22
/home/simon/prog/C/EMULATOR/GPU.c:448
				while(GPU_ACTIVE_THREADS) {
    3b6c:	4c 8b 35 00 00 00 00 	mov    r14,QWORD PTR [rip+0x0]        # 3b73 <gpu_run+0x3723>
    3b73:	85 ed                	test   ebp,ebp
    3b75:	0f 84 0e 02 00 00    	je     3d89 <gpu_run+0x3939>
    3b7b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:449
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
    3b80:	44 8d 6d ff          	lea    r13d,[rbp-0x1]
getEmptySpan():
/home/simon/prog/C/EMULATOR/GPU.c:129
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
	free(tmp);
}

execSpan* getEmptySpan(uint32_t PC) {
	execSpan *ret = (execSpan*)malloc(sizeof(execSpan));
    3b84:	bf 30 00 00 00       	mov    edi,0x30
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:449
				}
				break;
			case GPUOP_BR://branch
				cycles += 2+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
    3b89:	4d 63 cd             	movsxd r9,r13d
    3b8c:	44 89 2d 00 00 00 00 	mov    DWORD PTR [rip+0x0],r13d        # 3b93 <gpu_run+0x3743>
    3b93:	4a 63 34 8d 00 00 00 	movsxd rsi,DWORD PTR [r9*4+0x0]
    3b9a:	00 
/home/simon/prog/C/EMULATOR/GPU.c:450
					uint32_t spanPC = A[indx].i;
    3b9b:	44 8b 24 b3          	mov    r12d,DWORD PTR [rbx+rsi*4]
/home/simon/prog/C/EMULATOR/GPU.c:449
				}
				break;
			case GPUOP_BR://branch
				cycles += 2+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
    3b9f:	49 89 f7             	mov    r15,rsi
getEmptySpan():
/home/simon/prog/C/EMULATOR/GPU.c:129
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
	free(tmp);
}

execSpan* getEmptySpan(uint32_t PC) {
	execSpan *ret = (execSpan*)malloc(sizeof(execSpan));
    3ba2:	e8 00 00 00 00       	call   3ba7 <gpu_run+0x3757>
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:454
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
    3ba7:	45 85 ed             	test   r13d,r13d
getEmptySpan():
/home/simon/prog/C/EMULATOR/GPU.c:131
}

execSpan* getEmptySpan(uint32_t PC) {
	execSpan *ret = (execSpan*)malloc(sizeof(execSpan));
	ret->PC = PC;
	ret->next = 0;
    3baa:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:452
				cycles += 2+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
    3bb1:	c7 40 0c 01 00 00 00 	mov    DWORD PTR [rax+0xc],0x1
getEmptySpan():
/home/simon/prog/C/EMULATOR/GPU.c:130
	free(tmp);
}

execSpan* getEmptySpan(uint32_t PC) {
	execSpan *ret = (execSpan*)malloc(sizeof(execSpan));
	ret->PC = PC;
    3bb8:	44 89 60 08          	mov    DWORD PTR [rax+0x8],r12d
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:453
				while(GPU_ACTIVE_THREADS) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
    3bbc:	44 88 78 10          	mov    BYTE PTR [rax+0x10],r15b
/home/simon/prog/C/EMULATOR/GPU.c:454
					while(GPU_ACTIVE_THREADS) {
    3bc0:	0f 84 f9 16 00 00    	je     52bf <gpu_run+0x4e6f>
/home/simon/prog/C/EMULATOR/GPU.c:455
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3bc6:	83 ed 02             	sub    ebp,0x2
    3bc9:	48 63 fd             	movsxd rdi,ebp
    3bcc:	4c 63 1c bd 00 00 00 	movsxd r11,DWORD PTR [rdi*4+0x0]
    3bd3:	00 
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3bd4:	46 3b 24 9b          	cmp    r12d,DWORD PTR [rbx+r11*4]
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3bd8:	4d 89 d8             	mov    r8,r11
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3bdb:	0f 85 e5 16 00 00    	jne    52c6 <gpu_run+0x4e76>
    3be1:	41 89 ed             	mov    r13d,ebp
    3be4:	48 8d 48 11          	lea    rcx,[rax+0x11]
    3be8:	ba 02 00 00 00       	mov    edx,0x2
    3bed:	41 83 e5 03          	and    r13d,0x3
    3bf1:	0f 84 96 00 00 00    	je     3c8d <gpu_run+0x383d>
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3bf7:	44 8d 4d ff          	lea    r9d,[rbp-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:459
						if(A[indx].i != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    3bfb:	bf 02 00 00 00       	mov    edi,0x2
    3c00:	44 88 58 11          	mov    BYTE PTR [rax+0x11],r11b
    3c04:	ba 03 00 00 00       	mov    edx,0x3
    3c09:	48 8d 48 12          	lea    rcx,[rax+0x12]
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3c0d:	4d 63 c1             	movsxd r8,r9d
    3c10:	4e 63 14 85 00 00 00 	movsxd r10,DWORD PTR [r8*4+0x0]
    3c17:	00 
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3c18:	46 3b 24 93          	cmp    r12d,DWORD PTR [rbx+r10*4]
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3c1c:	4d 89 d0             	mov    r8,r10
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3c1f:	0f 85 03 01 00 00    	jne    3d28 <gpu_run+0x38d8>
    3c25:	41 83 fd 01          	cmp    r13d,0x1
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3c29:	44 89 cd             	mov    ebp,r9d
    3c2c:	74 5f                	je     3c8d <gpu_run+0x383d>
    3c2e:	41 83 fd 02          	cmp    r13d,0x2
    3c32:	74 30                	je     3c64 <gpu_run+0x3814>
    3c34:	41 8d 71 ff          	lea    esi,[r9-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:459
						if(A[indx].i != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    3c38:	bf 03 00 00 00       	mov    edi,0x3
    3c3d:	44 88 50 12          	mov    BYTE PTR [rax+0x12],r10b
    3c41:	48 8d 48 13          	lea    rcx,[rax+0x13]
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3c45:	48 63 d6             	movsxd rdx,esi
    3c48:	4c 63 3c 95 00 00 00 	movsxd r15,DWORD PTR [rdx*4+0x0]
    3c4f:	00 
    3c50:	ba 04 00 00 00       	mov    edx,0x4
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3c55:	46 3b 24 bb          	cmp    r12d,DWORD PTR [rbx+r15*4]
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3c59:	4d 89 f8             	mov    r8,r15
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3c5c:	0f 85 c6 00 00 00    	jne    3d28 <gpu_run+0x38d8>
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3c62:	89 f5                	mov    ebp,esi
    3c64:	8d 75 ff             	lea    esi,[rbp-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:459
						if(A[indx].i != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    3c67:	44 88 01             	mov    BYTE PTR [rcx],r8b
    3c6a:	89 d7                	mov    edi,edx
    3c6c:	48 83 c1 01          	add    rcx,0x1
    3c70:	83 c2 01             	add    edx,0x1
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3c73:	4c 63 de             	movsxd r11,esi
    3c76:	4e 63 2c 9d 00 00 00 	movsxd r13,DWORD PTR [r11*4+0x0]
    3c7d:	00 
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3c7e:	46 3b 24 ab          	cmp    r12d,DWORD PTR [rbx+r13*4]
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3c82:	4d 89 e8             	mov    r8,r13
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3c85:	0f 85 9d 00 00 00    	jne    3d28 <gpu_run+0x38d8>
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3c8b:	89 f5                	mov    ebp,esi
/home/simon/prog/C/EMULATOR/GPU.c:454
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
    3c8d:	85 ed                	test   ebp,ebp
/home/simon/prog/C/EMULATOR/GPU.c:459
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						if(A[indx].i != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    3c8f:	89 d7                	mov    edi,edx
    3c91:	44 88 01             	mov    BYTE PTR [rcx],r8b
/home/simon/prog/C/EMULATOR/GPU.c:454
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
    3c94:	0f 84 5e 13 00 00    	je     4ff8 <gpu_run+0x4ba8>
/home/simon/prog/C/EMULATOR/GPU.c:455
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3c9a:	8d 75 ff             	lea    esi,[rbp-0x1]
    3c9d:	44 8d 52 01          	lea    r10d,[rdx+0x1]
    3ca1:	4c 63 ce             	movsxd r9,esi
    3ca4:	4e 63 3c 8d 00 00 00 	movsxd r15,DWORD PTR [r9*4+0x0]
    3cab:	00 
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3cac:	46 3b 24 bb          	cmp    r12d,DWORD PTR [rbx+r15*4]
    3cb0:	75 76                	jne    3d28 <gpu_run+0x38d8>
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3cb2:	44 8d 6e ff          	lea    r13d,[rsi-0x1]
    3cb6:	89 f5                	mov    ebp,esi
/home/simon/prog/C/EMULATOR/GPU.c:459
						if(A[indx].i != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    3cb8:	44 89 d7             	mov    edi,r10d
    3cbb:	44 88 79 01          	mov    BYTE PTR [rcx+0x1],r15b
    3cbf:	44 8d 42 02          	lea    r8d,[rdx+0x2]
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3cc3:	4d 63 dd             	movsxd r11,r13d
    3cc6:	4e 63 0c 9d 00 00 00 	movsxd r9,DWORD PTR [r11*4+0x0]
    3ccd:	00 
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3cce:	46 3b 24 8b          	cmp    r12d,DWORD PTR [rbx+r9*4]
    3cd2:	75 54                	jne    3d28 <gpu_run+0x38d8>
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3cd4:	45 8d 55 ff          	lea    r10d,[r13-0x1]
    3cd8:	44 89 ed             	mov    ebp,r13d
/home/simon/prog/C/EMULATOR/GPU.c:459
						if(A[indx].i != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    3cdb:	44 89 c7             	mov    edi,r8d
    3cde:	44 88 49 02          	mov    BYTE PTR [rcx+0x2],r9b
    3ce2:	44 8d 7a 03          	lea    r15d,[rdx+0x3]
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3ce6:	4d 63 ea             	movsxd r13,r10d
    3ce9:	4e 63 1c ad 00 00 00 	movsxd r11,DWORD PTR [r13*4+0x0]
    3cf0:	00 
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3cf1:	46 3b 24 9b          	cmp    r12d,DWORD PTR [rbx+r11*4]
    3cf5:	75 31                	jne    3d28 <gpu_run+0x38d8>
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3cf7:	8d 6e fe             	lea    ebp,[rsi-0x2]
    3cfa:	83 ee 03             	sub    esi,0x3
/home/simon/prog/C/EMULATOR/GPU.c:459
						if(A[indx].i != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    3cfd:	44 88 59 03          	mov    BYTE PTR [rcx+0x3],r11b
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3d01:	4c 63 c6             	movsxd r8,esi
    3d04:	83 c2 04             	add    edx,0x4
    3d07:	48 83 c1 04          	add    rcx,0x4
    3d0b:	4e 63 14 85 00 00 00 	movsxd r10,DWORD PTR [r8*4+0x0]
    3d12:	00 
/home/simon/prog/C/EMULATOR/GPU.c:459
						if(A[indx].i != spanPC) {
							break;
						}
						span->index[span->count++] = indx;
    3d13:	44 89 ff             	mov    edi,r15d
/home/simon/prog/C/EMULATOR/GPU.c:456
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						if(A[indx].i != spanPC) {
    3d16:	46 3b 24 93          	cmp    r12d,DWORD PTR [rbx+r10*4]
/home/simon/prog/C/EMULATOR/GPU.c:455
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
    3d1a:	4d 89 d0             	mov    r8,r10
/home/simon/prog/C/EMULATOR/GPU.c:456
						if(A[indx].i != spanPC) {
    3d1d:	0f 84 68 ff ff ff    	je     3c8b <gpu_run+0x383b>
    3d23:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    3d28:	89 2d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ebp        # 3d2e <gpu_run+0x38de>
    3d2e:	89 78 0c             	mov    DWORD PTR [rax+0xc],edi
insertExecSpan():
/home/simon/prog/C/EMULATOR/GPU.c:99
int GPU_ACTIVE_THREAD_INDEXES[GPU_CORE_COUNT] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
int GPU_ACTIVE_THREADS = GPU_CORE_COUNT;
execSpan *NEXT_EXEC_SPAN = 0;

void insertExecSpan(execSpan *span) {
	if(NEXT_EXEC_SPAN == 0 || NEXT_EXEC_SPAN->PC > span->PC) {
    3d31:	4d 85 f6             	test   r14,r14
    3d34:	0f 84 d6 12 00 00    	je     5010 <gpu_run+0x4bc0>
    3d3a:	45 8b 46 08          	mov    r8d,DWORD PTR [r14+0x8]
    3d3e:	4c 89 f1             	mov    rcx,r14
    3d41:	45 39 c4             	cmp    r12d,r8d
    3d44:	73 18                	jae    3d5e <gpu_run+0x390e>
    3d46:	e9 c5 12 00 00       	jmp    5010 <gpu_run+0x4bc0>
    3d4b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:104
		span->next = NEXT_EXEC_SPAN;
		NEXT_EXEC_SPAN = span;
	} else {
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
    3d50:	8b 72 08             	mov    esi,DWORD PTR [rdx+0x8]
    3d53:	41 39 f4             	cmp    r12d,esi
    3d56:	76 0e                	jbe    3d66 <gpu_run+0x3916>
    3d58:	41 89 f0             	mov    r8d,esi
    3d5b:	48 89 d1             	mov    rcx,rdx
    3d5e:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
    3d61:	48 85 d2             	test   rdx,rdx
    3d64:	75 ea                	jne    3d50 <gpu_run+0x3900>
/home/simon/prog/C/EMULATOR/GPU.c:107
			next = next->next;
		}
		if(next->PC == span->PC) {
    3d66:	45 39 c4             	cmp    r12d,r8d
    3d69:	0f 84 01 14 00 00    	je     5170 <gpu_run+0x4d20>
    3d6f:	8b 2d 00 00 00 00    	mov    ebp,DWORD PTR [rip+0x0]        # 3d75 <gpu_run+0x3925>
/home/simon/prog/C/EMULATOR/GPU.c:113
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
				next->index[next->count++] = span->index[--span->count];
			}
			free(span);
		} else {
			span->next = next->next;
    3d75:	48 89 10             	mov    QWORD PTR [rax],rdx
/home/simon/prog/C/EMULATOR/GPU.c:114
			next->next = span;
    3d78:	48 89 01             	mov    QWORD PTR [rcx],rax
    3d7b:	4c 89 f0             	mov    rax,r14
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:448
					A[indx].i = B[indx].f < C[indx].f ? -1 : (B[indx].f > C[indx].f ? 1 : 0);
				}
				break;
			case GPUOP_BR://branch
				cycles += 2+GPU_CORE_COUNT;
				while(GPU_ACTIVE_THREADS) {
    3d7e:	85 ed                	test   ebp,ebp
    3d80:	49 89 c6             	mov    r14,rax
    3d83:	0f 85 f7 fd ff ff    	jne    3b80 <gpu_run+0x3730>
mergeNextSpan():
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
    3d89:	41 8b 46 0c          	mov    eax,DWORD PTR [r14+0xc]
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:465
						--GPU_ACTIVE_THREADS;
	        		}
					insertExecSpan(span);
				}
				GPU_ACTIVE_THREADS = 0;
				currentPC = NEXT_EXEC_SPAN->PC;
    3d8d:	45 8b 6e 08          	mov    r13d,DWORD PTR [r14+0x8]
mergeNextSpan():
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
    3d91:	85 c0                	test   eax,eax
    3d93:	74 2d                	je     3dc2 <gpu_run+0x3972>
    3d95:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:121
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
    3d98:	83 e8 01             	sub    eax,0x1
    3d9b:	48 63 dd             	movsxd rbx,ebp
    3d9e:	83 c5 01             	add    ebp,0x1
    3da1:	41 89 46 0c          	mov    DWORD PTR [r14+0xc],eax
    3da5:	48 98                	cdqe   
    3da7:	41 0f b6 44 06 10    	movzx  eax,BYTE PTR [r14+rax*1+0x10]
    3dad:	89 04 9d 00 00 00 00 	mov    DWORD PTR [rbx*4+0x0],eax
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
    3db4:	41 8b 46 0c          	mov    eax,DWORD PTR [r14+0xc]
    3db8:	85 c0                	test   eax,eax
    3dba:	75 dc                	jne    3d98 <gpu_run+0x3948>
    3dbc:	89 2d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ebp        # 3dc2 <gpu_run+0x3972>
/home/simon/prog/C/EMULATOR/GPU.c:124
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
	}
	execSpan *tmp = NEXT_EXEC_SPAN;
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
    3dc2:	49 8b 2e             	mov    rbp,QWORD PTR [r14]
/home/simon/prog/C/EMULATOR/GPU.c:125
	free(tmp);
    3dc5:	4c 89 f7             	mov    rdi,r14
/home/simon/prog/C/EMULATOR/GPU.c:124
void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
	}
	execSpan *tmp = NEXT_EXEC_SPAN;
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
    3dc8:	48 89 2d 00 00 00 00 	mov    QWORD PTR [rip+0x0],rbp        # 3dcf <gpu_run+0x397f>
/home/simon/prog/C/EMULATOR/GPU.c:125
	free(tmp);
    3dcf:	e8 00 00 00 00       	call   3dd4 <gpu_run+0x3984>
    3dd4:	e9 97 f0 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    3dd9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:284
					mergeNextSpan();
				}
				break;
			case GPUOP_WR8:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3de0:	44 8b 3d 00 00 00 00 	mov    r15d,DWORD PTR [rip+0x0]        # 3de7 <gpu_run+0x3997>
/home/simon/prog/C/EMULATOR/GPU.c:283
					currentPC = NEXT_EXEC_SPAN->PC;
					mergeNextSpan();
				}
				break;
			case GPUOP_WR8:
				cycles += 8;
    3de7:	48 83 44 24 08 08    	add    QWORD PTR [rsp+0x8],0x8
/home/simon/prog/C/EMULATOR/GPU.c:284
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3ded:	45 85 ff             	test   r15d,r15d
    3df0:	0f 8e 7a f0 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:286 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    3df6:	48 63 05 00 00 00 00 	movsxd rax,DWORD PTR [rip+0x0]        # 3dfd <gpu_run+0x39ad>
    3dfd:	45 8d 57 ff          	lea    r10d,[r15-0x1]
    3e01:	41 bb 00 00 00 00    	mov    r11d,0x0
    3e07:	4a 8d 3c 95 00 00 00 	lea    rdi,[r10*4+0x0]
    3e0e:	00 
    3e0f:	41 83 e2 07          	and    r10d,0x7
    3e13:	8b 34 83             	mov    esi,DWORD PTR [rbx+rax*4]
/home/simon/prog/C/EMULATOR/GPU.c:284 (discriminator 3)
					mergeNextSpan();
				}
				break;
			case GPUOP_WR8:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3e16:	4c 39 df             	cmp    rdi,r11
/home/simon/prog/C/EMULATOR/GPU.c:286 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    3e19:	40 88 b0 00 00 00 00 	mov    BYTE PTR [rax+0x0],sil
/home/simon/prog/C/EMULATOR/GPU.c:284 (discriminator 3)
					mergeNextSpan();
				}
				break;
			case GPUOP_WR8:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3e20:	0f 84 4a f0 ff ff    	je     2e70 <gpu_run+0x2a20>
    3e26:	4d 85 d2             	test   r10,r10
    3e29:	0f 84 b9 00 00 00    	je     3ee8 <gpu_run+0x3a98>
    3e2f:	49 83 fa 01          	cmp    r10,0x1
    3e33:	0f 84 8e 00 00 00    	je     3ec7 <gpu_run+0x3a77>
    3e39:	49 83 fa 02          	cmp    r10,0x2
    3e3d:	74 77                	je     3eb6 <gpu_run+0x3a66>
    3e3f:	49 83 fa 03          	cmp    r10,0x3
    3e43:	74 5f                	je     3ea4 <gpu_run+0x3a54>
    3e45:	49 83 fa 04          	cmp    r10,0x4
    3e49:	74 47                	je     3e92 <gpu_run+0x3a42>
    3e4b:	49 83 fa 05          	cmp    r10,0x5
    3e4f:	74 2e                	je     3e7f <gpu_run+0x3a2f>
    3e51:	49 83 fa 06          	cmp    r10,0x6
    3e55:	74 16                	je     3e6d <gpu_run+0x3a1d>
/home/simon/prog/C/EMULATOR/GPU.c:286
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    3e57:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 3e5e <gpu_run+0x3a0e>
    3e5e:	41 bb 00 00 00 00    	mov    r11d,0x0
    3e64:	8b 14 8b             	mov    edx,DWORD PTR [rbx+rcx*4]
    3e67:	88 91 00 00 00 00    	mov    BYTE PTR [rcx+0x0],dl
    3e6d:	4d 63 03             	movsxd r8,DWORD PTR [r11]
    3e70:	49 83 c3 04          	add    r11,0x4
    3e74:	42 8b 2c 83          	mov    ebp,DWORD PTR [rbx+r8*4]
    3e78:	41 88 a8 00 00 00 00 	mov    BYTE PTR [r8+0x0],bpl
    3e7f:	4d 63 23             	movsxd r12,DWORD PTR [r11]
    3e82:	49 83 c3 04          	add    r11,0x4
    3e86:	46 8b 34 a3          	mov    r14d,DWORD PTR [rbx+r12*4]
    3e8a:	45 88 b4 24 00 00 00 	mov    BYTE PTR [r12+0x0],r14b
    3e91:	00 
    3e92:	4d 63 0b             	movsxd r9,DWORD PTR [r11]
    3e95:	49 83 c3 04          	add    r11,0x4
    3e99:	46 8b 3c 8b          	mov    r15d,DWORD PTR [rbx+r9*4]
    3e9d:	45 88 b9 00 00 00 00 	mov    BYTE PTR [r9+0x0],r15b
    3ea4:	4d 63 13             	movsxd r10,DWORD PTR [r11]
    3ea7:	49 83 c3 04          	add    r11,0x4
    3eab:	42 8b 04 93          	mov    eax,DWORD PTR [rbx+r10*4]
    3eaf:	41 88 82 00 00 00 00 	mov    BYTE PTR [r10+0x0],al
    3eb6:	49 63 0b             	movsxd rcx,DWORD PTR [r11]
    3eb9:	49 83 c3 04          	add    r11,0x4
    3ebd:	8b 34 8b             	mov    esi,DWORD PTR [rbx+rcx*4]
    3ec0:	40 88 b1 00 00 00 00 	mov    BYTE PTR [rcx+0x0],sil
    3ec7:	49 63 13             	movsxd rdx,DWORD PTR [r11]
    3eca:	49 83 c3 04          	add    r11,0x4
/home/simon/prog/C/EMULATOR/GPU.c:284
					mergeNextSpan();
				}
				break;
			case GPUOP_WR8:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3ece:	4c 39 df             	cmp    rdi,r11
/home/simon/prog/C/EMULATOR/GPU.c:286
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    3ed1:	44 8b 04 93          	mov    r8d,DWORD PTR [rbx+rdx*4]
    3ed5:	44 88 82 00 00 00 00 	mov    BYTE PTR [rdx+0x0],r8b
/home/simon/prog/C/EMULATOR/GPU.c:284
					mergeNextSpan();
				}
				break;
			case GPUOP_WR8:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3edc:	0f 84 8e ef ff ff    	je     2e70 <gpu_run+0x2a20>
    3ee2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:286 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    3ee8:	49 63 2b             	movsxd rbp,DWORD PTR [r11]
    3eeb:	4d 63 73 04          	movsxd r14,DWORD PTR [r11+0x4]
    3eef:	49 83 c3 20          	add    r11,0x20
    3ef3:	4d 63 7b e8          	movsxd r15,DWORD PTR [r11-0x18]
    3ef7:	49 63 43 ec          	movsxd rax,DWORD PTR [r11-0x14]
    3efb:	49 63 53 f0          	movsxd rdx,DWORD PTR [r11-0x10]
    3eff:	4d 63 43 f4          	movsxd r8,DWORD PTR [r11-0xc]
    3f03:	44 8b 24 ab          	mov    r12d,DWORD PTR [rbx+rbp*4]
    3f07:	46 8b 0c b3          	mov    r9d,DWORD PTR [rbx+r14*4]
    3f0b:	46 8b 14 bb          	mov    r10d,DWORD PTR [rbx+r15*4]
    3f0f:	8b 0c 83             	mov    ecx,DWORD PTR [rbx+rax*4]
    3f12:	8b 34 93             	mov    esi,DWORD PTR [rbx+rdx*4]
    3f15:	44 88 a5 00 00 00 00 	mov    BYTE PTR [rbp+0x0],r12b
    3f1c:	45 88 8e 00 00 00 00 	mov    BYTE PTR [r14+0x0],r9b
    3f23:	4d 63 63 f8          	movsxd r12,DWORD PTR [r11-0x8]
    3f27:	4d 63 4b fc          	movsxd r9,DWORD PTR [r11-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:284 (discriminator 3)
					mergeNextSpan();
				}
				break;
			case GPUOP_WR8:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3f2b:	4c 39 df             	cmp    rdi,r11
/home/simon/prog/C/EMULATOR/GPU.c:286 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    3f2e:	45 88 97 00 00 00 00 	mov    BYTE PTR [r15+0x0],r10b
    3f35:	42 8b 2c 83          	mov    ebp,DWORD PTR [rbx+r8*4]
    3f39:	88 88 00 00 00 00    	mov    BYTE PTR [rax+0x0],cl
    3f3f:	40 88 b2 00 00 00 00 	mov    BYTE PTR [rdx+0x0],sil
    3f46:	46 8b 34 a3          	mov    r14d,DWORD PTR [rbx+r12*4]
    3f4a:	46 8b 3c 8b          	mov    r15d,DWORD PTR [rbx+r9*4]
    3f4e:	41 88 a8 00 00 00 00 	mov    BYTE PTR [r8+0x0],bpl
    3f55:	45 88 b4 24 00 00 00 	mov    BYTE PTR [r12+0x0],r14b
    3f5c:	00 
    3f5d:	45 88 b9 00 00 00 00 	mov    BYTE PTR [r9+0x0],r15b
/home/simon/prog/C/EMULATOR/GPU.c:284 (discriminator 3)
					mergeNextSpan();
				}
				break;
			case GPUOP_WR8:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3f64:	75 82                	jne    3ee8 <gpu_run+0x3a98>
    3f66:	e9 05 ef ff ff       	jmp    2e70 <gpu_run+0x2a20>
    3f6b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:221
	        		A[indx].i = B[indx].i - C[indx].i;
	      		}
				break;
			case GPUOP_MUL16:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3f70:	44 8b 0d 00 00 00 00 	mov    r9d,DWORD PTR [rip+0x0]        # 3f77 <gpu_run+0x3b27>
/home/simon/prog/C/EMULATOR/GPU.c:220
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i - C[indx].i;
	      		}
				break;
			case GPUOP_MUL16:
				cycles += 1;
    3f77:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:221
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3f7d:	45 85 c9             	test   r9d,r9d
    3f80:	0f 8e ea ee ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:223 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
    3f86:	4c 63 3d 00 00 00 00 	movsxd r15,DWORD PTR [rip+0x0]        # 3f8d <gpu_run+0x3b3d>
    3f8d:	45 8d 71 ff          	lea    r14d,[r9-0x1]
    3f91:	4a 8d 3c b5 00 00 00 	lea    rdi,[r14*4+0x0]
    3f98:	00 
    3f99:	41 83 e6 03          	and    r14d,0x3
    3f9d:	49 c1 e7 02          	shl    r15,0x2
    3fa1:	45 0f b7 9c 17 00 00 	movzx  r11d,WORD PTR [r15+rdx*1+0x0]
    3fa8:	00 00 
    3faa:	45 0f b7 84 37 00 00 	movzx  r8d,WORD PTR [r15+rsi*1+0x0]
    3fb1:	00 00 
    3fb3:	45 0f af c3          	imul   r8d,r11d
    3fb7:	45 89 84 07 00 00 00 	mov    DWORD PTR [r15+rax*1+0x0],r8d
    3fbe:	00 
    3fbf:	41 bf 00 00 00 00    	mov    r15d,0x0
/home/simon/prog/C/EMULATOR/GPU.c:221 (discriminator 3)
	        		A[indx].i = B[indx].i - C[indx].i;
	      		}
				break;
			case GPUOP_MUL16:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    3fc5:	49 39 ff             	cmp    r15,rdi
    3fc8:	0f 84 a2 ee ff ff    	je     2e70 <gpu_run+0x2a20>
    3fce:	4d 85 f6             	test   r14,r14
    3fd1:	0f 84 99 00 00 00    	je     4070 <gpu_run+0x3c20>
    3fd7:	49 83 fe 01          	cmp    r14,0x1
    3fdb:	74 5e                	je     403b <gpu_run+0x3beb>
    3fdd:	49 83 fe 02          	cmp    r14,0x2
    3fe1:	74 2f                	je     4012 <gpu_run+0x3bc2>
/home/simon/prog/C/EMULATOR/GPU.c:223
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
    3fe3:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 3fea <gpu_run+0x3b9a>
    3fea:	41 bf 00 00 00 00    	mov    r15d,0x0
    3ff0:	48 c1 e1 02          	shl    rcx,0x2
    3ff4:	44 0f b7 94 0a 00 00 	movzx  r10d,WORD PTR [rdx+rcx*1+0x0]
    3ffb:	00 00 
    3ffd:	44 0f b7 8c 0e 00 00 	movzx  r9d,WORD PTR [rsi+rcx*1+0x0]
    4004:	00 00 
    4006:	45 0f af ca          	imul   r9d,r10d
    400a:	44 89 8c 08 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],r9d
    4011:	00 
    4012:	4d 63 37             	movsxd r14,DWORD PTR [r15]
    4015:	49 83 c7 04          	add    r15,0x4
    4019:	49 c1 e6 02          	shl    r14,0x2
    401d:	46 0f b7 9c 32 00 00 	movzx  r11d,WORD PTR [rdx+r14*1+0x0]
    4024:	00 00 
    4026:	46 0f b7 84 36 00 00 	movzx  r8d,WORD PTR [rsi+r14*1+0x0]
    402d:	00 00 
    402f:	45 0f af c3          	imul   r8d,r11d
    4033:	46 89 84 30 00 00 00 	mov    DWORD PTR [rax+r14*1+0x0],r8d
    403a:	00 
    403b:	49 63 0f             	movsxd rcx,DWORD PTR [r15]
    403e:	49 83 c7 04          	add    r15,0x4
    4042:	48 c1 e1 02          	shl    rcx,0x2
    4046:	44 0f b7 94 0a 00 00 	movzx  r10d,WORD PTR [rdx+rcx*1+0x0]
    404d:	00 00 
    404f:	0f b7 94 0e 00 00 00 	movzx  edx,WORD PTR [rsi+rcx*1+0x0]
    4056:	00 
    4057:	41 0f af d2          	imul   edx,r10d
/home/simon/prog/C/EMULATOR/GPU.c:221
	        		A[indx].i = B[indx].i - C[indx].i;
	      		}
				break;
			case GPUOP_MUL16:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    405b:	49 39 ff             	cmp    r15,rdi
/home/simon/prog/C/EMULATOR/GPU.c:223
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
    405e:	89 94 08 00 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],edx
/home/simon/prog/C/EMULATOR/GPU.c:221
	        		A[indx].i = B[indx].i - C[indx].i;
	      		}
				break;
			case GPUOP_MUL16:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4065:	0f 84 05 ee ff ff    	je     2e70 <gpu_run+0x2a20>
    406b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:223 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
    4070:	49 63 07             	movsxd rax,DWORD PTR [r15]
    4073:	4d 63 77 04          	movsxd r14,DWORD PTR [r15+0x4]
    4077:	49 83 c7 10          	add    r15,0x10
    407b:	49 63 4f f8          	movsxd rcx,DWORD PTR [r15-0x8]
    407f:	0f b7 74 85 00       	movzx  esi,WORD PTR [rbp+rax*4+0x0]
    4084:	45 0f b7 0c 84       	movzx  r9d,WORD PTR [r12+rax*4]
    4089:	44 0f af ce          	imul   r9d,esi
    408d:	44 89 0c 83          	mov    DWORD PTR [rbx+rax*4],r9d
    4091:	46 0f b7 5c b5 00    	movzx  r11d,WORD PTR [rbp+r14*4+0x0]
    4097:	47 0f b7 04 b4       	movzx  r8d,WORD PTR [r12+r14*4]
    409c:	49 63 47 fc          	movsxd rax,DWORD PTR [r15-0x4]
    40a0:	45 0f af c3          	imul   r8d,r11d
    40a4:	46 89 04 b3          	mov    DWORD PTR [rbx+r14*4],r8d
    40a8:	44 0f b7 54 8d 00    	movzx  r10d,WORD PTR [rbp+rcx*4+0x0]
    40ae:	41 0f b7 14 8c       	movzx  edx,WORD PTR [r12+rcx*4]
    40b3:	41 0f af d2          	imul   edx,r10d
    40b7:	89 14 8b             	mov    DWORD PTR [rbx+rcx*4],edx
    40ba:	0f b7 74 85 00       	movzx  esi,WORD PTR [rbp+rax*4+0x0]
    40bf:	45 0f b7 0c 84       	movzx  r9d,WORD PTR [r12+rax*4]
    40c4:	44 0f af ce          	imul   r9d,esi
/home/simon/prog/C/EMULATOR/GPU.c:221 (discriminator 3)
	        		A[indx].i = B[indx].i - C[indx].i;
	      		}
				break;
			case GPUOP_MUL16:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    40c8:	49 39 ff             	cmp    r15,rdi
/home/simon/prog/C/EMULATOR/GPU.c:223 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (B[indx].i & 0xffff) * (C[indx].i&0xffff);
    40cb:	44 89 0c 83          	mov    DWORD PTR [rbx+rax*4],r9d
/home/simon/prog/C/EMULATOR/GPU.c:221 (discriminator 3)
	        		A[indx].i = B[indx].i - C[indx].i;
	      		}
				break;
			case GPUOP_MUL16:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    40cf:	75 9f                	jne    4070 <gpu_run+0x3c20>
    40d1:	e9 9a ed ff ff       	jmp    2e70 <gpu_run+0x2a20>
    40d6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    40dd:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:214
					A[i].i = B[i].i + C[i].i;
	      		}
				break;
			case GPUOP_SUB:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    40e0:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 40e6 <gpu_run+0x3c96>
/home/simon/prog/C/EMULATOR/GPU.c:213
					//}
					A[i].i = B[i].i + C[i].i;
	      		}
				break;
			case GPUOP_SUB:
				cycles += 1;
    40e6:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:214
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    40ec:	85 ff                	test   edi,edi
    40ee:	0f 8e 7c ed ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:216 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i - C[indx].i;
    40f4:	4c 63 1d 00 00 00 00 	movsxd r11,DWORD PTR [rip+0x0]        # 40fb <gpu_run+0x3cab>
    40fb:	44 8d 7f ff          	lea    r15d,[rdi-0x1]
    40ff:	bf 00 00 00 00       	mov    edi,0x0
    4104:	4e 8d 34 bd 00 00 00 	lea    r14,[r15*4+0x0]
    410b:	00 
    410c:	41 83 e7 07          	and    r15d,0x7
    4110:	49 c1 e3 02          	shl    r11,0x2
    4114:	45 8b 84 13 00 00 00 	mov    r8d,DWORD PTR [r11+rdx*1+0x0]
    411b:	00 
    411c:	45 2b 84 33 00 00 00 	sub    r8d,DWORD PTR [r11+rsi*1+0x0]
    4123:	00 
/home/simon/prog/C/EMULATOR/GPU.c:214 (discriminator 3)
					A[i].i = B[i].i + C[i].i;
	      		}
				break;
			case GPUOP_SUB:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4124:	4c 39 f7             	cmp    rdi,r14
/home/simon/prog/C/EMULATOR/GPU.c:216 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i - C[indx].i;
    4127:	45 89 84 03 00 00 00 	mov    DWORD PTR [r11+rax*1+0x0],r8d
    412e:	00 
/home/simon/prog/C/EMULATOR/GPU.c:214 (discriminator 3)
					A[i].i = B[i].i + C[i].i;
	      		}
				break;
			case GPUOP_SUB:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    412f:	0f 84 3b ed ff ff    	je     2e70 <gpu_run+0x2a20>
    4135:	4d 85 ff             	test   r15,r15
    4138:	0f 84 32 01 00 00    	je     4270 <gpu_run+0x3e20>
    413e:	49 83 ff 01          	cmp    r15,0x1
    4142:	0f 84 fd 00 00 00    	je     4245 <gpu_run+0x3df5>
    4148:	49 83 ff 02          	cmp    r15,0x2
    414c:	0f 84 d0 00 00 00    	je     4222 <gpu_run+0x3dd2>
    4152:	49 83 ff 03          	cmp    r15,0x3
    4156:	0f 84 a3 00 00 00    	je     41ff <gpu_run+0x3daf>
    415c:	49 83 ff 04          	cmp    r15,0x4
    4160:	74 7a                	je     41dc <gpu_run+0x3d8c>
    4162:	49 83 ff 05          	cmp    r15,0x5
    4166:	74 51                	je     41b9 <gpu_run+0x3d69>
    4168:	49 83 ff 06          	cmp    r15,0x6
    416c:	74 28                	je     4196 <gpu_run+0x3d46>
/home/simon/prog/C/EMULATOR/GPU.c:216
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i - C[indx].i;
    416e:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 4175 <gpu_run+0x3d25>
    4175:	bf 00 00 00 00       	mov    edi,0x0
    417a:	48 c1 e1 02          	shl    rcx,0x2
    417e:	44 8b 94 0a 00 00 00 	mov    r10d,DWORD PTR [rdx+rcx*1+0x0]
    4185:	00 
    4186:	44 2b 94 0e 00 00 00 	sub    r10d,DWORD PTR [rsi+rcx*1+0x0]
    418d:	00 
    418e:	44 89 94 08 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],r10d
    4195:	00 
    4196:	4c 63 0f             	movsxd r9,DWORD PTR [rdi]
    4199:	48 83 c7 04          	add    rdi,0x4
    419d:	49 c1 e1 02          	shl    r9,0x2
    41a1:	46 8b bc 0a 00 00 00 	mov    r15d,DWORD PTR [rdx+r9*1+0x0]
    41a8:	00 
    41a9:	46 2b bc 0e 00 00 00 	sub    r15d,DWORD PTR [rsi+r9*1+0x0]
    41b0:	00 
    41b1:	46 89 bc 08 00 00 00 	mov    DWORD PTR [rax+r9*1+0x0],r15d
    41b8:	00 
    41b9:	4c 63 1f             	movsxd r11,DWORD PTR [rdi]
    41bc:	48 83 c7 04          	add    rdi,0x4
    41c0:	49 c1 e3 02          	shl    r11,0x2
    41c4:	46 8b 84 1a 00 00 00 	mov    r8d,DWORD PTR [rdx+r11*1+0x0]
    41cb:	00 
    41cc:	46 2b 84 1e 00 00 00 	sub    r8d,DWORD PTR [rsi+r11*1+0x0]
    41d3:	00 
    41d4:	46 89 84 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],r8d
    41db:	00 
    41dc:	48 63 0f             	movsxd rcx,DWORD PTR [rdi]
    41df:	48 83 c7 04          	add    rdi,0x4
    41e3:	48 c1 e1 02          	shl    rcx,0x2
    41e7:	44 8b 94 0a 00 00 00 	mov    r10d,DWORD PTR [rdx+rcx*1+0x0]
    41ee:	00 
    41ef:	44 2b 94 0e 00 00 00 	sub    r10d,DWORD PTR [rsi+rcx*1+0x0]
    41f6:	00 
    41f7:	44 89 94 08 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],r10d
    41fe:	00 
    41ff:	4c 63 0f             	movsxd r9,DWORD PTR [rdi]
    4202:	48 83 c7 04          	add    rdi,0x4
    4206:	49 c1 e1 02          	shl    r9,0x2
    420a:	46 8b bc 0a 00 00 00 	mov    r15d,DWORD PTR [rdx+r9*1+0x0]
    4211:	00 
    4212:	46 2b bc 0e 00 00 00 	sub    r15d,DWORD PTR [rsi+r9*1+0x0]
    4219:	00 
    421a:	46 89 bc 08 00 00 00 	mov    DWORD PTR [rax+r9*1+0x0],r15d
    4221:	00 
    4222:	4c 63 1f             	movsxd r11,DWORD PTR [rdi]
    4225:	48 83 c7 04          	add    rdi,0x4
    4229:	49 c1 e3 02          	shl    r11,0x2
    422d:	46 8b 84 1a 00 00 00 	mov    r8d,DWORD PTR [rdx+r11*1+0x0]
    4234:	00 
    4235:	46 2b 84 1e 00 00 00 	sub    r8d,DWORD PTR [rsi+r11*1+0x0]
    423c:	00 
    423d:	46 89 84 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],r8d
    4244:	00 
    4245:	48 63 0f             	movsxd rcx,DWORD PTR [rdi]
    4248:	48 83 c7 04          	add    rdi,0x4
    424c:	48 c1 e1 02          	shl    rcx,0x2
    4250:	8b 94 0a 00 00 00 00 	mov    edx,DWORD PTR [rdx+rcx*1+0x0]
    4257:	2b 94 0e 00 00 00 00 	sub    edx,DWORD PTR [rsi+rcx*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:214
					A[i].i = B[i].i + C[i].i;
	      		}
				break;
			case GPUOP_SUB:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    425e:	4c 39 f7             	cmp    rdi,r14
/home/simon/prog/C/EMULATOR/GPU.c:216
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i - C[indx].i;
    4261:	89 94 08 00 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],edx
/home/simon/prog/C/EMULATOR/GPU.c:214
					A[i].i = B[i].i + C[i].i;
	      		}
				break;
			case GPUOP_SUB:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4268:	0f 84 02 ec ff ff    	je     2e70 <gpu_run+0x2a20>
    426e:	66 90                	xchg   ax,ax
/home/simon/prog/C/EMULATOR/GPU.c:216 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i - C[indx].i;
    4270:	48 63 07             	movsxd rax,DWORD PTR [rdi]
    4273:	4c 63 57 04          	movsxd r10,DWORD PTR [rdi+0x4]
    4277:	48 83 c7 20          	add    rdi,0x20
    427b:	4c 63 7f e8          	movsxd r15,DWORD PTR [rdi-0x18]
    427f:	4c 63 47 ec          	movsxd r8,DWORD PTR [rdi-0x14]
    4283:	8b 74 85 00          	mov    esi,DWORD PTR [rbp+rax*4+0x0]
    4287:	41 2b 34 84          	sub    esi,DWORD PTR [r12+rax*4]
    428b:	89 34 83             	mov    DWORD PTR [rbx+rax*4],esi
    428e:	46 8b 4c 95 00       	mov    r9d,DWORD PTR [rbp+r10*4+0x0]
    4293:	47 2b 0c 94          	sub    r9d,DWORD PTR [r12+r10*4]
    4297:	48 63 47 f0          	movsxd rax,DWORD PTR [rdi-0x10]
    429b:	48 63 77 f4          	movsxd rsi,DWORD PTR [rdi-0xc]
    429f:	46 89 0c 93          	mov    DWORD PTR [rbx+r10*4],r9d
    42a3:	46 8b 5c bd 00       	mov    r11d,DWORD PTR [rbp+r15*4+0x0]
    42a8:	47 2b 1c bc          	sub    r11d,DWORD PTR [r12+r15*4]
    42ac:	4c 63 4f f8          	movsxd r9,DWORD PTR [rdi-0x8]
    42b0:	46 89 1c bb          	mov    DWORD PTR [rbx+r15*4],r11d
    42b4:	42 8b 4c 85 00       	mov    ecx,DWORD PTR [rbp+r8*4+0x0]
    42b9:	43 2b 0c 84          	sub    ecx,DWORD PTR [r12+r8*4]
    42bd:	4c 63 5f fc          	movsxd r11,DWORD PTR [rdi-0x4]
    42c1:	42 89 0c 83          	mov    DWORD PTR [rbx+r8*4],ecx
    42c5:	8b 54 85 00          	mov    edx,DWORD PTR [rbp+rax*4+0x0]
    42c9:	41 2b 14 84          	sub    edx,DWORD PTR [r12+rax*4]
    42cd:	89 14 83             	mov    DWORD PTR [rbx+rax*4],edx
    42d0:	44 8b 54 b5 00       	mov    r10d,DWORD PTR [rbp+rsi*4+0x0]
    42d5:	45 2b 14 b4          	sub    r10d,DWORD PTR [r12+rsi*4]
    42d9:	44 89 14 b3          	mov    DWORD PTR [rbx+rsi*4],r10d
    42dd:	46 8b 7c 8d 00       	mov    r15d,DWORD PTR [rbp+r9*4+0x0]
    42e2:	47 2b 3c 8c          	sub    r15d,DWORD PTR [r12+r9*4]
    42e6:	46 89 3c 8b          	mov    DWORD PTR [rbx+r9*4],r15d
    42ea:	46 8b 44 9d 00       	mov    r8d,DWORD PTR [rbp+r11*4+0x0]
    42ef:	47 2b 04 9c          	sub    r8d,DWORD PTR [r12+r11*4]
/home/simon/prog/C/EMULATOR/GPU.c:214 (discriminator 3)
					A[i].i = B[i].i + C[i].i;
	      		}
				break;
			case GPUOP_SUB:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    42f3:	4c 39 f7             	cmp    rdi,r14
/home/simon/prog/C/EMULATOR/GPU.c:216 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i - C[indx].i;
    42f6:	46 89 04 9b          	mov    DWORD PTR [rbx+r11*4],r8d
/home/simon/prog/C/EMULATOR/GPU.c:214 (discriminator 3)
					A[i].i = B[i].i + C[i].i;
	      		}
				break;
			case GPUOP_SUB:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    42fa:	0f 85 70 ff ff ff    	jne    4270 <gpu_run+0x3e20>
    4300:	e9 6b eb ff ff       	jmp    2e70 <gpu_run+0x2a20>
    4305:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4308:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # 430f <gpu_run+0x3ebf>
/home/simon/prog/C/EMULATOR/GPU.c:202
		GPU_REGISTER * __restrict__ B  = __builtin_assume_aligned(gpu_registers+((inst & 31)*GPU_CORE_COUNT),16);
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
    430f:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:203
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4315:	45 85 db             	test   r11d,r11d
    4318:	0f 8e 52 eb ff ff    	jle    2e70 <gpu_run+0x2a20>
    431e:	4c 8d 75 10          	lea    r14,[rbp+0x10]
    4322:	4c 8d 53 10          	lea    r10,[rbx+0x10]
    4326:	4d 8d 7c 24 10       	lea    r15,[r12+0x10]
    432b:	4c 39 f3             	cmp    rbx,r14
    432e:	41 0f 93 c1          	setae  r9b
    4332:	4c 39 d5             	cmp    rbp,r10
    4335:	41 0f 93 c6          	setae  r14b
    4339:	45 09 ce             	or     r14d,r9d
    433c:	4c 39 fb             	cmp    rbx,r15
    433f:	41 0f 93 c1          	setae  r9b
    4343:	4d 39 d4             	cmp    r12,r10
    4346:	41 0f 93 c2          	setae  r10b
    434a:	45 09 ca             	or     r10d,r9d
    434d:	45 84 d6             	test   r14b,r10b
    4350:	0f 84 01 13 00 00    	je     5657 <gpu_run+0x5207>
    4356:	41 83 fb 05          	cmp    r11d,0x5
    435a:	0f 86 f7 12 00 00    	jbe    5657 <gpu_run+0x5207>
    4360:	45 8d 73 fc          	lea    r14d,[r11-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    4364:	66 44 0f 6f 04 bd 00 	movdqa xmm8,XMMWORD PTR [rdi*4+0x0]
    436b:	00 00 00 
    436e:	bf 01 00 00 00       	mov    edi,0x1
    4373:	41 c1 ee 02          	shr    r14d,0x2
    4377:	66 44 0f fe 04 8d 00 	paddd  xmm8,XMMWORD PTR [rcx*4+0x0]
    437e:	00 00 00 
    4381:	b9 10 00 00 00       	mov    ecx,0x10
    4386:	45 8d 7e 01          	lea    r15d,[r14+0x1]
    438a:	41 83 e6 07          	and    r14d,0x7
    438e:	46 0f 29 04 85 00 00 	movaps XMMWORD PTR [r8*4+0x0],xmm8
    4395:	00 00 
    4397:	44 39 ff             	cmp    edi,r15d
    439a:	46 8d 0c bd 00 00 00 	lea    r9d,[r15*4+0x0]
    43a1:	00 
    43a2:	0f 83 22 01 00 00    	jae    44ca <gpu_run+0x407a>
    43a8:	45 85 f6             	test   r14d,r14d
    43ab:	0f 84 d8 18 00 00    	je     5c89 <gpu_run+0x5839>
    43b1:	41 83 fe 01          	cmp    r14d,0x1
    43b5:	0f 84 e5 00 00 00    	je     44a0 <gpu_run+0x4050>
    43bb:	41 83 fe 02          	cmp    r14d,0x2
    43bf:	0f 84 ba 00 00 00    	je     447f <gpu_run+0x402f>
    43c5:	41 83 fe 03          	cmp    r14d,0x3
    43c9:	0f 84 8f 00 00 00    	je     445e <gpu_run+0x400e>
    43cf:	41 83 fe 04          	cmp    r14d,0x4
    43d3:	74 68                	je     443d <gpu_run+0x3fed>
    43d5:	41 83 fe 05          	cmp    r14d,0x5
    43d9:	74 41                	je     441c <gpu_run+0x3fcc>
    43db:	41 83 fe 06          	cmp    r14d,0x6
    43df:	74 1a                	je     43fb <gpu_run+0x3fab>
    43e1:	66 0f 6f 4d 10       	movdqa xmm1,XMMWORD PTR [rbp+0x10]
    43e6:	bf 02 00 00 00       	mov    edi,0x2
    43eb:	b9 20 00 00 00       	mov    ecx,0x20
    43f0:	66 41 0f fe 4c 24 10 	paddd  xmm1,XMMWORD PTR [r12+0x10]
    43f7:	0f 29 4b 10          	movaps XMMWORD PTR [rbx+0x10],xmm1
    43fb:	83 c7 01             	add    edi,0x1
    43fe:	66 0f 6f 84 0a 00 00 	movdqa xmm0,XMMWORD PTR [rdx+rcx*1+0x0]
    4405:	00 00 
    4407:	66 0f fe 84 0e 00 00 	paddd  xmm0,XMMWORD PTR [rsi+rcx*1+0x0]
    440e:	00 00 
    4410:	0f 29 84 08 00 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm0
    4417:	00 
    4418:	48 83 c1 10          	add    rcx,0x10
    441c:	83 c7 01             	add    edi,0x1
    441f:	66 0f 6f 94 0a 00 00 	movdqa xmm2,XMMWORD PTR [rdx+rcx*1+0x0]
    4426:	00 00 
    4428:	66 0f fe 94 0e 00 00 	paddd  xmm2,XMMWORD PTR [rsi+rcx*1+0x0]
    442f:	00 00 
    4431:	0f 29 94 08 00 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm2
    4438:	00 
    4439:	48 83 c1 10          	add    rcx,0x10
    443d:	83 c7 01             	add    edi,0x1
    4440:	66 0f 6f 9c 0a 00 00 	movdqa xmm3,XMMWORD PTR [rdx+rcx*1+0x0]
    4447:	00 00 
    4449:	66 0f fe 9c 0e 00 00 	paddd  xmm3,XMMWORD PTR [rsi+rcx*1+0x0]
    4450:	00 00 
    4452:	0f 29 9c 08 00 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm3
    4459:	00 
    445a:	48 83 c1 10          	add    rcx,0x10
    445e:	83 c7 01             	add    edi,0x1
    4461:	66 0f 6f a4 0a 00 00 	movdqa xmm4,XMMWORD PTR [rdx+rcx*1+0x0]
    4468:	00 00 
    446a:	66 0f fe a4 0e 00 00 	paddd  xmm4,XMMWORD PTR [rsi+rcx*1+0x0]
    4471:	00 00 
    4473:	0f 29 a4 08 00 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm4
    447a:	00 
    447b:	48 83 c1 10          	add    rcx,0x10
    447f:	83 c7 01             	add    edi,0x1
    4482:	66 0f 6f b4 0a 00 00 	movdqa xmm6,XMMWORD PTR [rdx+rcx*1+0x0]
    4489:	00 00 
    448b:	66 0f fe b4 0e 00 00 	paddd  xmm6,XMMWORD PTR [rsi+rcx*1+0x0]
    4492:	00 00 
    4494:	0f 29 b4 08 00 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm6
    449b:	00 
    449c:	48 83 c1 10          	add    rcx,0x10
    44a0:	83 c7 01             	add    edi,0x1
    44a3:	66 0f 6f ac 0a 00 00 	movdqa xmm5,XMMWORD PTR [rdx+rcx*1+0x0]
    44aa:	00 00 
    44ac:	66 0f fe ac 0e 00 00 	paddd  xmm5,XMMWORD PTR [rsi+rcx*1+0x0]
    44b3:	00 00 
    44b5:	0f 29 ac 08 00 00 00 	movaps XMMWORD PTR [rax+rcx*1+0x0],xmm5
    44bc:	00 
    44bd:	48 83 c1 10          	add    rcx,0x10
    44c1:	44 39 ff             	cmp    edi,r15d
    44c4:	0f 82 bf 17 00 00    	jb     5c89 <gpu_run+0x5839>
    44ca:	45 39 d9             	cmp    r9d,r11d
    44cd:	0f 84 9d e9 ff ff    	je     2e70 <gpu_run+0x2a20>
    44d3:	49 63 e9             	movsxd rbp,r9d
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    44d6:	41 8d 59 01          	lea    ebx,[r9+0x1]
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    44da:	48 c1 e5 02          	shl    rbp,0x2
    44de:	44 8b a4 35 00 00 00 	mov    r12d,DWORD PTR [rbp+rsi*1+0x0]
    44e5:	00 
    44e6:	44 03 a4 15 00 00 00 	add    r12d,DWORD PTR [rbp+rdx*1+0x0]
    44ed:	00 
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    44ee:	41 39 db             	cmp    r11d,ebx
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    44f1:	44 89 a4 05 00 00 00 	mov    DWORD PTR [rbp+rax*1+0x0],r12d
    44f8:	00 
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    44f9:	0f 8e 71 e9 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    44ff:	4c 63 c3             	movsxd r8,ebx
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4502:	41 83 c1 02          	add    r9d,0x2
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    4506:	49 c1 e0 02          	shl    r8,0x2
    450a:	45 8b 94 30 00 00 00 	mov    r10d,DWORD PTR [r8+rsi*1+0x0]
    4511:	00 
    4512:	45 03 94 10 00 00 00 	add    r10d,DWORD PTR [r8+rdx*1+0x0]
    4519:	00 
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    451a:	45 39 cb             	cmp    r11d,r9d
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    451d:	45 89 94 00 00 00 00 	mov    DWORD PTR [r8+rax*1+0x0],r10d
    4524:	00 
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4525:	0f 8e 45 e9 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    452b:	4d 63 f1             	movsxd r14,r9d
    452e:	4e 8d 3c b5 00 00 00 	lea    r15,[r14*4+0x0]
    4535:	00 
    4536:	41 8b b4 37 00 00 00 	mov    esi,DWORD PTR [r15+rsi*1+0x0]
    453d:	00 
    453e:	41 03 b4 17 00 00 00 	add    esi,DWORD PTR [r15+rdx*1+0x0]
    4545:	00 
    4546:	41 89 b4 07 00 00 00 	mov    DWORD PTR [r15+rax*1+0x0],esi
    454d:	00 
    454e:	e9 1d e9 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    4553:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:298
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD8:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4558:	44 8b 25 00 00 00 00 	mov    r12d,DWORD PTR [rip+0x0]        # 455f <gpu_run+0x410f>
/home/simon/prog/C/EMULATOR/GPU.c:297
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD8:
				cycles += 2;
    455f:	48 83 44 24 08 02    	add    QWORD PTR [rsp+0x8],0x2
/home/simon/prog/C/EMULATOR/GPU.c:298
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4565:	45 85 e4             	test   r12d,r12d
    4568:	0f 8e 02 e9 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:300 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    456e:	48 63 05 00 00 00 00 	movsxd rax,DWORD PTR [rip+0x0]        # 4575 <gpu_run+0x4125>
    4575:	45 8d 7c 24 ff       	lea    r15d,[r12-0x1]
    457a:	41 b9 00 00 00 00    	mov    r9d,0x0
    4580:	4e 8d 34 bd 00 00 00 	lea    r14,[r15*4+0x0]
    4587:	00 
    4588:	41 83 e7 07          	and    r15d,0x7
    458c:	0f b6 b8 00 00 00 00 	movzx  edi,BYTE PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:298 (discriminator 3)
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD8:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4593:	4d 39 f1             	cmp    r9,r14
/home/simon/prog/C/EMULATOR/GPU.c:300 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    4596:	89 3c 83             	mov    DWORD PTR [rbx+rax*4],edi
/home/simon/prog/C/EMULATOR/GPU.c:298 (discriminator 3)
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD8:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4599:	0f 84 d1 e8 ff ff    	je     2e70 <gpu_run+0x2a20>
    459f:	4d 85 ff             	test   r15,r15
    45a2:	0f 84 b8 00 00 00    	je     4660 <gpu_run+0x4210>
    45a8:	49 83 ff 01          	cmp    r15,0x1
    45ac:	0f 84 92 00 00 00    	je     4644 <gpu_run+0x41f4>
    45b2:	49 83 ff 02          	cmp    r15,0x2
    45b6:	74 7b                	je     4633 <gpu_run+0x41e3>
    45b8:	49 83 ff 03          	cmp    r15,0x3
    45bc:	74 62                	je     4620 <gpu_run+0x41d0>
    45be:	49 83 ff 04          	cmp    r15,0x4
    45c2:	74 49                	je     460d <gpu_run+0x41bd>
    45c4:	49 83 ff 05          	cmp    r15,0x5
    45c8:	74 30                	je     45fa <gpu_run+0x41aa>
    45ca:	49 83 ff 06          	cmp    r15,0x6
    45ce:	74 17                	je     45e7 <gpu_run+0x4197>
/home/simon/prog/C/EMULATOR/GPU.c:300
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    45d0:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 45d7 <gpu_run+0x4187>
    45d7:	41 b9 00 00 00 00    	mov    r9d,0x0
    45dd:	0f b6 91 00 00 00 00 	movzx  edx,BYTE PTR [rcx+0x0]
    45e4:	89 14 8b             	mov    DWORD PTR [rbx+rcx*4],edx
    45e7:	4d 63 11             	movsxd r10,DWORD PTR [r9]
    45ea:	49 83 c1 04          	add    r9,0x4
    45ee:	45 0f b6 9a 00 00 00 	movzx  r11d,BYTE PTR [r10+0x0]
    45f5:	00 
    45f6:	46 89 1c 93          	mov    DWORD PTR [rbx+r10*4],r11d
    45fa:	4d 63 01             	movsxd r8,DWORD PTR [r9]
    45fd:	49 83 c1 04          	add    r9,0x4
    4601:	41 0f b6 b0 00 00 00 	movzx  esi,BYTE PTR [r8+0x0]
    4608:	00 
    4609:	42 89 34 83          	mov    DWORD PTR [rbx+r8*4],esi
    460d:	49 63 29             	movsxd rbp,DWORD PTR [r9]
    4610:	49 83 c1 04          	add    r9,0x4
    4614:	44 0f b6 a5 00 00 00 	movzx  r12d,BYTE PTR [rbp+0x0]
    461b:	00 
    461c:	44 89 24 ab          	mov    DWORD PTR [rbx+rbp*4],r12d
    4620:	4d 63 39             	movsxd r15,DWORD PTR [r9]
    4623:	49 83 c1 04          	add    r9,0x4
    4627:	41 0f b6 87 00 00 00 	movzx  eax,BYTE PTR [r15+0x0]
    462e:	00 
    462f:	42 89 04 bb          	mov    DWORD PTR [rbx+r15*4],eax
    4633:	49 63 39             	movsxd rdi,DWORD PTR [r9]
    4636:	49 83 c1 04          	add    r9,0x4
    463a:	0f b6 8f 00 00 00 00 	movzx  ecx,BYTE PTR [rdi+0x0]
    4641:	89 0c bb             	mov    DWORD PTR [rbx+rdi*4],ecx
    4644:	49 63 11             	movsxd rdx,DWORD PTR [r9]
    4647:	49 83 c1 04          	add    r9,0x4
/home/simon/prog/C/EMULATOR/GPU.c:298
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD8:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    464b:	4d 39 f1             	cmp    r9,r14
/home/simon/prog/C/EMULATOR/GPU.c:300
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    464e:	44 0f b6 92 00 00 00 	movzx  r10d,BYTE PTR [rdx+0x0]
    4655:	00 
    4656:	44 89 14 93          	mov    DWORD PTR [rbx+rdx*4],r10d
/home/simon/prog/C/EMULATOR/GPU.c:298
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD8:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    465a:	0f 84 10 e8 ff ff    	je     2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:300 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    4660:	4d 63 19             	movsxd r11,DWORD PTR [r9]
    4663:	49 63 69 04          	movsxd rbp,DWORD PTR [r9+0x4]
    4667:	49 83 c1 20          	add    r9,0x20
    466b:	4d 63 61 e8          	movsxd r12,DWORD PTR [r9-0x18]
    466f:	49 63 41 ec          	movsxd rax,DWORD PTR [r9-0x14]
    4673:	49 63 49 f0          	movsxd rcx,DWORD PTR [r9-0x10]
    4677:	4d 63 51 f4          	movsxd r10,DWORD PTR [r9-0xc]
    467b:	45 0f b6 83 00 00 00 	movzx  r8d,BYTE PTR [r11+0x0]
    4682:	00 
    4683:	0f b6 b5 00 00 00 00 	movzx  esi,BYTE PTR [rbp+0x0]
    468a:	45 0f b6 bc 24 00 00 	movzx  r15d,BYTE PTR [r12+0x0]
    4691:	00 00 
    4693:	0f b6 b8 00 00 00 00 	movzx  edi,BYTE PTR [rax+0x0]
    469a:	0f b6 91 00 00 00 00 	movzx  edx,BYTE PTR [rcx+0x0]
    46a1:	46 89 04 9b          	mov    DWORD PTR [rbx+r11*4],r8d
    46a5:	89 34 ab             	mov    DWORD PTR [rbx+rbp*4],esi
    46a8:	4d 63 41 f8          	movsxd r8,DWORD PTR [r9-0x8]
    46ac:	46 89 3c a3          	mov    DWORD PTR [rbx+r12*4],r15d
    46b0:	4d 63 61 fc          	movsxd r12,DWORD PTR [r9-0x4]
    46b4:	45 0f b6 9a 00 00 00 	movzx  r11d,BYTE PTR [r10+0x0]
    46bb:	00 
/home/simon/prog/C/EMULATOR/GPU.c:298 (discriminator 3)
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD8:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    46bc:	4d 39 f1             	cmp    r9,r14
/home/simon/prog/C/EMULATOR/GPU.c:300 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    46bf:	89 3c 83             	mov    DWORD PTR [rbx+rax*4],edi
    46c2:	89 14 8b             	mov    DWORD PTR [rbx+rcx*4],edx
    46c5:	41 0f b6 a8 00 00 00 	movzx  ebp,BYTE PTR [r8+0x0]
    46cc:	00 
    46cd:	41 0f b6 b4 24 00 00 	movzx  esi,BYTE PTR [r12+0x0]
    46d4:	00 00 
    46d6:	46 89 1c 93          	mov    DWORD PTR [rbx+r10*4],r11d
    46da:	42 89 2c 83          	mov    DWORD PTR [rbx+r8*4],ebp
    46de:	42 89 34 a3          	mov    DWORD PTR [rbx+r12*4],esi
/home/simon/prog/C/EMULATOR/GPU.c:298 (discriminator 3)
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD8:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    46e2:	0f 85 78 ff ff ff    	jne    4660 <gpu_run+0x4210>
    46e8:	e9 83 e7 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    46ed:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:291
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
	      		}
				break;
			case GPUOP_WR16:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    46f0:	44 8b 35 00 00 00 00 	mov    r14d,DWORD PTR [rip+0x0]        # 46f7 <gpu_run+0x42a7>
/home/simon/prog/C/EMULATOR/GPU.c:290
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
	      		}
				break;
			case GPUOP_WR16:
				cycles += 8;
    46f7:	48 83 44 24 08 08    	add    QWORD PTR [rsp+0x8],0x8
/home/simon/prog/C/EMULATOR/GPU.c:291
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    46fd:	45 85 f6             	test   r14d,r14d
    4700:	0f 8e 6a e7 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:293 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    4706:	48 63 05 00 00 00 00 	movsxd rax,DWORD PTR [rip+0x0]        # 470d <gpu_run+0x42bd>
    470d:	45 8d 4e ff          	lea    r9d,[r14-0x1]
    4711:	41 ba 00 00 00 00    	mov    r10d,0x0
    4717:	4e 8d 3c 8d 00 00 00 	lea    r15,[r9*4+0x0]
    471e:	00 
    471f:	41 83 e1 07          	and    r9d,0x7
    4723:	8b 3c 83             	mov    edi,DWORD PTR [rbx+rax*4]
/home/simon/prog/C/EMULATOR/GPU.c:291 (discriminator 3)
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
	      		}
				break;
			case GPUOP_WR16:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4726:	4d 39 d7             	cmp    r15,r10
/home/simon/prog/C/EMULATOR/GPU.c:293 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    4729:	40 88 b8 00 00 00 00 	mov    BYTE PTR [rax+0x0],dil
/home/simon/prog/C/EMULATOR/GPU.c:291 (discriminator 3)
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
	      		}
				break;
			case GPUOP_WR16:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4730:	0f 84 3a e7 ff ff    	je     2e70 <gpu_run+0x2a20>
    4736:	4d 85 c9             	test   r9,r9
    4739:	0f 84 b1 00 00 00    	je     47f0 <gpu_run+0x43a0>
    473f:	49 83 f9 01          	cmp    r9,0x1
    4743:	0f 84 8c 00 00 00    	je     47d5 <gpu_run+0x4385>
    4749:	49 83 f9 02          	cmp    r9,0x2
    474d:	74 76                	je     47c5 <gpu_run+0x4375>
    474f:	49 83 f9 03          	cmp    r9,0x3
    4753:	74 5e                	je     47b3 <gpu_run+0x4363>
    4755:	49 83 f9 04          	cmp    r9,0x4
    4759:	74 46                	je     47a1 <gpu_run+0x4351>
    475b:	49 83 f9 05          	cmp    r9,0x5
    475f:	74 2e                	je     478f <gpu_run+0x433f>
    4761:	49 83 f9 06          	cmp    r9,0x6
    4765:	74 16                	je     477d <gpu_run+0x432d>
/home/simon/prog/C/EMULATOR/GPU.c:293
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    4767:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 476e <gpu_run+0x431e>
    476e:	41 ba 00 00 00 00    	mov    r10d,0x0
    4774:	8b 14 8b             	mov    edx,DWORD PTR [rbx+rcx*4]
    4777:	88 91 00 00 00 00    	mov    BYTE PTR [rcx+0x0],dl
    477d:	4d 63 1a             	movsxd r11,DWORD PTR [r10]
    4780:	49 83 c2 04          	add    r10,0x4
    4784:	46 8b 04 9b          	mov    r8d,DWORD PTR [rbx+r11*4]
    4788:	45 88 83 00 00 00 00 	mov    BYTE PTR [r11+0x0],r8b
    478f:	49 63 2a             	movsxd rbp,DWORD PTR [r10]
    4792:	49 83 c2 04          	add    r10,0x4
    4796:	44 8b 24 ab          	mov    r12d,DWORD PTR [rbx+rbp*4]
    479a:	44 88 a5 00 00 00 00 	mov    BYTE PTR [rbp+0x0],r12b
    47a1:	4d 63 32             	movsxd r14,DWORD PTR [r10]
    47a4:	49 83 c2 04          	add    r10,0x4
    47a8:	42 8b 34 b3          	mov    esi,DWORD PTR [rbx+r14*4]
    47ac:	41 88 b6 00 00 00 00 	mov    BYTE PTR [r14+0x0],sil
    47b3:	4d 63 0a             	movsxd r9,DWORD PTR [r10]
    47b6:	49 83 c2 04          	add    r10,0x4
    47ba:	42 8b 04 8b          	mov    eax,DWORD PTR [rbx+r9*4]
    47be:	41 88 81 00 00 00 00 	mov    BYTE PTR [r9+0x0],al
    47c5:	49 63 3a             	movsxd rdi,DWORD PTR [r10]
    47c8:	49 83 c2 04          	add    r10,0x4
    47cc:	8b 0c bb             	mov    ecx,DWORD PTR [rbx+rdi*4]
    47cf:	88 8f 00 00 00 00    	mov    BYTE PTR [rdi+0x0],cl
    47d5:	49 63 12             	movsxd rdx,DWORD PTR [r10]
    47d8:	49 83 c2 04          	add    r10,0x4
/home/simon/prog/C/EMULATOR/GPU.c:291
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
	      		}
				break;
			case GPUOP_WR16:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    47dc:	4d 39 d7             	cmp    r15,r10
/home/simon/prog/C/EMULATOR/GPU.c:293
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    47df:	44 8b 1c 93          	mov    r11d,DWORD PTR [rbx+rdx*4]
    47e3:	44 88 9a 00 00 00 00 	mov    BYTE PTR [rdx+0x0],r11b
/home/simon/prog/C/EMULATOR/GPU.c:291
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
	      		}
				break;
			case GPUOP_WR16:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    47ea:	0f 84 80 e6 ff ff    	je     2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:293 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    47f0:	4d 63 02             	movsxd r8,DWORD PTR [r10]
    47f3:	4d 63 62 04          	movsxd r12,DWORD PTR [r10+0x4]
    47f7:	49 83 c2 20          	add    r10,0x20
    47fb:	4d 63 4a e8          	movsxd r9,DWORD PTR [r10-0x18]
    47ff:	49 63 42 ec          	movsxd rax,DWORD PTR [r10-0x14]
    4803:	49 63 4a f0          	movsxd rcx,DWORD PTR [r10-0x10]
    4807:	4d 63 5a f4          	movsxd r11,DWORD PTR [r10-0xc]
    480b:	42 8b 2c 83          	mov    ebp,DWORD PTR [rbx+r8*4]
    480f:	46 8b 34 a3          	mov    r14d,DWORD PTR [rbx+r12*4]
    4813:	42 8b 34 8b          	mov    esi,DWORD PTR [rbx+r9*4]
    4817:	8b 3c 83             	mov    edi,DWORD PTR [rbx+rax*4]
    481a:	8b 14 8b             	mov    edx,DWORD PTR [rbx+rcx*4]
    481d:	41 88 a8 00 00 00 00 	mov    BYTE PTR [r8+0x0],bpl
    4824:	45 88 b4 24 00 00 00 	mov    BYTE PTR [r12+0x0],r14b
    482b:	00 
    482c:	49 63 6a f8          	movsxd rbp,DWORD PTR [r10-0x8]
    4830:	4d 63 72 fc          	movsxd r14,DWORD PTR [r10-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:291 (discriminator 3)
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
	      		}
				break;
			case GPUOP_WR16:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4834:	4d 39 d7             	cmp    r15,r10
/home/simon/prog/C/EMULATOR/GPU.c:293 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
    4837:	41 88 b1 00 00 00 00 	mov    BYTE PTR [r9+0x0],sil
    483e:	46 8b 04 9b          	mov    r8d,DWORD PTR [rbx+r11*4]
    4842:	40 88 b8 00 00 00 00 	mov    BYTE PTR [rax+0x0],dil
    4849:	88 91 00 00 00 00    	mov    BYTE PTR [rcx+0x0],dl
    484f:	44 8b 24 ab          	mov    r12d,DWORD PTR [rbx+rbp*4]
    4853:	46 8b 0c b3          	mov    r9d,DWORD PTR [rbx+r14*4]
    4857:	45 88 83 00 00 00 00 	mov    BYTE PTR [r11+0x0],r8b
    485e:	44 88 a5 00 00 00 00 	mov    BYTE PTR [rbp+0x0],r12b
    4865:	45 88 8e 00 00 00 00 	mov    BYTE PTR [r14+0x0],r9b
/home/simon/prog/C/EMULATOR/GPU.c:291 (discriminator 3)
	        		memory[indx] = (uint8_t)A[indx].i;//TODO: figure out how to calculate addresses here
	      		}
				break;
			case GPUOP_WR16:
				cycles += 8;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    486c:	75 82                	jne    47f0 <gpu_run+0x43a0>
    486e:	e9 fd e5 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    4873:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:305
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD16:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4878:	8b 2d 00 00 00 00    	mov    ebp,DWORD PTR [rip+0x0]        # 487e <gpu_run+0x442e>
/home/simon/prog/C/EMULATOR/GPU.c:304
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD16:
				cycles += 2;
    487e:	48 83 44 24 08 02    	add    QWORD PTR [rsp+0x8],0x2
/home/simon/prog/C/EMULATOR/GPU.c:305
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4884:	85 ed                	test   ebp,ebp
    4886:	0f 8e e4 e5 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:307 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    488c:	4c 63 35 00 00 00 00 	movsxd r14,DWORD PTR [rip+0x0]        # 4893 <gpu_run+0x4443>
    4893:	44 8d 7d ff          	lea    r15d,[rbp-0x1]
    4897:	b8 00 00 00 00       	mov    eax,0x0
    489c:	4e 8d 24 bd 00 00 00 	lea    r12,[r15*4+0x0]
    48a3:	00 
    48a4:	41 83 e7 07          	and    r15d,0x7
    48a8:	41 0f b6 be 00 00 00 	movzx  edi,BYTE PTR [r14+0x0]
    48af:	00 
/home/simon/prog/C/EMULATOR/GPU.c:305 (discriminator 3)
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD16:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    48b0:	4c 39 e0             	cmp    rax,r12
/home/simon/prog/C/EMULATOR/GPU.c:307 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    48b3:	42 89 3c b3          	mov    DWORD PTR [rbx+r14*4],edi
/home/simon/prog/C/EMULATOR/GPU.c:305 (discriminator 3)
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD16:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    48b7:	0f 84 b3 e5 ff ff    	je     2e70 <gpu_run+0x2a20>
    48bd:	4d 85 ff             	test   r15,r15
    48c0:	0f 84 ba 00 00 00    	je     4980 <gpu_run+0x4530>
    48c6:	49 83 ff 01          	cmp    r15,0x1
    48ca:	0f 84 91 00 00 00    	je     4961 <gpu_run+0x4511>
    48d0:	49 83 ff 02          	cmp    r15,0x2
    48d4:	74 7a                	je     4950 <gpu_run+0x4500>
    48d6:	49 83 ff 03          	cmp    r15,0x3
    48da:	74 61                	je     493d <gpu_run+0x44ed>
    48dc:	49 83 ff 04          	cmp    r15,0x4
    48e0:	74 48                	je     492a <gpu_run+0x44da>
    48e2:	49 83 ff 05          	cmp    r15,0x5
    48e6:	74 2f                	je     4917 <gpu_run+0x44c7>
    48e8:	49 83 ff 06          	cmp    r15,0x6
    48ec:	74 16                	je     4904 <gpu_run+0x44b4>
/home/simon/prog/C/EMULATOR/GPU.c:307
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    48ee:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 48f5 <gpu_run+0x44a5>
    48f5:	b8 00 00 00 00       	mov    eax,0x0
    48fa:	0f b6 91 00 00 00 00 	movzx  edx,BYTE PTR [rcx+0x0]
    4901:	89 14 8b             	mov    DWORD PTR [rbx+rcx*4],edx
    4904:	4c 63 08             	movsxd r9,DWORD PTR [rax]
    4907:	48 83 c0 04          	add    rax,0x4
    490b:	41 0f b6 b1 00 00 00 	movzx  esi,BYTE PTR [r9+0x0]
    4912:	00 
    4913:	42 89 34 8b          	mov    DWORD PTR [rbx+r9*4],esi
    4917:	4c 63 10             	movsxd r10,DWORD PTR [rax]
    491a:	48 83 c0 04          	add    rax,0x4
    491e:	45 0f b6 9a 00 00 00 	movzx  r11d,BYTE PTR [r10+0x0]
    4925:	00 
    4926:	46 89 1c 93          	mov    DWORD PTR [rbx+r10*4],r11d
    492a:	4c 63 00             	movsxd r8,DWORD PTR [rax]
    492d:	48 83 c0 04          	add    rax,0x4
    4931:	41 0f b6 a8 00 00 00 	movzx  ebp,BYTE PTR [r8+0x0]
    4938:	00 
    4939:	42 89 2c 83          	mov    DWORD PTR [rbx+r8*4],ebp
    493d:	4c 63 38             	movsxd r15,DWORD PTR [rax]
    4940:	48 83 c0 04          	add    rax,0x4
    4944:	45 0f b6 b7 00 00 00 	movzx  r14d,BYTE PTR [r15+0x0]
    494b:	00 
    494c:	46 89 34 bb          	mov    DWORD PTR [rbx+r15*4],r14d
    4950:	48 63 38             	movsxd rdi,DWORD PTR [rax]
    4953:	48 83 c0 04          	add    rax,0x4
    4957:	0f b6 8f 00 00 00 00 	movzx  ecx,BYTE PTR [rdi+0x0]
    495e:	89 0c bb             	mov    DWORD PTR [rbx+rdi*4],ecx
    4961:	48 63 10             	movsxd rdx,DWORD PTR [rax]
    4964:	48 83 c0 04          	add    rax,0x4
/home/simon/prog/C/EMULATOR/GPU.c:305
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD16:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4968:	4c 39 e0             	cmp    rax,r12
/home/simon/prog/C/EMULATOR/GPU.c:307
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    496b:	44 0f b6 8a 00 00 00 	movzx  r9d,BYTE PTR [rdx+0x0]
    4972:	00 
    4973:	44 89 0c 93          	mov    DWORD PTR [rbx+rdx*4],r9d
/home/simon/prog/C/EMULATOR/GPU.c:305
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD16:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4977:	0f 84 f3 e4 ff ff    	je     2e70 <gpu_run+0x2a20>
    497d:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:307 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    4980:	4c 63 10             	movsxd r10,DWORD PTR [rax]
    4983:	4c 63 58 04          	movsxd r11,DWORD PTR [rax+0x4]
    4987:	48 83 c0 20          	add    rax,0x20
    498b:	48 63 68 e8          	movsxd rbp,DWORD PTR [rax-0x18]
    498f:	4c 63 70 ec          	movsxd r14,DWORD PTR [rax-0x14]
    4993:	48 63 48 f0          	movsxd rcx,DWORD PTR [rax-0x10]
    4997:	4c 63 48 f4          	movsxd r9,DWORD PTR [rax-0xc]
    499b:	41 0f b6 b2 00 00 00 	movzx  esi,BYTE PTR [r10+0x0]
    49a2:	00 
    49a3:	45 0f b6 83 00 00 00 	movzx  r8d,BYTE PTR [r11+0x0]
    49aa:	00 
    49ab:	44 0f b6 bd 00 00 00 	movzx  r15d,BYTE PTR [rbp+0x0]
    49b2:	00 
    49b3:	41 0f b6 be 00 00 00 	movzx  edi,BYTE PTR [r14+0x0]
    49ba:	00 
    49bb:	0f b6 91 00 00 00 00 	movzx  edx,BYTE PTR [rcx+0x0]
    49c2:	42 89 34 93          	mov    DWORD PTR [rbx+r10*4],esi
    49c6:	46 89 04 9b          	mov    DWORD PTR [rbx+r11*4],r8d
    49ca:	4c 63 58 f8          	movsxd r11,DWORD PTR [rax-0x8]
    49ce:	4c 63 40 fc          	movsxd r8,DWORD PTR [rax-0x4]
/home/simon/prog/C/EMULATOR/GPU.c:305 (discriminator 3)
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD16:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    49d2:	4c 39 e0             	cmp    rax,r12
/home/simon/prog/C/EMULATOR/GPU.c:307 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
    49d5:	44 89 3c ab          	mov    DWORD PTR [rbx+rbp*4],r15d
    49d9:	45 0f b6 91 00 00 00 	movzx  r10d,BYTE PTR [r9+0x0]
    49e0:	00 
    49e1:	42 89 3c b3          	mov    DWORD PTR [rbx+r14*4],edi
    49e5:	89 14 8b             	mov    DWORD PTR [rbx+rcx*4],edx
    49e8:	41 0f b6 b3 00 00 00 	movzx  esi,BYTE PTR [r11+0x0]
    49ef:	00 
    49f0:	41 0f b6 a8 00 00 00 	movzx  ebp,BYTE PTR [r8+0x0]
    49f7:	00 
    49f8:	46 89 14 8b          	mov    DWORD PTR [rbx+r9*4],r10d
    49fc:	42 89 34 9b          	mov    DWORD PTR [rbx+r11*4],esi
    4a00:	42 89 2c 83          	mov    DWORD PTR [rbx+r8*4],ebp
/home/simon/prog/C/EMULATOR/GPU.c:305 (discriminator 3)
					A[indx].i = (uint32_t)memory[indx];//TODO: figure out how to calculate addresses here
				}
				break;
			case GPUOP_RD16:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4a04:	0f 85 76 ff ff ff    	jne    4980 <gpu_run+0x4530>
    4a0a:	e9 61 e4 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    4a0f:	90                   	nop
/home/simon/prog/C/EMULATOR/GPU.c:263
					A[indx].i = B[indx].i ^ C[indx].i;
	      		}
				break;
			case GPUOP_CMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4a10:	44 8b 05 00 00 00 00 	mov    r8d,DWORD PTR [rip+0x0]        # 4a17 <gpu_run+0x45c7>
/home/simon/prog/C/EMULATOR/GPU.c:262
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i ^ C[indx].i;
	      		}
				break;
			case GPUOP_CMP:
				cycles += 2;
    4a17:	48 83 44 24 08 02    	add    QWORD PTR [rsp+0x8],0x2
/home/simon/prog/C/EMULATOR/GPU.c:263
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4a1d:	45 85 c0             	test   r8d,r8d
    4a20:	0f 8e 4a e4 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:265
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i < C[indx].i ? -1 : (B[indx].i > C[indx].i ? 1 : 0);
    4a26:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 4a2d <gpu_run+0x45dd>
    4a2d:	45 8d 50 ff          	lea    r10d,[r8-0x1]
    4a31:	45 31 db             	xor    r11d,r11d
    4a34:	bf ff ff ff ff       	mov    edi,0xffffffff
    4a39:	4e 8d 0c 95 00 00 00 	lea    r9,[r10*4+0x0]
    4a40:	00 
    4a41:	41 83 e2 03          	and    r10d,0x3
    4a45:	48 c1 e1 02          	shl    rcx,0x2
    4a49:	44 8b bc 11 00 00 00 	mov    r15d,DWORD PTR [rcx+rdx*1+0x0]
    4a50:	00 
    4a51:	44 8b b4 31 00 00 00 	mov    r14d,DWORD PTR [rcx+rsi*1+0x0]
    4a58:	00 
    4a59:	45 39 f7             	cmp    r15d,r14d
    4a5c:	41 0f 97 c3          	seta   r11b
    4a60:	44 0f 42 df          	cmovb  r11d,edi
    4a64:	44 89 9c 01 00 00 00 	mov    DWORD PTR [rcx+rax*1+0x0],r11d
    4a6b:	00 
    4a6c:	b9 00 00 00 00       	mov    ecx,0x0
/home/simon/prog/C/EMULATOR/GPU.c:263
					A[indx].i = B[indx].i ^ C[indx].i;
	      		}
				break;
			case GPUOP_CMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4a71:	49 39 c9             	cmp    r9,rcx
    4a74:	0f 84 f6 e3 ff ff    	je     2e70 <gpu_run+0x2a20>
    4a7a:	4d 85 d2             	test   r10,r10
    4a7d:	0f 84 ad 00 00 00    	je     4b30 <gpu_run+0x46e0>
    4a83:	49 83 fa 01          	cmp    r10,0x1
    4a87:	74 6a                	je     4af3 <gpu_run+0x46a3>
    4a89:	49 83 fa 02          	cmp    r10,0x2
    4a8d:	74 33                	je     4ac2 <gpu_run+0x4672>
/home/simon/prog/C/EMULATOR/GPU.c:265
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i < C[indx].i ? -1 : (B[indx].i > C[indx].i ? 1 : 0);
    4a8f:	4c 63 05 00 00 00 00 	movsxd r8,DWORD PTR [rip+0x0]        # 4a96 <gpu_run+0x4646>
    4a96:	31 c9                	xor    ecx,ecx
    4a98:	49 c1 e0 02          	shl    r8,0x2
    4a9c:	46 8b 94 02 00 00 00 	mov    r10d,DWORD PTR [rdx+r8*1+0x0]
    4aa3:	00 
    4aa4:	46 8b bc 06 00 00 00 	mov    r15d,DWORD PTR [rsi+r8*1+0x0]
    4aab:	00 
    4aac:	45 39 fa             	cmp    r10d,r15d
    4aaf:	0f 97 c1             	seta   cl
    4ab2:	0f 42 cf             	cmovb  ecx,edi
    4ab5:	42 89 8c 00 00 00 00 	mov    DWORD PTR [rax+r8*1+0x0],ecx
    4abc:	00 
    4abd:	b9 00 00 00 00       	mov    ecx,0x0
    4ac2:	4c 63 01             	movsxd r8,DWORD PTR [rcx]
    4ac5:	45 31 db             	xor    r11d,r11d
    4ac8:	49 c1 e0 02          	shl    r8,0x2
    4acc:	46 8b 94 02 00 00 00 	mov    r10d,DWORD PTR [rdx+r8*1+0x0]
    4ad3:	00 
    4ad4:	46 8b b4 06 00 00 00 	mov    r14d,DWORD PTR [rsi+r8*1+0x0]
    4adb:	00 
    4adc:	45 39 f2             	cmp    r10d,r14d
    4adf:	41 0f 97 c3          	seta   r11b
    4ae3:	44 0f 42 df          	cmovb  r11d,edi
    4ae7:	48 83 c1 04          	add    rcx,0x4
    4aeb:	46 89 9c 00 00 00 00 	mov    DWORD PTR [rax+r8*1+0x0],r11d
    4af2:	00 
    4af3:	4c 63 39             	movsxd r15,DWORD PTR [rcx]
    4af6:	49 c1 e7 02          	shl    r15,0x2
    4afa:	46 8b 84 3a 00 00 00 	mov    r8d,DWORD PTR [rdx+r15*1+0x0]
    4b01:	00 
    4b02:	42 8b b4 3e 00 00 00 	mov    esi,DWORD PTR [rsi+r15*1+0x0]
    4b09:	00 
    4b0a:	31 d2                	xor    edx,edx
    4b0c:	41 39 f0             	cmp    r8d,esi
    4b0f:	0f 97 c2             	seta   dl
    4b12:	0f 42 d7             	cmovb  edx,edi
    4b15:	48 83 c1 04          	add    rcx,0x4
/home/simon/prog/C/EMULATOR/GPU.c:263
					A[indx].i = B[indx].i ^ C[indx].i;
	      		}
				break;
			case GPUOP_CMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4b19:	49 39 c9             	cmp    r9,rcx
/home/simon/prog/C/EMULATOR/GPU.c:265
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i < C[indx].i ? -1 : (B[indx].i > C[indx].i ? 1 : 0);
    4b1c:	42 89 94 38 00 00 00 	mov    DWORD PTR [rax+r15*1+0x0],edx
    4b23:	00 
/home/simon/prog/C/EMULATOR/GPU.c:263
					A[indx].i = B[indx].i ^ C[indx].i;
	      		}
				break;
			case GPUOP_CMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4b24:	0f 84 46 e3 ff ff    	je     2e70 <gpu_run+0x2a20>
    4b2a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:265
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i < C[indx].i ? -1 : (B[indx].i > C[indx].i ? 1 : 0);
    4b30:	48 63 01             	movsxd rax,DWORD PTR [rcx]
    4b33:	4c 63 79 04          	movsxd r15,DWORD PTR [rcx+0x4]
    4b37:	45 31 db             	xor    r11d,r11d
    4b3a:	44 8b 54 85 00       	mov    r10d,DWORD PTR [rbp+rax*4+0x0]
    4b3f:	45 8b 34 84          	mov    r14d,DWORD PTR [r12+rax*4]
    4b43:	45 39 f2             	cmp    r10d,r14d
    4b46:	41 0f 97 c3          	seta   r11b
    4b4a:	44 0f 42 df          	cmovb  r11d,edi
    4b4e:	31 d2                	xor    edx,edx
    4b50:	44 89 1c 83          	mov    DWORD PTR [rbx+rax*4],r11d
    4b54:	46 8b 44 bd 00       	mov    r8d,DWORD PTR [rbp+r15*4+0x0]
    4b59:	43 8b 34 bc          	mov    esi,DWORD PTR [r12+r15*4]
    4b5d:	48 63 41 08          	movsxd rax,DWORD PTR [rcx+0x8]
    4b61:	41 39 f0             	cmp    r8d,esi
    4b64:	0f 97 c2             	seta   dl
    4b67:	0f 42 d7             	cmovb  edx,edi
    4b6a:	45 31 db             	xor    r11d,r11d
    4b6d:	42 89 14 bb          	mov    DWORD PTR [rbx+r15*4],edx
    4b71:	44 8b 54 85 00       	mov    r10d,DWORD PTR [rbp+rax*4+0x0]
    4b76:	45 8b 34 84          	mov    r14d,DWORD PTR [r12+rax*4]
    4b7a:	4c 63 79 0c          	movsxd r15,DWORD PTR [rcx+0xc]
    4b7e:	45 39 f2             	cmp    r10d,r14d
    4b81:	41 0f 97 c3          	seta   r11b
    4b85:	44 0f 42 df          	cmovb  r11d,edi
    4b89:	31 d2                	xor    edx,edx
    4b8b:	44 89 1c 83          	mov    DWORD PTR [rbx+rax*4],r11d
    4b8f:	46 8b 44 bd 00       	mov    r8d,DWORD PTR [rbp+r15*4+0x0]
    4b94:	43 8b 34 bc          	mov    esi,DWORD PTR [r12+r15*4]
    4b98:	41 39 f0             	cmp    r8d,esi
    4b9b:	0f 97 c2             	seta   dl
    4b9e:	0f 42 d7             	cmovb  edx,edi
    4ba1:	48 83 c1 10          	add    rcx,0x10
/home/simon/prog/C/EMULATOR/GPU.c:263
					A[indx].i = B[indx].i ^ C[indx].i;
	      		}
				break;
			case GPUOP_CMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4ba5:	49 39 c9             	cmp    r9,rcx
/home/simon/prog/C/EMULATOR/GPU.c:265
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i < C[indx].i ? -1 : (B[indx].i > C[indx].i ? 1 : 0);
    4ba8:	42 89 14 bb          	mov    DWORD PTR [rbx+r15*4],edx
/home/simon/prog/C/EMULATOR/GPU.c:263
					A[indx].i = B[indx].i ^ C[indx].i;
	      		}
				break;
			case GPUOP_CMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4bac:	75 82                	jne    4b30 <gpu_run+0x46e0>
    4bae:	e9 bd e2 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    4bb3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:256
					A[indx].i = B[indx].i | C[indx].i;
	      		}
				break;
			case GPUOP_XOR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4bb8:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 4bbe <gpu_run+0x476e>
/home/simon/prog/C/EMULATOR/GPU.c:255
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i | C[indx].i;
	      		}
				break;
			case GPUOP_XOR:
				cycles += 1;
    4bbe:	48 83 44 24 08 01    	add    QWORD PTR [rsp+0x8],0x1
/home/simon/prog/C/EMULATOR/GPU.c:256
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4bc4:	85 ff                	test   edi,edi
    4bc6:	0f 8e a4 e2 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:258 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i ^ C[indx].i;
    4bcc:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 4bd3 <gpu_run+0x4783>
    4bd3:	44 8d 4f ff          	lea    r9d,[rdi-0x1]
    4bd7:	41 b8 00 00 00 00    	mov    r8d,0x0
    4bdd:	4e 8d 34 8d 00 00 00 	lea    r14,[r9*4+0x0]
    4be4:	00 
    4be5:	41 83 e1 07          	and    r9d,0x7
    4be9:	48 c1 e1 02          	shl    rcx,0x2
    4bed:	44 8b 94 11 00 00 00 	mov    r10d,DWORD PTR [rcx+rdx*1+0x0]
    4bf4:	00 
    4bf5:	44 33 94 31 00 00 00 	xor    r10d,DWORD PTR [rcx+rsi*1+0x0]
    4bfc:	00 
/home/simon/prog/C/EMULATOR/GPU.c:256 (discriminator 3)
					A[indx].i = B[indx].i | C[indx].i;
	      		}
				break;
			case GPUOP_XOR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4bfd:	4d 39 c6             	cmp    r14,r8
/home/simon/prog/C/EMULATOR/GPU.c:258 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i ^ C[indx].i;
    4c00:	44 89 94 01 00 00 00 	mov    DWORD PTR [rcx+rax*1+0x0],r10d
    4c07:	00 
/home/simon/prog/C/EMULATOR/GPU.c:256 (discriminator 3)
					A[indx].i = B[indx].i | C[indx].i;
	      		}
				break;
			case GPUOP_XOR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4c08:	0f 84 62 e2 ff ff    	je     2e70 <gpu_run+0x2a20>
    4c0e:	4d 85 c9             	test   r9,r9
    4c11:	0f 84 39 01 00 00    	je     4d50 <gpu_run+0x4900>
    4c17:	49 83 f9 01          	cmp    r9,0x1
    4c1b:	0f 84 fe 00 00 00    	je     4d1f <gpu_run+0x48cf>
    4c21:	49 83 f9 02          	cmp    r9,0x2
    4c25:	0f 84 d1 00 00 00    	je     4cfc <gpu_run+0x48ac>
    4c2b:	49 83 f9 03          	cmp    r9,0x3
    4c2f:	0f 84 a4 00 00 00    	je     4cd9 <gpu_run+0x4889>
    4c35:	49 83 f9 04          	cmp    r9,0x4
    4c39:	74 7b                	je     4cb6 <gpu_run+0x4866>
    4c3b:	49 83 f9 05          	cmp    r9,0x5
    4c3f:	74 52                	je     4c93 <gpu_run+0x4843>
    4c41:	49 83 f9 06          	cmp    r9,0x6
    4c45:	74 29                	je     4c70 <gpu_run+0x4820>
/home/simon/prog/C/EMULATOR/GPU.c:258
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i ^ C[indx].i;
    4c47:	4c 63 1d 00 00 00 00 	movsxd r11,DWORD PTR [rip+0x0]        # 4c4e <gpu_run+0x47fe>
    4c4e:	41 b8 00 00 00 00    	mov    r8d,0x0
    4c54:	49 c1 e3 02          	shl    r11,0x2
    4c58:	46 8b bc 1a 00 00 00 	mov    r15d,DWORD PTR [rdx+r11*1+0x0]
    4c5f:	00 
    4c60:	46 33 bc 1e 00 00 00 	xor    r15d,DWORD PTR [rsi+r11*1+0x0]
    4c67:	00 
    4c68:	46 89 bc 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],r15d
    4c6f:	00 
    4c70:	49 63 38             	movsxd rdi,DWORD PTR [r8]
    4c73:	49 83 c0 04          	add    r8,0x4
    4c77:	48 c1 e7 02          	shl    rdi,0x2
    4c7b:	44 8b 8c 3a 00 00 00 	mov    r9d,DWORD PTR [rdx+rdi*1+0x0]
    4c82:	00 
    4c83:	44 33 8c 3e 00 00 00 	xor    r9d,DWORD PTR [rsi+rdi*1+0x0]
    4c8a:	00 
    4c8b:	44 89 8c 38 00 00 00 	mov    DWORD PTR [rax+rdi*1+0x0],r9d
    4c92:	00 
    4c93:	49 63 08             	movsxd rcx,DWORD PTR [r8]
    4c96:	49 83 c0 04          	add    r8,0x4
    4c9a:	48 c1 e1 02          	shl    rcx,0x2
    4c9e:	44 8b 94 0a 00 00 00 	mov    r10d,DWORD PTR [rdx+rcx*1+0x0]
    4ca5:	00 
    4ca6:	44 33 94 0e 00 00 00 	xor    r10d,DWORD PTR [rsi+rcx*1+0x0]
    4cad:	00 
    4cae:	44 89 94 08 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],r10d
    4cb5:	00 
    4cb6:	4d 63 18             	movsxd r11,DWORD PTR [r8]
    4cb9:	49 83 c0 04          	add    r8,0x4
    4cbd:	49 c1 e3 02          	shl    r11,0x2
    4cc1:	46 8b bc 1a 00 00 00 	mov    r15d,DWORD PTR [rdx+r11*1+0x0]
    4cc8:	00 
    4cc9:	46 33 bc 1e 00 00 00 	xor    r15d,DWORD PTR [rsi+r11*1+0x0]
    4cd0:	00 
    4cd1:	46 89 bc 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],r15d
    4cd8:	00 
    4cd9:	49 63 38             	movsxd rdi,DWORD PTR [r8]
    4cdc:	49 83 c0 04          	add    r8,0x4
    4ce0:	48 c1 e7 02          	shl    rdi,0x2
    4ce4:	44 8b 8c 3a 00 00 00 	mov    r9d,DWORD PTR [rdx+rdi*1+0x0]
    4ceb:	00 
    4cec:	44 33 8c 3e 00 00 00 	xor    r9d,DWORD PTR [rsi+rdi*1+0x0]
    4cf3:	00 
    4cf4:	44 89 8c 38 00 00 00 	mov    DWORD PTR [rax+rdi*1+0x0],r9d
    4cfb:	00 
    4cfc:	49 63 08             	movsxd rcx,DWORD PTR [r8]
    4cff:	49 83 c0 04          	add    r8,0x4
    4d03:	48 c1 e1 02          	shl    rcx,0x2
    4d07:	44 8b 94 0a 00 00 00 	mov    r10d,DWORD PTR [rdx+rcx*1+0x0]
    4d0e:	00 
    4d0f:	44 33 94 0e 00 00 00 	xor    r10d,DWORD PTR [rsi+rcx*1+0x0]
    4d16:	00 
    4d17:	44 89 94 08 00 00 00 	mov    DWORD PTR [rax+rcx*1+0x0],r10d
    4d1e:	00 
    4d1f:	4d 63 18             	movsxd r11,DWORD PTR [r8]
    4d22:	49 83 c0 04          	add    r8,0x4
    4d26:	49 c1 e3 02          	shl    r11,0x2
    4d2a:	42 8b 94 1a 00 00 00 	mov    edx,DWORD PTR [rdx+r11*1+0x0]
    4d31:	00 
    4d32:	42 33 94 1e 00 00 00 	xor    edx,DWORD PTR [rsi+r11*1+0x0]
    4d39:	00 
/home/simon/prog/C/EMULATOR/GPU.c:256
					A[indx].i = B[indx].i | C[indx].i;
	      		}
				break;
			case GPUOP_XOR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4d3a:	4d 39 c6             	cmp    r14,r8
/home/simon/prog/C/EMULATOR/GPU.c:258
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i ^ C[indx].i;
    4d3d:	42 89 94 18 00 00 00 	mov    DWORD PTR [rax+r11*1+0x0],edx
    4d44:	00 
/home/simon/prog/C/EMULATOR/GPU.c:256
					A[indx].i = B[indx].i | C[indx].i;
	      		}
				break;
			case GPUOP_XOR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4d45:	0f 84 25 e1 ff ff    	je     2e70 <gpu_run+0x2a20>
    4d4b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:258 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i ^ C[indx].i;
    4d50:	49 63 00             	movsxd rax,DWORD PTR [r8]
    4d53:	4d 63 78 04          	movsxd r15,DWORD PTR [r8+0x4]
    4d57:	49 83 c0 20          	add    r8,0x20
    4d5b:	4d 63 48 e8          	movsxd r9,DWORD PTR [r8-0x18]
    4d5f:	4d 63 50 ec          	movsxd r10,DWORD PTR [r8-0x14]
    4d63:	8b 74 85 00          	mov    esi,DWORD PTR [rbp+rax*4+0x0]
    4d67:	41 33 34 84          	xor    esi,DWORD PTR [r12+rax*4]
    4d6b:	89 34 83             	mov    DWORD PTR [rbx+rax*4],esi
    4d6e:	42 8b 7c bd 00       	mov    edi,DWORD PTR [rbp+r15*4+0x0]
    4d73:	43 33 3c bc          	xor    edi,DWORD PTR [r12+r15*4]
    4d77:	49 63 40 f0          	movsxd rax,DWORD PTR [r8-0x10]
    4d7b:	49 63 70 f4          	movsxd rsi,DWORD PTR [r8-0xc]
    4d7f:	42 89 3c bb          	mov    DWORD PTR [rbx+r15*4],edi
    4d83:	42 8b 4c 8d 00       	mov    ecx,DWORD PTR [rbp+r9*4+0x0]
    4d88:	43 33 0c 8c          	xor    ecx,DWORD PTR [r12+r9*4]
    4d8c:	49 63 78 f8          	movsxd rdi,DWORD PTR [r8-0x8]
    4d90:	42 89 0c 8b          	mov    DWORD PTR [rbx+r9*4],ecx
    4d94:	46 8b 5c 95 00       	mov    r11d,DWORD PTR [rbp+r10*4+0x0]
    4d99:	47 33 1c 94          	xor    r11d,DWORD PTR [r12+r10*4]
    4d9d:	49 63 48 fc          	movsxd rcx,DWORD PTR [r8-0x4]
    4da1:	46 89 1c 93          	mov    DWORD PTR [rbx+r10*4],r11d
    4da5:	8b 54 85 00          	mov    edx,DWORD PTR [rbp+rax*4+0x0]
    4da9:	41 33 14 84          	xor    edx,DWORD PTR [r12+rax*4]
    4dad:	89 14 83             	mov    DWORD PTR [rbx+rax*4],edx
    4db0:	44 8b 7c b5 00       	mov    r15d,DWORD PTR [rbp+rsi*4+0x0]
    4db5:	45 33 3c b4          	xor    r15d,DWORD PTR [r12+rsi*4]
    4db9:	44 89 3c b3          	mov    DWORD PTR [rbx+rsi*4],r15d
    4dbd:	44 8b 4c bd 00       	mov    r9d,DWORD PTR [rbp+rdi*4+0x0]
    4dc2:	45 33 0c bc          	xor    r9d,DWORD PTR [r12+rdi*4]
    4dc6:	44 89 0c bb          	mov    DWORD PTR [rbx+rdi*4],r9d
    4dca:	44 8b 54 8d 00       	mov    r10d,DWORD PTR [rbp+rcx*4+0x0]
    4dcf:	45 33 14 8c          	xor    r10d,DWORD PTR [r12+rcx*4]
/home/simon/prog/C/EMULATOR/GPU.c:256 (discriminator 3)
					A[indx].i = B[indx].i | C[indx].i;
	      		}
				break;
			case GPUOP_XOR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4dd3:	4d 39 c6             	cmp    r14,r8
/home/simon/prog/C/EMULATOR/GPU.c:258 (discriminator 3)
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].i ^ C[indx].i;
    4dd6:	44 89 14 8b          	mov    DWORD PTR [rbx+rcx*4],r10d
/home/simon/prog/C/EMULATOR/GPU.c:256 (discriminator 3)
					A[indx].i = B[indx].i | C[indx].i;
	      		}
				break;
			case GPUOP_XOR:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    4dda:	0f 85 70 ff ff ff    	jne    4d50 <gpu_run+0x4900>
    4de0:	e9 8b e0 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    4de5:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:269
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i < C[indx].i ? -1 : (B[indx].i > C[indx].i ? 1 : 0);
	      		}
				break;
			case GPUOP_END:
				cycles += 1+numThreadsRunning-GPU_ACTIVE_THREADS;
    4de8:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # 4dee <gpu_run+0x499e>
    4dee:	29 5c 24 34          	sub    DWORD PTR [rsp+0x34],ebx
    4df2:	8b 7c 24 34          	mov    edi,DWORD PTR [rsp+0x34]
    4df6:	83 c7 01             	add    edi,0x1
    4df9:	48 01 7c 24 08       	add    QWORD PTR [rsp+0x8],rdi
/home/simon/prog/C/EMULATOR/GPU.c:270
				if(NEXT_EXEC_SPAN == 0) {
    4dfe:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 4e05 <gpu_run+0x49b5>
    4e05:	48 85 ff             	test   rdi,rdi
    4e08:	0f 84 f1 b7 ff ff    	je     5ff <gpu_run+0x1af>
mergeNextSpan():
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
    4e0e:	8b 47 0c             	mov    eax,DWORD PTR [rdi+0xc]
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:277
					GPU_EXIT_PC = currentPC;
					GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_ENDOP;
					numThreadsRunning = 0;
				} else {
					numThreadsRunning -= GPU_ACTIVE_THREADS;
					GPU_ACTIVE_THREADS = 0;
    4e11:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 4e1b <gpu_run+0x49cb>
    4e18:	00 00 00 
    4e1b:	41 bb 00 00 00 00    	mov    r11d,0x0
/home/simon/prog/C/EMULATOR/GPU.c:278
					currentPC = NEXT_EXEC_SPAN->PC;
    4e21:	44 8b 6f 08          	mov    r13d,DWORD PTR [rdi+0x8]
mergeNextSpan():
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
    4e25:	41 ba 01 00 00 00    	mov    r10d,0x1
    4e2b:	85 c0                	test   eax,eax
    4e2d:	74 2a                	je     4e59 <gpu_run+0x4a09>
    4e2f:	90                   	nop
/home/simon/prog/C/EMULATOR/GPU.c:121
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
    4e30:	83 e8 01             	sub    eax,0x1
    4e33:	44 89 d1             	mov    ecx,r10d
    4e36:	49 83 c3 04          	add    r11,0x4
    4e3a:	89 47 0c             	mov    DWORD PTR [rdi+0xc],eax
    4e3d:	48 98                	cdqe   
    4e3f:	41 83 c2 01          	add    r10d,0x1
    4e43:	0f b6 44 07 10       	movzx  eax,BYTE PTR [rdi+rax*1+0x10]
    4e48:	41 89 43 fc          	mov    DWORD PTR [r11-0x4],eax
/home/simon/prog/C/EMULATOR/GPU.c:120
		}
	}
}

void mergeNextSpan() {
	while(NEXT_EXEC_SPAN->count) {//instead of this, merge sorted. needed for write calculations
    4e4c:	8b 47 0c             	mov    eax,DWORD PTR [rdi+0xc]
    4e4f:	85 c0                	test   eax,eax
    4e51:	75 dd                	jne    4e30 <gpu_run+0x49e0>
    4e53:	89 0d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ecx        # 4e59 <gpu_run+0x4a09>
/home/simon/prog/C/EMULATOR/GPU.c:124
		GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS++] = NEXT_EXEC_SPAN->index[--NEXT_EXEC_SPAN->count];
	}
	execSpan *tmp = NEXT_EXEC_SPAN;
	NEXT_EXEC_SPAN = NEXT_EXEC_SPAN->next;
    4e59:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
    4e5c:	48 89 15 00 00 00 00 	mov    QWORD PTR [rip+0x0],rdx        # 4e63 <gpu_run+0x4a13>
/home/simon/prog/C/EMULATOR/GPU.c:125
	free(tmp);
    4e63:	e8 00 00 00 00       	call   4e68 <gpu_run+0x4a18>
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:156
		GPU_EXIT_CODE = GPU_EXIT_CODE_EXIT;
		GPU_EXIT_PC = currentPC;
		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOOP;
	}

	while(numThreadsRunning) {
    4e68:	8b 74 24 34          	mov    esi,DWORD PTR [rsp+0x34]
    4e6c:	85 f6                	test   esi,esi
    4e6e:	0f 85 fc df ff ff    	jne    2e70 <gpu_run+0x2a20>
    4e74:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
    4e79:	e9 a1 b7 ff ff       	jmp    61f <gpu_run+0x1cf>
    4e7e:	66 90                	xchg   ax,ax
    4e80:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
/home/simon/prog/C/EMULATOR/GPU.c:658
				break;
	    	default:
	      		numThreadsRunning = 0;
	      		cycles += 4;
				//throw error
				GPU_EXIT_CODE = GPU_EXIT_CODE_ABORT;
    4e85:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 4e8f <gpu_run+0x4a3f>
    4e8c:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:659
				GPU_EXIT_PC = currentPC;
    4e8f:	44 89 2d 00 00 00 00 	mov    DWORD PTR [rip+0x0],r13d        # 4e96 <gpu_run+0x4a46>
/home/simon/prog/C/EMULATOR/GPU.c:660
	      		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOSUCHINSTR;
    4e96:	c7 05 00 00 00 00 05 	mov    DWORD PTR [rip+0x0],0x5        # 4ea0 <gpu_run+0x4a50>
    4e9d:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:656
					A[indx].i = modff(C[indx].f,&B[indx].f);
				}
				break;
	    	default:
	      		numThreadsRunning = 0;
	      		cycles += 4;
    4ea0:	48 83 c5 04          	add    rbp,0x4
/home/simon/prog/C/EMULATOR/GPU.c:661
				//throw error
				GPU_EXIT_CODE = GPU_EXIT_CODE_ABORT;
				GPU_EXIT_PC = currentPC;
	      		GPU_EXIT_MESSAGE = GPU_EXIT_MESSAGE_NOSUCHINSTR;
		      	break;
    4ea4:	e9 76 b7 ff ff       	jmp    61f <gpu_run+0x1cf>
    4ea9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:610 (discriminator 1)
							lastCache = true;
							lastMem = false;
						}
					} else {
						//update cache replacement policy
						gpu_l1_entry_select = (gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK)) ? gpu_l1_entry_select&(0xffffffff^(1<<indx)): gpu_l1_entry_select|(1<<indx);
    4eb0:	45 89 c1             	mov    r9d,r8d
    4eb3:	41 d3 e1             	shl    r9d,cl
    4eb6:	41 f7 d1             	not    r9d
    4eb9:	45 21 ca             	and    r10d,r9d
    4ebc:	e9 8f bd ff ff       	jmp    c50 <gpu_run+0x800>
    4ec1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:555
						for(int i = 0; i < tmp; ++i) {
							if(gpu_cache_read[i] == (addr & L1CACHE_ADDR_MASK)) {
								goto noadd_rd32;
							}
						}
						gpu_cache_read[tmp++] =  addr & L1CACHE_ADDR_MASK;	//we should mask the next cache line also
    4ec8:	44 89 f1             	mov    ecx,r14d
/home/simon/prog/C/EMULATOR/GPU.c:560
																			//because L1 is 8 words long, but L2 is 16 words long
																			//so if anyone else requested the other L1 line on the L2 line, they also get the data
																			//but only if we stream the whole L2 entry into memory, otherwise we only send the requested data, since the overhead is very low
																			//check l2 cache, if there is an entry, add 4 cycles
						if(	(gpu_l2_cache[(addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1)] != (addr & L2CACHE_ADDR_MASK)) &&
    4ecb:	41 89 c1             	mov    r9d,eax
/home/simon/prog/C/EMULATOR/GPU.c:555
						for(int i = 0; i < tmp; ++i) {
							if(gpu_cache_read[i] == (addr & L1CACHE_ADDR_MASK)) {
								goto noadd_rd32;
							}
						}
						gpu_cache_read[tmp++] =  addr & L1CACHE_ADDR_MASK;	//we should mask the next cache line also
    4ece:	45 8d 5e 01          	lea    r11d,[r14+0x1]
    4ed2:	89 14 8d 00 00 00 00 	mov    DWORD PTR [rcx*4+0x0],edx
/home/simon/prog/C/EMULATOR/GPU.c:560
																			//because L1 is 8 words long, but L2 is 16 words long
																			//so if anyone else requested the other L1 line on the L2 line, they also get the data
																			//but only if we stream the whole L2 entry into memory, otherwise we only send the requested data, since the overhead is very low
																			//check l2 cache, if there is an entry, add 4 cycles
						if(	(gpu_l2_cache[(addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1)] != (addr & L2CACHE_ADDR_MASK)) &&
    4ed9:	89 c1                	mov    ecx,eax
    4edb:	41 81 e1 c0 0f ff ff 	and    r9d,0xffff0fc0
    4ee2:	81 e1 00 f0 00 00    	and    ecx,0xf000
    4ee8:	89 ca                	mov    edx,ecx
    4eea:	c1 ea 0b             	shr    edx,0xb
    4eed:	41 89 d5             	mov    r13d,edx
    4ef0:	46 39 0c ad 00 00 00 	cmp    DWORD PTR [r13*4+0x0],r9d
    4ef7:	00 
    4ef8:	0f 84 42 01 00 00    	je     5040 <gpu_run+0x4bf0>
/home/simon/prog/C/EMULATOR/GPU.c:561 (discriminator 1)
								(gpu_l2_cache[1+((addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1))] != (addr & L2CACHE_ADDR_MASK)) ) {
    4efe:	83 c2 01             	add    edx,0x1
/home/simon/prog/C/EMULATOR/GPU.c:560 (discriminator 1)
						gpu_cache_read[tmp++] =  addr & L1CACHE_ADDR_MASK;	//we should mask the next cache line also
																			//because L1 is 8 words long, but L2 is 16 words long
																			//so if anyone else requested the other L1 line on the L2 line, they also get the data
																			//but only if we stream the whole L2 entry into memory, otherwise we only send the requested data, since the overhead is very low
																			//check l2 cache, if there is an entry, add 4 cycles
						if(	(gpu_l2_cache[(addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1)] != (addr & L2CACHE_ADDR_MASK)) &&
    4f01:	44 3b 0c 95 00 00 00 	cmp    r9d,DWORD PTR [rdx*4+0x0]
    4f08:	00 
    4f09:	0f 84 31 01 00 00    	je     5040 <gpu_run+0x4bf0>
/home/simon/prog/C/EMULATOR/GPU.c:563
								(gpu_l2_cache[1+((addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1))] != (addr & L2CACHE_ADDR_MASK)) ) {
							//update second data cache in L1, since we are streaming the whole L2 line at this point
							gpu_cache_read[tmp++] =  (addr^(8*4)) & L1CACHE_ADDR_MASK;
    4f0f:	89 c2                	mov    edx,eax
/home/simon/prog/C/EMULATOR/GPU.c:566
							//update l2 cache entry
							uint32_t L2Entry = ((addr & L2CACHE_ENTRY_MASK)>>L2CACHE_ENTRY_SHIFT);
							gpu_l2_cache[((gpu_l2_entry_select&(1<<L2Entry))>>L2Entry)+(L2Entry<<1)] = (addr & L2CACHE_ADDR_MASK);
    4f11:	44 8b 6c 24 30       	mov    r13d,DWORD PTR [rsp+0x30]
/home/simon/prog/C/EMULATOR/GPU.c:565
						if(	(gpu_l2_cache[(addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1)] != (addr & L2CACHE_ADDR_MASK)) &&
								(gpu_l2_cache[1+((addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1))] != (addr & L2CACHE_ADDR_MASK)) ) {
							//update second data cache in L1, since we are streaming the whole L2 line at this point
							gpu_cache_read[tmp++] =  (addr^(8*4)) & L1CACHE_ADDR_MASK;
							//update l2 cache entry
							uint32_t L2Entry = ((addr & L2CACHE_ENTRY_MASK)>>L2CACHE_ENTRY_SHIFT);
    4f16:	c1 e9 0c             	shr    ecx,0xc
/home/simon/prog/C/EMULATOR/GPU.c:563
																			//but only if we stream the whole L2 entry into memory, otherwise we only send the requested data, since the overhead is very low
																			//check l2 cache, if there is an entry, add 4 cycles
						if(	(gpu_l2_cache[(addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1)] != (addr & L2CACHE_ADDR_MASK)) &&
								(gpu_l2_cache[1+((addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1))] != (addr & L2CACHE_ADDR_MASK)) ) {
							//update second data cache in L1, since we are streaming the whole L2 line at this point
							gpu_cache_read[tmp++] =  (addr^(8*4)) & L1CACHE_ADDR_MASK;
    4f19:	83 f2 20             	xor    edx,0x20
    4f1c:	41 83 c6 02          	add    r14d,0x2
    4f20:	83 e2 e0             	and    edx,0xffffffe0
    4f23:	42 89 14 9d 00 00 00 	mov    DWORD PTR [r11*4+0x0],edx
    4f2a:	00 
/home/simon/prog/C/EMULATOR/GPU.c:566
							//update l2 cache entry
							uint32_t L2Entry = ((addr & L2CACHE_ENTRY_MASK)>>L2CACHE_ENTRY_SHIFT);
							gpu_l2_cache[((gpu_l2_entry_select&(1<<L2Entry))>>L2Entry)+(L2Entry<<1)] = (addr & L2CACHE_ADDR_MASK);
    4f2b:	45 89 c3             	mov    r11d,r8d
    4f2e:	44 89 ea             	mov    edx,r13d
    4f31:	41 d3 e3             	shl    r11d,cl
    4f34:	44 21 da             	and    edx,r11d
    4f37:	d3 ea                	shr    edx,cl
    4f39:	8d 0c 4a             	lea    ecx,[rdx+rcx*2]
/home/simon/prog/C/EMULATOR/GPU.c:570
							gpu_l2_entry_select ^= 1 << L2Entry;
							//otherwise, add word count + latency + row miss
							//							 8,           3,        8 cycles respectively (3-4-4-7 ram)
							if((cycles + (tmpCycles>>1)) < mem_busy_until) {//TODO: look over this, doesn't seem quite right
    4f3c:	48 8b 54 24 08       	mov    rdx,QWORD PTR [rsp+0x8]
/home/simon/prog/C/EMULATOR/GPU.c:566
								(gpu_l2_cache[1+((addr & L2CACHE_ENTRY_MASK)>>(L2CACHE_ENTRY_SHIFT-1))] != (addr & L2CACHE_ADDR_MASK)) ) {
							//update second data cache in L1, since we are streaming the whole L2 line at this point
							gpu_cache_read[tmp++] =  (addr^(8*4)) & L1CACHE_ADDR_MASK;
							//update l2 cache entry
							uint32_t L2Entry = ((addr & L2CACHE_ENTRY_MASK)>>L2CACHE_ENTRY_SHIFT);
							gpu_l2_cache[((gpu_l2_entry_select&(1<<L2Entry))>>L2Entry)+(L2Entry<<1)] = (addr & L2CACHE_ADDR_MASK);
    4f41:	44 89 0c 8d 00 00 00 	mov    DWORD PTR [rcx*4+0x0],r9d
    4f48:	00 
/home/simon/prog/C/EMULATOR/GPU.c:567
							gpu_l2_entry_select ^= 1 << L2Entry;
    4f49:	45 89 e9             	mov    r9d,r13d
    4f4c:	45 31 d9             	xor    r9d,r11d
/home/simon/prog/C/EMULATOR/GPU.c:570
							//otherwise, add word count + latency + row miss
							//							 8,           3,        8 cycles respectively (3-4-4-7 ram)
							if((cycles + (tmpCycles>>1)) < mem_busy_until) {//TODO: look over this, doesn't seem quite right
    4f4f:	44 8b 5c 24 10       	mov    r11d,DWORD PTR [rsp+0x10]
/home/simon/prog/C/EMULATOR/GPU.c:567
							//update second data cache in L1, since we are streaming the whole L2 line at this point
							gpu_cache_read[tmp++] =  (addr^(8*4)) & L1CACHE_ADDR_MASK;
							//update l2 cache entry
							uint32_t L2Entry = ((addr & L2CACHE_ENTRY_MASK)>>L2CACHE_ENTRY_SHIFT);
							gpu_l2_cache[((gpu_l2_entry_select&(1<<L2Entry))>>L2Entry)+(L2Entry<<1)] = (addr & L2CACHE_ADDR_MASK);
							gpu_l2_entry_select ^= 1 << L2Entry;
    4f54:	44 89 4c 24 30       	mov    DWORD PTR [rsp+0x30],r9d
/home/simon/prog/C/EMULATOR/GPU.c:570
							//otherwise, add word count + latency + row miss
							//							 8,           3,        8 cycles respectively (3-4-4-7 ram)
							if((cycles + (tmpCycles>>1)) < mem_busy_until) {//TODO: look over this, doesn't seem quite right
    4f59:	45 89 dd             	mov    r13d,r11d
    4f5c:	41 d1 ed             	shr    r13d,1
    4f5f:	4c 01 ea             	add    rdx,r13
    4f62:	48 3b 54 24 28       	cmp    rdx,QWORD PTR [rsp+0x28]
    4f67:	0f 82 63 01 00 00    	jb     50d0 <gpu_run+0x4c80>
    4f6d:	45 8d 5b 08          	lea    r11d,[r11+0x8]
/home/simon/prog/C/EMULATOR/GPU.c:585
							//	L2 to same row burst		CL-3 = 0
							//	L2 to different row burst	TRCD+TRP+CL-3 = 6
							//	L2 to different bank burst	TRCD+CL-3 = 3
							//	post read precharge			set mem_busy_until to (cycles*2+TRP+1)>>1
							tmpCycles += 8;
							if((lastMem && ((addr ^ lastAddr) & ROW_MASK) != 0) && !((addr ^ lastAddr) & BANK_MASK)) {
    4f71:	80 7c 24 18 00       	cmp    BYTE PTR [rsp+0x18],0x0
    4f76:	74 28                	je     4fa0 <gpu_run+0x4b50>
/home/simon/prog/C/EMULATOR/GPU.c:585 (discriminator 1)
    4f78:	44 8b 6c 24 20       	mov    r13d,DWORD PTR [rsp+0x20]
    4f7d:	41 31 c5             	xor    r13d,eax
    4f80:	41 f7 c5 00 e8 ff ff 	test   r13d,0xffffe800
    4f87:	74 17                	je     4fa0 <gpu_run+0x4b50>
/home/simon/prog/C/EMULATOR/GPU.c:585 (discriminator 2)
    4f89:	41 81 e5 00 10 00 80 	and    r13d,0x80001000
    4f90:	0f 84 95 02 00 00    	je     522b <gpu_run+0x4ddb>
    4f96:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    4f9d:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:587
								tmpCycles += GPU_TRCD+GPU_CL;
							} else if(lastCache) {
    4fa0:	80 7c 24 3a 00       	cmp    BYTE PTR [rsp+0x3a],0x0
    4fa5:	0f 84 55 01 00 00    	je     5100 <gpu_run+0x4cb0>
/home/simon/prog/C/EMULATOR/GPU.c:588
								if(lastAddr == -1) {
    4fab:	83 7c 24 20 ff       	cmp    DWORD PTR [rsp+0x20],0xffffffff
    4fb0:	0f 84 0a 02 00 00    	je     51c0 <gpu_run+0x4d70>
/home/simon/prog/C/EMULATOR/GPU.c:590
									tmpCycles += GPU_TRCD+GPU_CL-3;//first read from memory
								} else if(((addr ^ lastAddr) & BANK_MASK) != 0) {//different banks
    4fb6:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
    4fba:	31 c2                	xor    edx,eax
    4fbc:	f7 c2 00 10 00 80    	test   edx,0x80001000
    4fc2:	0f 85 f8 01 00 00    	jne    51c0 <gpu_run+0x4d70>
/home/simon/prog/C/EMULATOR/GPU.c:592
									tmpCycles += GPU_TRCD+GPU_CL-3;
								} else if(((addr ^ lastAddr) & ROW_MASK) != 0) {//different rows, same bank
    4fc8:	81 e2 00 e8 ff ff    	and    edx,0xffffe800
    4fce:	0f 84 86 02 00 00    	je     525a <gpu_run+0x4e0a>
/home/simon/prog/C/EMULATOR/GPU.c:593
									tmpCycles += GPU_TRCD+GPU_TRP+GPU_CL-3;
    4fd4:	83 44 24 10 0e       	add    DWORD PTR [rsp+0x10],0xe
/home/simon/prog/C/EMULATOR/GPU.c:600
									tmpCycles += GPU_CL-3;//read from RAM, same row.
								}
							} else {//first read
								tmpCycles += GPU_TRCD+GPU_CL;
							}
							lastAddr = addr;
    4fd9:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
    4fdd:	c6 44 24 3b 01       	mov    BYTE PTR [rsp+0x3b],0x1
/home/simon/prog/C/EMULATOR/GPU.c:601
							lastMem = true;
    4fe2:	c6 44 24 18 01       	mov    BYTE PTR [rsp+0x18],0x1
/home/simon/prog/C/EMULATOR/GPU.c:602
							lastCache = false;
    4fe7:	c6 44 24 3a 00       	mov    BYTE PTR [rsp+0x3a],0x0
    4fec:	e9 5f bc ff ff       	jmp    c50 <gpu_run+0x800>
    4ff1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
insertExecSpan():
/home/simon/prog/C/EMULATOR/GPU.c:99
int GPU_ACTIVE_THREAD_INDEXES[GPU_CORE_COUNT] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
int GPU_ACTIVE_THREADS = GPU_CORE_COUNT;
execSpan *NEXT_EXEC_SPAN = 0;

void insertExecSpan(execSpan *span) {
	if(NEXT_EXEC_SPAN == 0 || NEXT_EXEC_SPAN->PC > span->PC) {
    4ff8:	4d 85 f6             	test   r14,r14
    4ffb:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 5005 <gpu_run+0x4bb5>
    5002:	00 00 00 
    5005:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
    5008:	0f 85 2c ed ff ff    	jne    3d3a <gpu_run+0x38ea>
    500e:	66 90                	xchg   ax,ax
/home/simon/prog/C/EMULATOR/GPU.c:100
		span->next = NEXT_EXEC_SPAN;
    5010:	4c 89 30             	mov    QWORD PTR [rax],r14
/home/simon/prog/C/EMULATOR/GPU.c:101
		NEXT_EXEC_SPAN = span;
    5013:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 501a <gpu_run+0x4bca>
    501a:	e9 5f ed ff ff       	jmp    3d7e <gpu_run+0x392e>
    501f:	90                   	nop
/home/simon/prog/C/EMULATOR/GPU.c:100
int GPU_ACTIVE_THREADS = GPU_CORE_COUNT;
execSpan *NEXT_EXEC_SPAN = 0;

void insertExecSpan(execSpan *span) {
	if(NEXT_EXEC_SPAN == 0 || NEXT_EXEC_SPAN->PC > span->PC) {
		span->next = NEXT_EXEC_SPAN;
    5020:	4c 89 20             	mov    QWORD PTR [rax],r12
/home/simon/prog/C/EMULATOR/GPU.c:101
		NEXT_EXEC_SPAN = span;
    5023:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 502a <gpu_run+0x4bda>
    502a:	e9 d1 c1 ff ff       	jmp    1200 <gpu_run+0xdb0>
    502f:	90                   	nop
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:610 (discriminator 2)
							lastCache = true;
							lastMem = false;
						}
					} else {
						//update cache replacement policy
						gpu_l1_entry_select = (gpu_l1_cache[indx<<1] != (addr & L1CACHE_ADDR_MASK)) ? gpu_l1_entry_select&(0xffffffff^(1<<indx)): gpu_l1_entry_select|(1<<indx);
    5030:	45 89 c5             	mov    r13d,r8d
    5033:	41 d3 e5             	shl    r13d,cl
    5036:	45 09 ea             	or     r10d,r13d
    5039:	e9 12 bc ff ff       	jmp    c50 <gpu_run+0x800>
    503e:	66 90                	xchg   ax,ax
/home/simon/prog/C/EMULATOR/GPU.c:604
							}
							lastAddr = addr;
							lastMem = true;
							lastCache = false;
						} else {//data in L2 CACHE
							tmpCycles += 4;//4 cycles to bring 8 words from L2 to L1 cache, last 3 cycles used to hide SGRAM delays
    5040:	83 44 24 10 04       	add    DWORD PTR [rsp+0x10],0x4
/home/simon/prog/C/EMULATOR/GPU.c:555
						for(int i = 0; i < tmp; ++i) {
							if(gpu_cache_read[i] == (addr & L1CACHE_ADDR_MASK)) {
								goto noadd_rd32;
							}
						}
						gpu_cache_read[tmp++] =  addr & L1CACHE_ADDR_MASK;	//we should mask the next cache line also
    5045:	45 89 de             	mov    r14d,r11d
/home/simon/prog/C/EMULATOR/GPU.c:606
							lastMem = true;
							lastCache = false;
						} else {//data in L2 CACHE
							tmpCycles += 4;//4 cycles to bring 8 words from L2 to L1 cache, last 3 cycles used to hide SGRAM delays
							lastCache = true;
							lastMem = false;
    5048:	c6 44 24 18 00       	mov    BYTE PTR [rsp+0x18],0x0
/home/simon/prog/C/EMULATOR/GPU.c:605
							lastAddr = addr;
							lastMem = true;
							lastCache = false;
						} else {//data in L2 CACHE
							tmpCycles += 4;//4 cycles to bring 8 words from L2 to L1 cache, last 3 cycles used to hide SGRAM delays
							lastCache = true;
    504d:	c6 44 24 3a 01       	mov    BYTE PTR [rsp+0x3a],0x1
    5052:	e9 f9 bb ff ff       	jmp    c50 <gpu_run+0x800>
    5057:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    505e:	00 00 
/home/simon/prog/C/EMULATOR/GPU.c:516
							} else {
								merged = true;
							}
						} else if((addr ^ lastAddr) & BANK_MASK) {
							merged = false;
							if(tmpCycles < (GPU_TRAS-1)) tmpCycles = GPU_TRAS-1;//we load the row in the other bank first, so we can delay precharge one cycle.
    5060:	83 ff 04             	cmp    edi,0x4
    5063:	41 bf 05 00 00 00    	mov    r15d,0x5
    5069:	41 0f 46 ff          	cmovbe edi,r15d
/home/simon/prog/C/EMULATOR/GPU.c:515
								tmpCycles += 1;
							} else {
								merged = true;
							}
						} else if((addr ^ lastAddr) & BANK_MASK) {
							merged = false;
    506d:	45 31 c0             	xor    r8d,r8d
/home/simon/prog/C/EMULATOR/GPU.c:517
							if(tmpCycles < (GPU_TRAS-1)) tmpCycles = GPU_TRAS-1;//we load the row in the other bank first, so we can delay precharge one cycle.
							cyclesAccum += tmpCycles;
    5070:	41 01 f9             	add    r9d,edi
/home/simon/prog/C/EMULATOR/GPU.c:518
							tmpCycles = GPU_TRCD+1;
    5073:	bf 04 00 00 00       	mov    edi,0x4
    5078:	e9 13 be ff ff       	jmp    e90 <gpu_run+0xa40>
    507d:	0f 1f 00             	nop    DWORD PTR [rax]
/home/simon/prog/C/EMULATOR/GPU.c:519
						} else if(((addr ^ lastAddr) & ROW_MASK) != 0) {
    5080:	a9 00 e8 7f 00       	test   eax,0x7fe800
    5085:	74 39                	je     50c0 <gpu_run+0x4c70>
/home/simon/prog/C/EMULATOR/GPU.c:521
							merged = false;
							if(tmpCycles < GPU_TRAS) tmpCycles = GPU_TRAS;
    5087:	83 ff 05             	cmp    edi,0x5
    508a:	41 b8 06 00 00 00    	mov    r8d,0x6
    5090:	41 0f 46 f8          	cmovbe edi,r8d
/home/simon/prog/C/EMULATOR/GPU.c:520
							merged = false;
							if(tmpCycles < (GPU_TRAS-1)) tmpCycles = GPU_TRAS-1;//we load the row in the other bank first, so we can delay precharge one cycle.
							cyclesAccum += tmpCycles;
							tmpCycles = GPU_TRCD+1;
						} else if(((addr ^ lastAddr) & ROW_MASK) != 0) {
							merged = false;
    5094:	45 31 ff             	xor    r15d,r15d
/home/simon/prog/C/EMULATOR/GPU.c:522
							if(tmpCycles < GPU_TRAS) tmpCycles = GPU_TRAS;
							cyclesAccum += tmpCycles+GPU_TRP;
    5097:	45 8d 4c 39 03       	lea    r9d,[r9+rdi*1+0x3]
/home/simon/prog/C/EMULATOR/GPU.c:523
							tmpCycles = GPU_TRCD+1;//TRCD and TRAS overlap
    509c:	bf 04 00 00 00       	mov    edi,0x4
    50a1:	e9 6b bd ff ff       	jmp    e11 <gpu_run+0x9c1>
    50a6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    50ad:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:510
							first = false;
							tmpCycles += GPU_TRCD+1;
						} else if(((addr^lastAddr) & 0xfffffff8) == lastAddr) {//both were merged into one write
							if(merged) {
								merged = false;
								tmpCycles += 1;
    50b0:	83 c7 01             	add    edi,0x1
/home/simon/prog/C/EMULATOR/GPU.c:509
						if(first) {
							first = false;
							tmpCycles += GPU_TRCD+1;
						} else if(((addr^lastAddr) & 0xfffffff8) == lastAddr) {//both were merged into one write
							if(merged) {
								merged = false;
    50b3:	45 31 c0             	xor    r8d,r8d
    50b6:	e9 d5 bd ff ff       	jmp    e90 <gpu_run+0xa40>
    50bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:526
							if(tmpCycles < GPU_TRAS) tmpCycles = GPU_TRAS;
							cyclesAccum += tmpCycles+GPU_TRP;
							tmpCycles = GPU_TRCD+1;//TRCD and TRAS overlap
						} else {
							merged = false;
							tmpCycles += 1;
    50c0:	83 c7 01             	add    edi,0x1
/home/simon/prog/C/EMULATOR/GPU.c:525
							merged = false;
							if(tmpCycles < GPU_TRAS) tmpCycles = GPU_TRAS;
							cyclesAccum += tmpCycles+GPU_TRP;
							tmpCycles = GPU_TRCD+1;//TRCD and TRAS overlap
						} else {
							merged = false;
    50c3:	45 31 ff             	xor    r15d,r15d
    50c6:	e9 46 bd ff ff       	jmp    e11 <gpu_run+0x9c1>
    50cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:571
							gpu_l2_cache[((gpu_l2_entry_select&(1<<L2Entry))>>L2Entry)+(L2Entry<<1)] = (addr & L2CACHE_ADDR_MASK);
							gpu_l2_entry_select ^= 1 << L2Entry;
							//otherwise, add word count + latency + row miss
							//							 8,           3,        8 cycles respectively (3-4-4-7 ram)
							if((cycles + (tmpCycles>>1)) < mem_busy_until) {//TODO: look over this, doesn't seem quite right
								cycles += (mem_busy_until-(tmpCycles>>1))-cycles;//wait for memory controller to be free
    50d0:	4c 8b 4c 24 28       	mov    r9,QWORD PTR [rsp+0x28]
    50d5:	41 bb 08 00 00 00    	mov    r11d,0x8
/home/simon/prog/C/EMULATOR/GPU.c:572
								tmpCycles = 0;//already added
    50db:	c7 44 24 10 00 00 00 	mov    DWORD PTR [rsp+0x10],0x0
    50e2:	00 
/home/simon/prog/C/EMULATOR/GPU.c:571
							gpu_l2_cache[((gpu_l2_entry_select&(1<<L2Entry))>>L2Entry)+(L2Entry<<1)] = (addr & L2CACHE_ADDR_MASK);
							gpu_l2_entry_select ^= 1 << L2Entry;
							//otherwise, add word count + latency + row miss
							//							 8,           3,        8 cycles respectively (3-4-4-7 ram)
							if((cycles + (tmpCycles>>1)) < mem_busy_until) {//TODO: look over this, doesn't seem quite right
								cycles += (mem_busy_until-(tmpCycles>>1))-cycles;//wait for memory controller to be free
    50e3:	4d 29 e9             	sub    r9,r13
    50e6:	4c 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],r9
    50eb:	e9 81 fe ff ff       	jmp    4f71 <gpu_run+0x4b21>
/home/simon/prog/C/EMULATOR/GPU.c:508
						uint32_t addr = ((B[indx].i&1023)*4)+((C[indx].i&1023)*4096);//get address. Instead of checking bounds, wrap around
						if(first) {
							first = false;
							tmpCycles += GPU_TRCD+1;
						} else if(((addr^lastAddr) & 0xfffffff8) == lastAddr) {//both were merged into one write
							if(merged) {
    50f0:	45 84 ff             	test   r15b,r15b
    50f3:	75 bb                	jne    50b0 <gpu_run+0x4c60>
/home/simon/prog/C/EMULATOR/GPU.c:512
								merged = false;
								tmpCycles += 1;
							} else {
								merged = true;
    50f5:	41 b8 01 00 00 00    	mov    r8d,0x1
    50fb:	e9 90 bd ff ff       	jmp    e90 <gpu_run+0xa40>
/home/simon/prog/C/EMULATOR/GPU.c:598
									tmpCycles += GPU_TRCD+GPU_TRP+GPU_CL-3;
								} else {
									tmpCycles += GPU_CL-3;//read from RAM, same row.
								}
							} else {//first read
								tmpCycles += GPU_TRCD+GPU_CL;
    5100:	83 44 24 10 0e       	add    DWORD PTR [rsp+0x10],0xe
/home/simon/prog/C/EMULATOR/GPU.c:600
							}
							lastAddr = addr;
    5105:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
/home/simon/prog/C/EMULATOR/GPU.c:598
									tmpCycles += GPU_TRCD+GPU_TRP+GPU_CL-3;
								} else {
									tmpCycles += GPU_CL-3;//read from RAM, same row.
								}
							} else {//first read
								tmpCycles += GPU_TRCD+GPU_CL;
    5109:	c6 44 24 3b 01       	mov    BYTE PTR [rsp+0x3b],0x1
/home/simon/prog/C/EMULATOR/GPU.c:601
							}
							lastAddr = addr;
							lastMem = true;
    510e:	c6 44 24 18 01       	mov    BYTE PTR [rsp+0x18],0x1
    5113:	e9 38 bb ff ff       	jmp    c50 <gpu_run+0x800>
    5118:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    511f:	00 
insertExecSpan():
/home/simon/prog/C/EMULATOR/GPU.c:108
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
			next = next->next;
		}
		if(next->PC == span->PC) {
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
    5120:	44 8b 78 0c          	mov    r15d,DWORD PTR [rax+0xc]
    5124:	45 85 ff             	test   r15d,r15d
    5127:	74 30                	je     5159 <gpu_run+0x4d09>
    5129:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:109
				next->index[next->count++] = span->index[--span->count];
    5130:	4c 63 51 0c          	movsxd r10,DWORD PTR [rcx+0xc]
    5134:	41 8d 72 01          	lea    esi,[r10+0x1]
    5138:	89 71 0c             	mov    DWORD PTR [rcx+0xc],esi
    513b:	8b 78 0c             	mov    edi,DWORD PTR [rax+0xc]
    513e:	44 8d 5f ff          	lea    r11d,[rdi-0x1]
    5142:	4d 63 c3             	movsxd r8,r11d
    5145:	44 89 58 0c          	mov    DWORD PTR [rax+0xc],r11d
/home/simon/prog/C/EMULATOR/GPU.c:108
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
			next = next->next;
		}
		if(next->PC == span->PC) {
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
    5149:	45 85 db             	test   r11d,r11d
/home/simon/prog/C/EMULATOR/GPU.c:109
				next->index[next->count++] = span->index[--span->count];
    514c:	42 0f b6 54 00 10    	movzx  edx,BYTE PTR [rax+r8*1+0x10]
    5152:	42 88 54 11 10       	mov    BYTE PTR [rcx+r10*1+0x10],dl
/home/simon/prog/C/EMULATOR/GPU.c:108
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
			next = next->next;
		}
		if(next->PC == span->PC) {
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
    5157:	75 d7                	jne    5130 <gpu_run+0x4ce0>
/home/simon/prog/C/EMULATOR/GPU.c:111
				next->index[next->count++] = span->index[--span->count];
			}
			free(span);
    5159:	48 89 c7             	mov    rdi,rax
    515c:	e8 00 00 00 00       	call   5161 <gpu_run+0x4d11>
    5161:	4c 89 e0             	mov    rax,r12
    5164:	e9 97 c0 ff ff       	jmp    1200 <gpu_run+0xdb0>
    5169:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:108
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
			next = next->next;
		}
		if(next->PC == span->PC) {
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
    5170:	44 8b 60 0c          	mov    r12d,DWORD PTR [rax+0xc]
    5174:	45 85 e4             	test   r12d,r12d
    5177:	74 32                	je     51ab <gpu_run+0x4d5b>
    5179:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:109
				next->index[next->count++] = span->index[--span->count];
    5180:	4c 63 69 0c          	movsxd r13,DWORD PTR [rcx+0xc]
    5184:	45 8d 5d 01          	lea    r11d,[r13+0x1]
    5188:	44 89 59 0c          	mov    DWORD PTR [rcx+0xc],r11d
    518c:	44 8b 48 0c          	mov    r9d,DWORD PTR [rax+0xc]
    5190:	45 8d 79 ff          	lea    r15d,[r9-0x1]
    5194:	49 63 ff             	movsxd rdi,r15d
    5197:	44 89 78 0c          	mov    DWORD PTR [rax+0xc],r15d
/home/simon/prog/C/EMULATOR/GPU.c:108
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
			next = next->next;
		}
		if(next->PC == span->PC) {
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
    519b:	45 85 ff             	test   r15d,r15d
/home/simon/prog/C/EMULATOR/GPU.c:109
				next->index[next->count++] = span->index[--span->count];
    519e:	44 0f b6 54 38 10    	movzx  r10d,BYTE PTR [rax+rdi*1+0x10]
    51a4:	46 88 54 29 10       	mov    BYTE PTR [rcx+r13*1+0x10],r10b
/home/simon/prog/C/EMULATOR/GPU.c:108
		execSpan *next = NEXT_EXEC_SPAN;
		while(next->next && next->next->PC < span->PC) {
			next = next->next;
		}
		if(next->PC == span->PC) {
			while(span->count) {//this case ensures that there is only ever at most one span at each PC
    51a9:	75 d5                	jne    5180 <gpu_run+0x4d30>
/home/simon/prog/C/EMULATOR/GPU.c:111
				next->index[next->count++] = span->index[--span->count];
			}
			free(span);
    51ab:	48 89 c7             	mov    rdi,rax
    51ae:	e8 00 00 00 00       	call   51b3 <gpu_run+0x4d63>
    51b3:	4c 89 f0             	mov    rax,r14
    51b6:	e9 c3 eb ff ff       	jmp    3d7e <gpu_run+0x392e>
    51bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
gpu_run():
/home/simon/prog/C/EMULATOR/GPU.c:591
								tmpCycles += GPU_TRCD+GPU_CL;
							} else if(lastCache) {
								if(lastAddr == -1) {
									tmpCycles += GPU_TRCD+GPU_CL-3;//first read from memory
								} else if(((addr ^ lastAddr) & BANK_MASK) != 0) {//different banks
									tmpCycles += GPU_TRCD+GPU_CL-3;
    51c0:	83 44 24 10 0b       	add    DWORD PTR [rsp+0x10],0xb
/home/simon/prog/C/EMULATOR/GPU.c:600
									tmpCycles += GPU_CL-3;//read from RAM, same row.
								}
							} else {//first read
								tmpCycles += GPU_TRCD+GPU_CL;
							}
							lastAddr = addr;
    51c5:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
    51c9:	c6 44 24 3b 01       	mov    BYTE PTR [rsp+0x3b],0x1
/home/simon/prog/C/EMULATOR/GPU.c:601
							lastMem = true;
    51ce:	c6 44 24 18 01       	mov    BYTE PTR [rsp+0x18],0x1
/home/simon/prog/C/EMULATOR/GPU.c:602
							lastCache = false;
    51d3:	c6 44 24 3a 00       	mov    BYTE PTR [rsp+0x3a],0x0
    51d8:	e9 73 ba ff ff       	jmp    c50 <gpu_run+0x800>
/home/simon/prog/C/EMULATOR/GPU.c:517
								merged = true;
							}
						} else if((addr ^ lastAddr) & BANK_MASK) {
							merged = false;
							if(tmpCycles < (GPU_TRAS-1)) tmpCycles = GPU_TRAS-1;//we load the row in the other bank first, so we can delay precharge one cycle.
							cyclesAccum += tmpCycles;
    51dd:	41 b9 05 00 00 00    	mov    r9d,0x5
/home/simon/prog/C/EMULATOR/GPU.c:530
							merged = false;
							tmpCycles += 1;
						}
						lastAddr = addr;

						*(uint32_t*)(memory+addr) = A[indx].i;
    51e3:	42 8b 84 30 00 00 00 	mov    eax,DWORD PTR [rax+r14*1+0x0]
    51ea:	00 
    51eb:	48 83 c1 04          	add    rcx,0x4
    51ef:	41 89 d3             	mov    r11d,edx
/home/simon/prog/C/EMULATOR/GPU.c:501
					uint32_t cyclesAccum = 0;
					uint32_t lastAddr = -1;
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    51f2:	4c 39 d1             	cmp    rcx,r10
/home/simon/prog/C/EMULATOR/GPU.c:528
							tmpCycles = GPU_TRCD+1;//TRCD and TRAS overlap
						} else {
							merged = false;
							tmpCycles += 1;
						}
						lastAddr = addr;
    51f5:	41 89 d6             	mov    r14d,edx
/home/simon/prog/C/EMULATOR/GPU.c:530

						*(uint32_t*)(memory+addr) = A[indx].i;
    51f8:	41 89 83 00 00 00 00 	mov    DWORD PTR [r11+0x0],eax
/home/simon/prog/C/EMULATOR/GPU.c:501
					uint32_t cyclesAccum = 0;
					uint32_t lastAddr = -1;
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    51ff:	0f 85 a5 bc ff ff    	jne    eaa <gpu_run+0xa5a>
    5205:	42 8d 74 0f 04       	lea    esi,[rdi+r9*1+0x4]
    520a:	d1 ee                	shr    esi,1
/home/simon/prog/C/EMULATOR/GPU.c:532
						}
						lastAddr = addr;

						*(uint32_t*)(memory+addr) = A[indx].i;
		      		}
					mem_busy_until = ((tmpCycles+cyclesAccum+1+GPU_TRP)>>1)+cycles+1;
    520c:	48 8b 5c 24 08       	mov    rbx,QWORD PTR [rsp+0x8]
    5211:	48 8d 6c 33 01       	lea    rbp,[rbx+rsi*1+0x1]
/home/simon/prog/C/EMULATOR/GPU.c:533
					cycles += 8+1;
    5216:	4c 8d 63 09          	lea    r12,[rbx+0x9]
/home/simon/prog/C/EMULATOR/GPU.c:532
						}
						lastAddr = addr;

						*(uint32_t*)(memory+addr) = A[indx].i;
		      		}
					mem_busy_until = ((tmpCycles+cyclesAccum+1+GPU_TRP)>>1)+cycles+1;
    521a:	48 89 2d 00 00 00 00 	mov    QWORD PTR [rip+0x0],rbp        # 5221 <gpu_run+0x4dd1>
/home/simon/prog/C/EMULATOR/GPU.c:533
					cycles += 8+1;
    5221:	4c 89 64 24 08       	mov    QWORD PTR [rsp+0x8],r12
/home/simon/prog/C/EMULATOR/GPU.c:535
				}
				break;
    5226:	e9 45 dc ff ff       	jmp    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:586
							//	L2 to different row burst	TRCD+TRP+CL-3 = 6
							//	L2 to different bank burst	TRCD+CL-3 = 3
							//	post read precharge			set mem_busy_until to (cycles*2+TRP+1)>>1
							tmpCycles += 8;
							if((lastMem && ((addr ^ lastAddr) & ROW_MASK) != 0) && !((addr ^ lastAddr) & BANK_MASK)) {
								tmpCycles += GPU_TRCD+GPU_CL;
    522b:	83 44 24 10 0e       	add    DWORD PTR [rsp+0x10],0xe
/home/simon/prog/C/EMULATOR/GPU.c:600
									tmpCycles += GPU_CL-3;//read from RAM, same row.
								}
							} else {//first read
								tmpCycles += GPU_TRCD+GPU_CL;
							}
							lastAddr = addr;
    5230:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
/home/simon/prog/C/EMULATOR/GPU.c:586
							//	L2 to different row burst	TRCD+TRP+CL-3 = 6
							//	L2 to different bank burst	TRCD+CL-3 = 3
							//	post read precharge			set mem_busy_until to (cycles*2+TRP+1)>>1
							tmpCycles += 8;
							if((lastMem && ((addr ^ lastAddr) & ROW_MASK) != 0) && !((addr ^ lastAddr) & BANK_MASK)) {
								tmpCycles += GPU_TRCD+GPU_CL;
    5234:	c6 44 24 3b 01       	mov    BYTE PTR [rsp+0x3b],0x1
/home/simon/prog/C/EMULATOR/GPU.c:602
							} else {//first read
								tmpCycles += GPU_TRCD+GPU_CL;
							}
							lastAddr = addr;
							lastMem = true;
							lastCache = false;
    5239:	c6 44 24 3a 00       	mov    BYTE PTR [rsp+0x3a],0x0
/home/simon/prog/C/EMULATOR/GPU.c:586
							//	L2 to different row burst	TRCD+TRP+CL-3 = 6
							//	L2 to different bank burst	TRCD+CL-3 = 3
							//	post read precharge			set mem_busy_until to (cycles*2+TRP+1)>>1
							tmpCycles += 8;
							if((lastMem && ((addr ^ lastAddr) & ROW_MASK) != 0) && !((addr ^ lastAddr) & BANK_MASK)) {
								tmpCycles += GPU_TRCD+GPU_CL;
    523e:	e9 0d ba ff ff       	jmp    c50 <gpu_run+0x800>
/home/simon/prog/C/EMULATOR/GPU.c:443
				break;
			case GPUOP_FCMP:
				cycles += 2;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = B[indx].f < C[indx].f ? -1 : (B[indx].f > C[indx].f ? 1 : 0);
    5243:	45 31 d2             	xor    r10d,r10d
    5246:	0f 2e c8             	ucomiss xmm1,xmm0
    5249:	41 0f 97 c2          	seta   r10b
    524d:	e9 03 d9 ff ff       	jmp    2b55 <gpu_run+0x2705>
/home/simon/prog/C/EMULATOR/GPU.c:334
				break;
			case GPUOP_SEL:
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
    5252:	45 8b 31             	mov    r14d,DWORD PTR [r9]
    5255:	e9 87 dd ff ff       	jmp    2fe1 <gpu_run+0x2b91>
/home/simon/prog/C/EMULATOR/GPU.c:600
									tmpCycles += GPU_CL-3;//read from RAM, same row.
								}
							} else {//first read
								tmpCycles += GPU_TRCD+GPU_CL;
							}
							lastAddr = addr;
    525a:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
/home/simon/prog/C/EMULATOR/GPU.c:595
								} else if(((addr ^ lastAddr) & BANK_MASK) != 0) {//different banks
									tmpCycles += GPU_TRCD+GPU_CL-3;
								} else if(((addr ^ lastAddr) & ROW_MASK) != 0) {//different rows, same bank
									tmpCycles += GPU_TRCD+GPU_TRP+GPU_CL-3;
								} else {
									tmpCycles += GPU_CL-3;//read from RAM, same row.
    525e:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
    5263:	c6 44 24 3b 01       	mov    BYTE PTR [rsp+0x3b],0x1
/home/simon/prog/C/EMULATOR/GPU.c:601
								}
							} else {//first read
								tmpCycles += GPU_TRCD+GPU_CL;
							}
							lastAddr = addr;
							lastMem = true;
    5268:	c6 44 24 18 01       	mov    BYTE PTR [rsp+0x18],0x1
/home/simon/prog/C/EMULATOR/GPU.c:602
							lastCache = false;
    526d:	c6 44 24 3a 00       	mov    BYTE PTR [rsp+0x3a],0x0
    5272:	e9 d9 b9 ff ff       	jmp    c50 <gpu_run+0x800>
    5277:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    527e:	00 00 
/home/simon/prog/C/EMULATOR/GPU.c:334
				break;
			case GPUOP_SEL:
				cycles += 3;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
					int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].i = C[indx].i ? A[indx].i : B[indx].i;
    5280:	45 8b 0b             	mov    r9d,DWORD PTR [r11]
    5283:	e9 4e de ff ff       	jmp    30d6 <gpu_run+0x2c86>
    5288:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    528f:	00 
    5290:	8b 74 85 00          	mov    esi,DWORD PTR [rbp+rax*4+0x0]
    5294:	e9 20 de ff ff       	jmp    30b9 <gpu_run+0x2c69>
    5299:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    52a0:	41 8b 3a             	mov    edi,DWORD PTR [r10]
    52a3:	e9 4a de ff ff       	jmp    30f2 <gpu_run+0x2ca2>
    52a8:	41 8b 3b             	mov    edi,DWORD PTR [r11]
    52ab:	e9 7f dd ff ff       	jmp    302f <gpu_run+0x2bdf>
    52b0:	45 8b 11             	mov    r10d,DWORD PTR [r9]
    52b3:	e9 a2 dd ff ff       	jmp    305a <gpu_run+0x2c0a>
    52b8:	8b 17                	mov    edx,DWORD PTR [rdi]
    52ba:	e9 c5 dd ff ff       	jmp    3084 <gpu_run+0x2c34>
/home/simon/prog/C/EMULATOR/GPU.c:454
					int indx = GPU_ACTIVE_THREAD_INDEXES[--GPU_ACTIVE_THREADS];
					uint32_t spanPC = A[indx].i;
					execSpan *span = getEmptySpan(spanPC);
					span->count += 1;
					span->index[0] = indx;
					while(GPU_ACTIVE_THREADS) {
    52bf:	31 ed                	xor    ebp,ebp
    52c1:	e9 6b ea ff ff       	jmp    3d31 <gpu_run+0x38e1>
/home/simon/prog/C/EMULATOR/GPU.c:456
						indx = GPU_ACTIVE_THREAD_INDEXES[GPU_ACTIVE_THREADS-1];
						if(A[indx].i != spanPC) {
    52c6:	44 89 ed             	mov    ebp,r13d
    52c9:	e9 63 ea ff ff       	jmp    3d31 <gpu_run+0x38e1>
    52ce:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
    52d2:	83 c0 01             	add    eax,0x1
    52d5:	d1 e8                	shr    eax,1
    52d7:	e9 d2 b9 ff ff       	jmp    cae <gpu_run+0x85e>
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    52dc:	45 89 df             	mov    r15d,r11d
    52df:	e9 b7 d3 ff ff       	jmp    269b <gpu_run+0x224b>
    52e4:	44 8b 5c 24 10       	mov    r11d,DWORD PTR [rsp+0x10]
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    52e9:	f3 45 0f 10 36       	movss  xmm14,DWORD PTR [r14]
    52ee:	f3 44 0f 59 31       	mulss  xmm14,DWORD PTR [rcx]
    52f3:	b8 01 00 00 00       	mov    eax,0x1
    52f8:	41 83 eb 01          	sub    r11d,0x1
    52fc:	45 29 fb             	sub    r11d,r15d
    52ff:	49 8d 73 01          	lea    rsi,[r11+0x1]
    5303:	41 83 e3 07          	and    r11d,0x7
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    5307:	48 39 f0             	cmp    rax,rsi
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    530a:	f3 44 0f 11 37       	movss  DWORD PTR [rdi],xmm14
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    530f:	0f 84 5b db ff ff    	je     2e70 <gpu_run+0x2a20>
    5315:	4d 85 db             	test   r11,r11
    5318:	0f 84 c0 00 00 00    	je     53de <gpu_run+0x4f8e>
    531e:	49 83 fb 01          	cmp    r11,0x1
    5322:	0f 84 99 00 00 00    	je     53c1 <gpu_run+0x4f71>
    5328:	49 83 fb 02          	cmp    r11,0x2
    532c:	74 7f                	je     53ad <gpu_run+0x4f5d>
    532e:	49 83 fb 03          	cmp    r11,0x3
    5332:	74 65                	je     5399 <gpu_run+0x4f49>
    5334:	49 83 fb 04          	cmp    r11,0x4
    5338:	74 4b                	je     5385 <gpu_run+0x4f35>
    533a:	49 83 fb 05          	cmp    r11,0x5
    533e:	74 31                	je     5371 <gpu_run+0x4f21>
    5340:	49 83 fb 06          	cmp    r11,0x6
    5344:	74 17                	je     535d <gpu_run+0x4f0d>
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    5346:	f3 45 0f 10 7e 04    	movss  xmm15,DWORD PTR [r14+0x4]
    534c:	b8 02 00 00 00       	mov    eax,0x2
    5351:	f3 44 0f 59 79 04    	mulss  xmm15,DWORD PTR [rcx+0x4]
    5357:	f3 44 0f 11 7f 04    	movss  DWORD PTR [rdi+0x4],xmm15
    535d:	f3 41 0f 10 0c 86    	movss  xmm1,DWORD PTR [r14+rax*4]
    5363:	f3 0f 59 0c 81       	mulss  xmm1,DWORD PTR [rcx+rax*4]
    5368:	f3 0f 11 0c 87       	movss  DWORD PTR [rdi+rax*4],xmm1
    536d:	48 83 c0 01          	add    rax,0x1
    5371:	f3 41 0f 10 04 86    	movss  xmm0,DWORD PTR [r14+rax*4]
    5377:	f3 0f 59 04 81       	mulss  xmm0,DWORD PTR [rcx+rax*4]
    537c:	f3 0f 11 04 87       	movss  DWORD PTR [rdi+rax*4],xmm0
    5381:	48 83 c0 01          	add    rax,0x1
    5385:	f3 41 0f 10 14 86    	movss  xmm2,DWORD PTR [r14+rax*4]
    538b:	f3 0f 59 14 81       	mulss  xmm2,DWORD PTR [rcx+rax*4]
    5390:	f3 0f 11 14 87       	movss  DWORD PTR [rdi+rax*4],xmm2
    5395:	48 83 c0 01          	add    rax,0x1
    5399:	f3 41 0f 10 1c 86    	movss  xmm3,DWORD PTR [r14+rax*4]
    539f:	f3 0f 59 1c 81       	mulss  xmm3,DWORD PTR [rcx+rax*4]
    53a4:	f3 0f 11 1c 87       	movss  DWORD PTR [rdi+rax*4],xmm3
    53a9:	48 83 c0 01          	add    rax,0x1
    53ad:	f3 41 0f 10 24 86    	movss  xmm4,DWORD PTR [r14+rax*4]
    53b3:	f3 0f 59 24 81       	mulss  xmm4,DWORD PTR [rcx+rax*4]
    53b8:	f3 0f 11 24 87       	movss  DWORD PTR [rdi+rax*4],xmm4
    53bd:	48 83 c0 01          	add    rax,0x1
    53c1:	f3 41 0f 10 2c 86    	movss  xmm5,DWORD PTR [r14+rax*4]
    53c7:	f3 0f 59 2c 81       	mulss  xmm5,DWORD PTR [rcx+rax*4]
    53cc:	f3 0f 11 2c 87       	movss  DWORD PTR [rdi+rax*4],xmm5
    53d1:	48 83 c0 01          	add    rax,0x1
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    53d5:	48 39 f0             	cmp    rax,rsi
    53d8:	0f 84 92 da ff ff    	je     2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    53de:	f3 41 0f 10 34 86    	movss  xmm6,DWORD PTR [r14+rax*4]
    53e4:	48 8d 50 01          	lea    rdx,[rax+0x1]
    53e8:	4c 8d 48 02          	lea    r9,[rax+0x2]
    53ec:	f3 0f 59 34 81       	mulss  xmm6,DWORD PTR [rcx+rax*4]
    53f1:	4c 8d 78 03          	lea    r15,[rax+0x3]
    53f5:	48 8d 68 04          	lea    rbp,[rax+0x4]
    53f9:	48 8d 58 05          	lea    rbx,[rax+0x5]
    53fd:	4c 8d 60 06          	lea    r12,[rax+0x6]
    5401:	4c 8d 40 07          	lea    r8,[rax+0x7]
    5405:	f3 0f 11 34 87       	movss  DWORD PTR [rdi+rax*4],xmm6
    540a:	48 83 c0 08          	add    rax,0x8
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    540e:	48 39 f0             	cmp    rax,rsi
/home/simon/prog/C/EMULATOR/GPU.c:414
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    5411:	f3 41 0f 10 3c 96    	movss  xmm7,DWORD PTR [r14+rdx*4]
    5417:	f3 0f 59 3c 91       	mulss  xmm7,DWORD PTR [rcx+rdx*4]
    541c:	f3 0f 11 3c 97       	movss  DWORD PTR [rdi+rdx*4],xmm7
    5421:	f3 47 0f 10 04 8e    	movss  xmm8,DWORD PTR [r14+r9*4]
    5427:	f3 46 0f 59 04 89    	mulss  xmm8,DWORD PTR [rcx+r9*4]
    542d:	f3 46 0f 11 04 8f    	movss  DWORD PTR [rdi+r9*4],xmm8
    5433:	f3 47 0f 10 0c be    	movss  xmm9,DWORD PTR [r14+r15*4]
    5439:	f3 46 0f 59 0c b9    	mulss  xmm9,DWORD PTR [rcx+r15*4]
    543f:	f3 46 0f 11 0c bf    	movss  DWORD PTR [rdi+r15*4],xmm9
    5445:	f3 45 0f 10 14 ae    	movss  xmm10,DWORD PTR [r14+rbp*4]
    544b:	f3 44 0f 59 14 a9    	mulss  xmm10,DWORD PTR [rcx+rbp*4]
    5451:	f3 44 0f 11 14 af    	movss  DWORD PTR [rdi+rbp*4],xmm10
    5457:	f3 45 0f 10 1c 9e    	movss  xmm11,DWORD PTR [r14+rbx*4]
    545d:	f3 44 0f 59 1c 99    	mulss  xmm11,DWORD PTR [rcx+rbx*4]
    5463:	f3 44 0f 11 1c 9f    	movss  DWORD PTR [rdi+rbx*4],xmm11
    5469:	f3 47 0f 10 24 a6    	movss  xmm12,DWORD PTR [r14+r12*4]
    546f:	f3 46 0f 59 24 a1    	mulss  xmm12,DWORD PTR [rcx+r12*4]
    5475:	f3 46 0f 11 24 a7    	movss  DWORD PTR [rdi+r12*4],xmm12
    547b:	f3 47 0f 10 2c 86    	movss  xmm13,DWORD PTR [r14+r8*4]
    5481:	f3 46 0f 59 2c 81    	mulss  xmm13,DWORD PTR [rcx+r8*4]
    5487:	f3 46 0f 11 2c 87    	movss  DWORD PTR [rdi+r8*4],xmm13
/home/simon/prog/C/EMULATOR/GPU.c:408
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
						Av[i] = Bv[i] * Cv[i];
	      			}
					i <<= 2;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS,GPU_CORE_COUNT); ++i) {
    548d:	0f 85 4b ff ff ff    	jne    53de <gpu_run+0x4f8e>
    5493:	e9 d8 d9 ff ff       	jmp    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    5498:	f3 0f 10 04 8d 00 00 	movss  xmm0,DWORD PTR [rcx*4+0x0]
    549f:	00 00 
    54a1:	41 8d 73 ff          	lea    esi,[r11-0x1]
    54a5:	f3 0f 58 04 bd 00 00 	addss  xmm0,DWORD PTR [rdi*4+0x0]
    54ac:	00 00 
    54ae:	b8 01 00 00 00       	mov    eax,0x1
    54b3:	83 e6 07             	and    esi,0x7
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    54b6:	41 83 fb 01          	cmp    r11d,0x1
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    54ba:	f3 42 0f 11 04 85 00 	movss  DWORD PTR [r8*4+0x0],xmm0
    54c1:	00 00 00 
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    54c4:	0f 8e a6 d9 ff ff    	jle    2e70 <gpu_run+0x2a20>
    54ca:	85 f6                	test   esi,esi
    54cc:	0f 84 c1 00 00 00    	je     5593 <gpu_run+0x5143>
    54d2:	83 fe 01             	cmp    esi,0x1
    54d5:	0f 84 98 00 00 00    	je     5573 <gpu_run+0x5123>
    54db:	83 fe 02             	cmp    esi,0x2
    54de:	74 7e                	je     555e <gpu_run+0x510e>
    54e0:	83 fe 03             	cmp    esi,0x3
    54e3:	74 64                	je     5549 <gpu_run+0x50f9>
    54e5:	83 fe 04             	cmp    esi,0x4
    54e8:	74 4a                	je     5534 <gpu_run+0x50e4>
    54ea:	83 fe 05             	cmp    esi,0x5
    54ed:	74 30                	je     551f <gpu_run+0x50cf>
    54ef:	83 fe 06             	cmp    esi,0x6
    54f2:	74 16                	je     550a <gpu_run+0x50ba>
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    54f4:	f3 41 0f 10 54 24 04 	movss  xmm2,DWORD PTR [r12+0x4]
    54fb:	b8 02 00 00 00       	mov    eax,0x2
    5500:	f3 0f 58 55 04       	addss  xmm2,DWORD PTR [rbp+0x4]
    5505:	f3 0f 11 53 04       	movss  DWORD PTR [rbx+0x4],xmm2
    550a:	f3 41 0f 10 1c 84    	movss  xmm3,DWORD PTR [r12+rax*4]
    5510:	f3 0f 58 5c 85 00    	addss  xmm3,DWORD PTR [rbp+rax*4+0x0]
    5516:	f3 0f 11 1c 83       	movss  DWORD PTR [rbx+rax*4],xmm3
    551b:	48 83 c0 01          	add    rax,0x1
    551f:	f3 41 0f 10 24 84    	movss  xmm4,DWORD PTR [r12+rax*4]
    5525:	f3 0f 58 64 85 00    	addss  xmm4,DWORD PTR [rbp+rax*4+0x0]
    552b:	f3 0f 11 24 83       	movss  DWORD PTR [rbx+rax*4],xmm4
    5530:	48 83 c0 01          	add    rax,0x1
    5534:	f3 41 0f 10 2c 84    	movss  xmm5,DWORD PTR [r12+rax*4]
    553a:	f3 0f 58 6c 85 00    	addss  xmm5,DWORD PTR [rbp+rax*4+0x0]
    5540:	f3 0f 11 2c 83       	movss  DWORD PTR [rbx+rax*4],xmm5
    5545:	48 83 c0 01          	add    rax,0x1
    5549:	f3 41 0f 10 34 84    	movss  xmm6,DWORD PTR [r12+rax*4]
    554f:	f3 0f 58 74 85 00    	addss  xmm6,DWORD PTR [rbp+rax*4+0x0]
    5555:	f3 0f 11 34 83       	movss  DWORD PTR [rbx+rax*4],xmm6
    555a:	48 83 c0 01          	add    rax,0x1
    555e:	f3 41 0f 10 3c 84    	movss  xmm7,DWORD PTR [r12+rax*4]
    5564:	f3 0f 58 7c 85 00    	addss  xmm7,DWORD PTR [rbp+rax*4+0x0]
    556a:	f3 0f 11 3c 83       	movss  DWORD PTR [rbx+rax*4],xmm7
    556f:	48 83 c0 01          	add    rax,0x1
    5573:	f3 45 0f 10 04 84    	movss  xmm8,DWORD PTR [r12+rax*4]
    5579:	f3 44 0f 58 44 85 00 	addss  xmm8,DWORD PTR [rbp+rax*4+0x0]
    5580:	f3 44 0f 11 04 83    	movss  DWORD PTR [rbx+rax*4],xmm8
    5586:	48 83 c0 01          	add    rax,0x1
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    558a:	41 39 c3             	cmp    r11d,eax
    558d:	0f 8e dd d8 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    5593:	f3 45 0f 10 0c 84    	movss  xmm9,DWORD PTR [r12+rax*4]
    5599:	48 8d 50 01          	lea    rdx,[rax+0x1]
    559d:	4c 8d 70 02          	lea    r14,[rax+0x2]
    55a1:	f3 44 0f 58 4c 85 00 	addss  xmm9,DWORD PTR [rbp+rax*4+0x0]
    55a8:	4c 8d 78 03          	lea    r15,[rax+0x3]
    55ac:	48 8d 78 04          	lea    rdi,[rax+0x4]
    55b0:	4c 8d 40 05          	lea    r8,[rax+0x5]
    55b4:	4c 8d 50 06          	lea    r10,[rax+0x6]
    55b8:	48 8d 48 07          	lea    rcx,[rax+0x7]
    55bc:	f3 44 0f 11 0c 83    	movss  DWORD PTR [rbx+rax*4],xmm9
    55c2:	48 83 c0 08          	add    rax,0x8
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    55c6:	41 39 c3             	cmp    r11d,eax
/home/simon/prog/C/EMULATOR/GPU.c:387
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    55c9:	f3 45 0f 10 14 94    	movss  xmm10,DWORD PTR [r12+rdx*4]
    55cf:	f3 44 0f 58 54 95 00 	addss  xmm10,DWORD PTR [rbp+rdx*4+0x0]
    55d6:	f3 44 0f 11 14 93    	movss  DWORD PTR [rbx+rdx*4],xmm10
    55dc:	f3 47 0f 10 1c b4    	movss  xmm11,DWORD PTR [r12+r14*4]
    55e2:	f3 46 0f 58 5c b5 00 	addss  xmm11,DWORD PTR [rbp+r14*4+0x0]
    55e9:	f3 46 0f 11 1c b3    	movss  DWORD PTR [rbx+r14*4],xmm11
    55ef:	f3 47 0f 10 24 bc    	movss  xmm12,DWORD PTR [r12+r15*4]
    55f5:	f3 46 0f 58 64 bd 00 	addss  xmm12,DWORD PTR [rbp+r15*4+0x0]
    55fc:	f3 46 0f 11 24 bb    	movss  DWORD PTR [rbx+r15*4],xmm12
    5602:	f3 45 0f 10 2c bc    	movss  xmm13,DWORD PTR [r12+rdi*4]
    5608:	f3 44 0f 58 6c bd 00 	addss  xmm13,DWORD PTR [rbp+rdi*4+0x0]
    560f:	f3 44 0f 11 2c bb    	movss  DWORD PTR [rbx+rdi*4],xmm13
    5615:	f3 47 0f 10 34 84    	movss  xmm14,DWORD PTR [r12+r8*4]
    561b:	f3 46 0f 58 74 85 00 	addss  xmm14,DWORD PTR [rbp+r8*4+0x0]
    5622:	f3 46 0f 11 34 83    	movss  DWORD PTR [rbx+r8*4],xmm14
    5628:	f3 47 0f 10 3c 94    	movss  xmm15,DWORD PTR [r12+r10*4]
    562e:	f3 46 0f 58 7c 95 00 	addss  xmm15,DWORD PTR [rbp+r10*4+0x0]
    5635:	f3 46 0f 11 3c 93    	movss  DWORD PTR [rbx+r10*4],xmm15
    563b:	f3 41 0f 10 0c 8c    	movss  xmm1,DWORD PTR [r12+rcx*4]
    5641:	f3 0f 58 4c 8d 00    	addss  xmm1,DWORD PTR [rbp+rcx*4+0x0]
    5647:	f3 0f 11 0c 8b       	movss  DWORD PTR [rbx+rcx*4],xmm1
/home/simon/prog/C/EMULATOR/GPU.c:381
				}
				break;
			case GPUOP_FADD://float add
				cycles += 1;
				//#pragma GCC unroll REGCOUNT
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    564c:	0f 8f 41 ff ff ff    	jg     5593 <gpu_run+0x5143>
    5652:	e9 19 d8 ff ff       	jmp    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    5657:	8b 04 bd 00 00 00 00 	mov    eax,DWORD PTR [rdi*4+0x0]
    565e:	03 04 8d 00 00 00 00 	add    eax,DWORD PTR [rcx*4+0x0]
    5665:	45 8d 4b ff          	lea    r9d,[r11-0x1]
    5669:	41 83 e1 07          	and    r9d,0x7
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    566d:	41 83 fb 01          	cmp    r11d,0x1
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    5671:	42 89 04 85 00 00 00 	mov    DWORD PTR [r8*4+0x0],eax
    5678:	00 
    5679:	41 b8 01 00 00 00    	mov    r8d,0x1
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    567f:	0f 8e eb d7 ff ff    	jle    2e70 <gpu_run+0x2a20>
    5685:	45 85 c9             	test   r9d,r9d
    5688:	0f 84 a8 00 00 00    	je     5736 <gpu_run+0x52e6>
    568e:	41 83 f9 01          	cmp    r9d,0x1
    5692:	0f 84 84 00 00 00    	je     571c <gpu_run+0x52cc>
    5698:	41 83 f9 02          	cmp    r9d,0x2
    569c:	74 6d                	je     570b <gpu_run+0x52bb>
    569e:	41 83 f9 03          	cmp    r9d,0x3
    56a2:	74 56                	je     56fa <gpu_run+0x52aa>
    56a4:	41 83 f9 04          	cmp    r9d,0x4
    56a8:	74 3f                	je     56e9 <gpu_run+0x5299>
    56aa:	41 83 f9 05          	cmp    r9d,0x5
    56ae:	74 28                	je     56d8 <gpu_run+0x5288>
    56b0:	41 83 f9 06          	cmp    r9d,0x6
    56b4:	74 11                	je     56c7 <gpu_run+0x5277>
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    56b6:	8b 7d 04             	mov    edi,DWORD PTR [rbp+0x4]
    56b9:	41 03 7c 24 04       	add    edi,DWORD PTR [r12+0x4]
    56be:	41 b8 02 00 00 00    	mov    r8d,0x2
    56c4:	89 7b 04             	mov    DWORD PTR [rbx+0x4],edi
    56c7:	42 8b 4c 85 00       	mov    ecx,DWORD PTR [rbp+r8*4+0x0]
    56cc:	43 03 0c 84          	add    ecx,DWORD PTR [r12+r8*4]
    56d0:	42 89 0c 83          	mov    DWORD PTR [rbx+r8*4],ecx
    56d4:	49 83 c0 01          	add    r8,0x1
    56d8:	46 8b 54 85 00       	mov    r10d,DWORD PTR [rbp+r8*4+0x0]
    56dd:	47 03 14 84          	add    r10d,DWORD PTR [r12+r8*4]
    56e1:	46 89 14 83          	mov    DWORD PTR [rbx+r8*4],r10d
    56e5:	49 83 c0 01          	add    r8,0x1
    56e9:	46 8b 74 85 00       	mov    r14d,DWORD PTR [rbp+r8*4+0x0]
    56ee:	47 03 34 84          	add    r14d,DWORD PTR [r12+r8*4]
    56f2:	46 89 34 83          	mov    DWORD PTR [rbx+r8*4],r14d
    56f6:	49 83 c0 01          	add    r8,0x1
    56fa:	46 8b 7c 85 00       	mov    r15d,DWORD PTR [rbp+r8*4+0x0]
    56ff:	47 03 3c 84          	add    r15d,DWORD PTR [r12+r8*4]
    5703:	46 89 3c 83          	mov    DWORD PTR [rbx+r8*4],r15d
    5707:	49 83 c0 01          	add    r8,0x1
    570b:	42 8b 74 85 00       	mov    esi,DWORD PTR [rbp+r8*4+0x0]
    5710:	43 03 34 84          	add    esi,DWORD PTR [r12+r8*4]
    5714:	42 89 34 83          	mov    DWORD PTR [rbx+r8*4],esi
    5718:	49 83 c0 01          	add    r8,0x1
    571c:	42 8b 54 85 00       	mov    edx,DWORD PTR [rbp+r8*4+0x0]
    5721:	43 03 14 84          	add    edx,DWORD PTR [r12+r8*4]
    5725:	42 89 14 83          	mov    DWORD PTR [rbx+r8*4],edx
    5729:	49 83 c0 01          	add    r8,0x1
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    572d:	45 39 c3             	cmp    r11d,r8d
    5730:	0f 8e 3a d7 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    5736:	46 8b 4c 85 00       	mov    r9d,DWORD PTR [rbp+r8*4+0x0]
    573b:	47 03 0c 84          	add    r9d,DWORD PTR [r12+r8*4]
    573f:	49 8d 40 01          	lea    rax,[r8+0x1]
    5743:	4d 8d 50 02          	lea    r10,[r8+0x2]
    5747:	4d 8d 70 03          	lea    r14,[r8+0x3]
    574b:	49 8d 70 04          	lea    rsi,[r8+0x4]
    574f:	46 89 0c 83          	mov    DWORD PTR [rbx+r8*4],r9d
    5753:	8b 7c 85 00          	mov    edi,DWORD PTR [rbp+rax*4+0x0]
    5757:	4d 8d 48 05          	lea    r9,[r8+0x5]
    575b:	41 03 3c 84          	add    edi,DWORD PTR [r12+rax*4]
    575f:	89 3c 83             	mov    DWORD PTR [rbx+rax*4],edi
    5762:	42 8b 4c 95 00       	mov    ecx,DWORD PTR [rbp+r10*4+0x0]
    5767:	49 8d 78 06          	lea    rdi,[r8+0x6]
    576b:	43 03 0c 94          	add    ecx,DWORD PTR [r12+r10*4]
    576f:	42 89 0c 93          	mov    DWORD PTR [rbx+r10*4],ecx
    5773:	46 8b 7c b5 00       	mov    r15d,DWORD PTR [rbp+r14*4+0x0]
    5778:	47 03 3c b4          	add    r15d,DWORD PTR [r12+r14*4]
    577c:	46 89 3c b3          	mov    DWORD PTR [rbx+r14*4],r15d
    5780:	8b 54 b5 00          	mov    edx,DWORD PTR [rbp+rsi*4+0x0]
    5784:	4d 8d 70 07          	lea    r14,[r8+0x7]
    5788:	41 03 14 b4          	add    edx,DWORD PTR [r12+rsi*4]
    578c:	49 83 c0 08          	add    r8,0x8
    5790:	89 14 b3             	mov    DWORD PTR [rbx+rsi*4],edx
    5793:	42 8b 44 8d 00       	mov    eax,DWORD PTR [rbp+r9*4+0x0]
    5798:	43 03 04 8c          	add    eax,DWORD PTR [r12+r9*4]
    579c:	42 89 04 8b          	mov    DWORD PTR [rbx+r9*4],eax
    57a0:	44 8b 54 bd 00       	mov    r10d,DWORD PTR [rbp+rdi*4+0x0]
    57a5:	45 03 14 bc          	add    r10d,DWORD PTR [r12+rdi*4]
    57a9:	44 89 14 bb          	mov    DWORD PTR [rbx+rdi*4],r10d
    57ad:	42 8b 4c b5 00       	mov    ecx,DWORD PTR [rbp+r14*4+0x0]
    57b2:	43 03 0c b4          	add    ecx,DWORD PTR [r12+r14*4]
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    57b6:	45 39 c3             	cmp    r11d,r8d
/home/simon/prog/C/EMULATOR/GPU.c:209
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    57b9:	42 89 0c b3          	mov    DWORD PTR [rbx+r14*4],ecx
/home/simon/prog/C/EMULATOR/GPU.c:203
		GPU_REGISTER * __restrict__ C  = __builtin_assume_aligned(gpu_registers+(((inst >>16) & 31)*GPU_CORE_COUNT),16);

		switch((inst >> 10) & 63) {
			case GPUOP_ADD:
				cycles += 1;
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    57bd:	0f 8f 73 ff ff ff    	jg     5736 <gpu_run+0x52e6>
    57c3:	e9 a8 d6 ff ff       	jmp    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:353
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
						A[i].i = (B[i].i >> shift) & mask;
    57c8:	8b 04 bd 00 00 00 00 	mov    eax,DWORD PTR [rdi*4+0x0]
    57cf:	45 8d 4a ff          	lea    r9d,[r10-0x1]
    57d3:	41 83 e1 07          	and    r9d,0x7
    57d7:	d3 e8                	shr    eax,cl
    57d9:	44 21 d8             	and    eax,r11d
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    57dc:	41 83 fa 01          	cmp    r10d,0x1
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    57e0:	42 89 04 85 00 00 00 	mov    DWORD PTR [r8*4+0x0],eax
    57e7:	00 
    57e8:	41 b8 01 00 00 00    	mov    r8d,0x1
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    57ee:	0f 8e 7c d6 ff ff    	jle    2e70 <gpu_run+0x2a20>
    57f4:	45 85 c9             	test   r9d,r9d
    57f7:	0f 84 b2 00 00 00    	je     58af <gpu_run+0x545f>
    57fd:	41 83 f9 01          	cmp    r9d,0x1
    5801:	0f 84 8c 00 00 00    	je     5893 <gpu_run+0x5443>
    5807:	41 83 f9 02          	cmp    r9d,0x2
    580b:	74 74                	je     5881 <gpu_run+0x5431>
    580d:	41 83 f9 03          	cmp    r9d,0x3
    5811:	74 5b                	je     586e <gpu_run+0x541e>
    5813:	41 83 f9 04          	cmp    r9d,0x4
    5817:	74 42                	je     585b <gpu_run+0x540b>
    5819:	41 83 f9 05          	cmp    r9d,0x5
    581d:	74 29                	je     5848 <gpu_run+0x53f8>
    581f:	41 83 f9 06          	cmp    r9d,0x6
    5823:	74 11                	je     5836 <gpu_run+0x53e6>
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    5825:	8b 7d 04             	mov    edi,DWORD PTR [rbp+0x4]
    5828:	41 b8 02 00 00 00    	mov    r8d,0x2
    582e:	d3 ef                	shr    edi,cl
    5830:	44 21 df             	and    edi,r11d
    5833:	89 7b 04             	mov    DWORD PTR [rbx+0x4],edi
    5836:	42 8b 74 85 00       	mov    esi,DWORD PTR [rbp+r8*4+0x0]
    583b:	d3 ee                	shr    esi,cl
    583d:	44 21 de             	and    esi,r11d
    5840:	42 89 34 83          	mov    DWORD PTR [rbx+r8*4],esi
    5844:	49 83 c0 01          	add    r8,0x1
    5848:	46 8b 74 85 00       	mov    r14d,DWORD PTR [rbp+r8*4+0x0]
    584d:	41 d3 ee             	shr    r14d,cl
    5850:	45 21 de             	and    r14d,r11d
    5853:	46 89 34 83          	mov    DWORD PTR [rbx+r8*4],r14d
    5857:	49 83 c0 01          	add    r8,0x1
    585b:	46 8b 7c 85 00       	mov    r15d,DWORD PTR [rbp+r8*4+0x0]
    5860:	41 d3 ef             	shr    r15d,cl
    5863:	45 21 df             	and    r15d,r11d
    5866:	46 89 3c 83          	mov    DWORD PTR [rbx+r8*4],r15d
    586a:	49 83 c0 01          	add    r8,0x1
    586e:	46 8b 64 85 00       	mov    r12d,DWORD PTR [rbp+r8*4+0x0]
    5873:	41 d3 ec             	shr    r12d,cl
    5876:	45 21 dc             	and    r12d,r11d
    5879:	46 89 24 83          	mov    DWORD PTR [rbx+r8*4],r12d
    587d:	49 83 c0 01          	add    r8,0x1
    5881:	42 8b 54 85 00       	mov    edx,DWORD PTR [rbp+r8*4+0x0]
    5886:	d3 ea                	shr    edx,cl
    5888:	44 21 da             	and    edx,r11d
    588b:	42 89 14 83          	mov    DWORD PTR [rbx+r8*4],edx
    588f:	49 83 c0 01          	add    r8,0x1
    5893:	46 8b 4c 85 00       	mov    r9d,DWORD PTR [rbp+r8*4+0x0]
    5898:	41 d3 e9             	shr    r9d,cl
    589b:	45 21 d9             	and    r9d,r11d
    589e:	46 89 0c 83          	mov    DWORD PTR [rbx+r8*4],r9d
    58a2:	49 83 c0 01          	add    r8,0x1
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    58a6:	45 39 c2             	cmp    r10d,r8d
    58a9:	0f 8e c1 d5 ff ff    	jle    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    58af:	42 8b 44 85 00       	mov    eax,DWORD PTR [rbp+r8*4+0x0]
    58b4:	49 8d 78 01          	lea    rdi,[r8+0x1]
    58b8:	4d 8d 70 02          	lea    r14,[r8+0x2]
    58bc:	4d 8d 60 03          	lea    r12,[r8+0x3]
    58c0:	4d 8d 48 04          	lea    r9,[r8+0x4]
    58c4:	d3 e8                	shr    eax,cl
    58c6:	44 21 d8             	and    eax,r11d
    58c9:	42 89 04 83          	mov    DWORD PTR [rbx+r8*4],eax
    58cd:	8b 74 bd 00          	mov    esi,DWORD PTR [rbp+rdi*4+0x0]
    58d1:	d3 ee                	shr    esi,cl
    58d3:	44 21 de             	and    esi,r11d
    58d6:	89 34 bb             	mov    DWORD PTR [rbx+rdi*4],esi
    58d9:	46 8b 7c b5 00       	mov    r15d,DWORD PTR [rbp+r14*4+0x0]
    58de:	49 8d 78 05          	lea    rdi,[r8+0x5]
    58e2:	41 d3 ef             	shr    r15d,cl
    58e5:	45 21 df             	and    r15d,r11d
    58e8:	46 89 3c b3          	mov    DWORD PTR [rbx+r14*4],r15d
    58ec:	42 8b 54 a5 00       	mov    edx,DWORD PTR [rbp+r12*4+0x0]
    58f1:	4d 8d 70 06          	lea    r14,[r8+0x6]
    58f5:	d3 ea                	shr    edx,cl
    58f7:	44 21 da             	and    edx,r11d
    58fa:	42 89 14 a3          	mov    DWORD PTR [rbx+r12*4],edx
    58fe:	42 8b 44 8d 00       	mov    eax,DWORD PTR [rbp+r9*4+0x0]
    5903:	4d 8d 60 07          	lea    r12,[r8+0x7]
    5907:	49 83 c0 08          	add    r8,0x8
    590b:	d3 e8                	shr    eax,cl
    590d:	44 21 d8             	and    eax,r11d
    5910:	42 89 04 8b          	mov    DWORD PTR [rbx+r9*4],eax
    5914:	8b 74 bd 00          	mov    esi,DWORD PTR [rbp+rdi*4+0x0]
    5918:	d3 ee                	shr    esi,cl
    591a:	44 21 de             	and    esi,r11d
    591d:	89 34 bb             	mov    DWORD PTR [rbx+rdi*4],esi
    5920:	46 8b 7c b5 00       	mov    r15d,DWORD PTR [rbp+r14*4+0x0]
    5925:	41 d3 ef             	shr    r15d,cl
    5928:	45 21 df             	and    r15d,r11d
    592b:	46 89 3c b3          	mov    DWORD PTR [rbx+r14*4],r15d
    592f:	42 8b 54 a5 00       	mov    edx,DWORD PTR [rbp+r12*4+0x0]
    5934:	d3 ea                	shr    edx,cl
    5936:	44 21 da             	and    edx,r11d
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    5939:	45 39 c2             	cmp    r10d,r8d
/home/simon/prog/C/EMULATOR/GPU.c:353
						A[i].i = (B[i].i >> shift) & mask;
    593c:	42 89 14 a3          	mov    DWORD PTR [rbx+r12*4],edx
/home/simon/prog/C/EMULATOR/GPU.c:352
			case CPUOP_SAM:
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    5940:	0f 8f 69 ff ff ff    	jg     58af <gpu_run+0x545f>
    5946:	e9 25 d5 ff ff       	jmp    2e70 <gpu_run+0x2a20>
    594b:	45 8d 4a ff          	lea    r9d,[r10-0x1]
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    594f:	f3 0f 2c 04 bd 00 00 	cvttss2si eax,DWORD PTR [rdi*4+0x0]
    5956:	00 00 
    5958:	41 bf 01 00 00 00    	mov    r15d,0x1
    595e:	42 89 04 85 00 00 00 	mov    DWORD PTR [r8*4+0x0],eax
    5965:	00 
    5966:	41 83 e1 07          	and    r9d,0x7
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    596a:	41 83 fa 01          	cmp    r10d,0x1
    596e:	0f 8e fc d4 ff ff    	jle    2e70 <gpu_run+0x2a20>
    5974:	45 85 c9             	test   r9d,r9d
    5977:	0f 84 97 00 00 00    	je     5a14 <gpu_run+0x55c4>
    597d:	41 83 f9 01          	cmp    r9d,0x1
    5981:	74 79                	je     59fc <gpu_run+0x55ac>
    5983:	41 83 f9 02          	cmp    r9d,0x2
    5987:	74 64                	je     59ed <gpu_run+0x559d>
    5989:	41 83 f9 03          	cmp    r9d,0x3
    598d:	74 4f                	je     59de <gpu_run+0x558e>
    598f:	41 83 f9 04          	cmp    r9d,0x4
    5993:	74 3a                	je     59cf <gpu_run+0x557f>
    5995:	41 83 f9 05          	cmp    r9d,0x5
    5999:	74 25                	je     59c0 <gpu_run+0x5570>
    599b:	41 83 f9 06          	cmp    r9d,0x6
    599f:	74 10                	je     59b1 <gpu_run+0x5561>
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    59a1:	f3 44 0f 2c 45 04    	cvttss2si r8d,DWORD PTR [rbp+0x4]
    59a7:	41 bf 02 00 00 00    	mov    r15d,0x2
    59ad:	44 89 43 04          	mov    DWORD PTR [rbx+0x4],r8d
    59b1:	f3 46 0f 2c 5c bd 00 	cvttss2si r11d,DWORD PTR [rbp+r15*4+0x0]
    59b8:	46 89 1c bb          	mov    DWORD PTR [rbx+r15*4],r11d
    59bc:	49 83 c7 01          	add    r15,0x1
    59c0:	f3 42 0f 2c 7c bd 00 	cvttss2si edi,DWORD PTR [rbp+r15*4+0x0]
    59c7:	42 89 3c bb          	mov    DWORD PTR [rbx+r15*4],edi
    59cb:	49 83 c7 01          	add    r15,0x1
    59cf:	f3 42 0f 2c 4c bd 00 	cvttss2si ecx,DWORD PTR [rbp+r15*4+0x0]
    59d6:	42 89 0c bb          	mov    DWORD PTR [rbx+r15*4],ecx
    59da:	49 83 c7 01          	add    r15,0x1
    59de:	f3 42 0f 2c 74 bd 00 	cvttss2si esi,DWORD PTR [rbp+r15*4+0x0]
    59e5:	42 89 34 bb          	mov    DWORD PTR [rbx+r15*4],esi
    59e9:	49 83 c7 01          	add    r15,0x1
    59ed:	f3 46 0f 2c 64 bd 00 	cvttss2si r12d,DWORD PTR [rbp+r15*4+0x0]
    59f4:	46 89 24 bb          	mov    DWORD PTR [rbx+r15*4],r12d
    59f8:	49 83 c7 01          	add    r15,0x1
    59fc:	f3 46 0f 2c 74 bd 00 	cvttss2si r14d,DWORD PTR [rbp+r15*4+0x0]
    5a03:	46 89 34 bb          	mov    DWORD PTR [rbx+r15*4],r14d
    5a07:	49 83 c7 01          	add    r15,0x1
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    5a0b:	45 39 fa             	cmp    r10d,r15d
    5a0e:	0f 8e 5c d4 ff ff    	jle    2e70 <gpu_run+0x2a20>
    5a14:	4d 8d 4f 01          	lea    r9,[r15+0x1]
    5a18:	4d 8d 47 02          	lea    r8,[r15+0x2]
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    5a1c:	f3 42 0f 2c 54 bd 00 	cvttss2si edx,DWORD PTR [rbp+r15*4+0x0]
    5a23:	49 8d 7f 03          	lea    rdi,[r15+0x3]
    5a27:	42 89 14 bb          	mov    DWORD PTR [rbx+r15*4],edx
    5a2b:	49 8d 77 04          	lea    rsi,[r15+0x4]
    5a2f:	f3 42 0f 2c 44 8d 00 	cvttss2si eax,DWORD PTR [rbp+r9*4+0x0]
    5a36:	f3 46 0f 2c 5c 85 00 	cvttss2si r11d,DWORD PTR [rbp+r8*4+0x0]
    5a3d:	42 89 04 8b          	mov    DWORD PTR [rbx+r9*4],eax
    5a41:	4d 8d 77 05          	lea    r14,[r15+0x5]
    5a45:	46 89 1c 83          	mov    DWORD PTR [rbx+r8*4],r11d
    5a49:	4d 8d 4f 06          	lea    r9,[r15+0x6]
    5a4d:	4d 8d 47 07          	lea    r8,[r15+0x7]
    5a51:	49 83 c7 08          	add    r15,0x8
    5a55:	f3 0f 2c 4c bd 00    	cvttss2si ecx,DWORD PTR [rbp+rdi*4+0x0]
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    5a5b:	45 39 fa             	cmp    r10d,r15d
/home/simon/prog/C/EMULATOR/GPU.c:368
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    5a5e:	89 0c bb             	mov    DWORD PTR [rbx+rdi*4],ecx
    5a61:	f3 44 0f 2c 64 b5 00 	cvttss2si r12d,DWORD PTR [rbp+rsi*4+0x0]
    5a68:	f3 42 0f 2c 54 b5 00 	cvttss2si edx,DWORD PTR [rbp+r14*4+0x0]
    5a6f:	44 89 24 b3          	mov    DWORD PTR [rbx+rsi*4],r12d
    5a73:	f3 42 0f 2c 44 8d 00 	cvttss2si eax,DWORD PTR [rbp+r9*4+0x0]
    5a7a:	42 89 14 b3          	mov    DWORD PTR [rbx+r14*4],edx
    5a7e:	f3 46 0f 2c 5c 85 00 	cvttss2si r11d,DWORD PTR [rbp+r8*4+0x0]
    5a85:	42 89 04 8b          	mov    DWORD PTR [rbx+r9*4],eax
    5a89:	46 89 1c 83          	mov    DWORD PTR [rbx+r8*4],r11d
/home/simon/prog/C/EMULATOR/GPU.c:362
			//******************************************************************
			//floating point instructions begin here
			//******************************************************************
			case GPUOP_FTOI://float to int
	    		cycles += 1;//9-20 on pentium FRNDINT, 6 in FIST
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    5a8d:	7f 85                	jg     5a14 <gpu_run+0x55c4>
    5a8f:	e9 dc d3 ff ff       	jmp    2e70 <gpu_run+0x2a20>
/home/simon/prog/C/EMULATOR/GPU.c:512
						} else if(((addr^lastAddr) & 0xfffffff8) == lastAddr) {//both were merged into one write
							if(merged) {
								merged = false;
								tmpCycles += 1;
							} else {
								merged = true;
    5a94:	41 b8 01 00 00 00    	mov    r8d,0x1
    5a9a:	e9 44 f7 ff ff       	jmp    51e3 <gpu_run+0x4d93>
/home/simon/prog/C/EMULATOR/GPU.c:353 (discriminator 3)
				cycles += 1;
				{
					uint32_t shift = (inst & 0x001f0000)>>16;
					uint32_t mask = (inst & 0xffe00000)>>21;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
						A[i].i = (B[i].i >> shift) & mask;
    5a9f:	89 4c 24 10          	mov    DWORD PTR [rsp+0x10],ecx
    5aa3:	41 83 c1 08          	add    r9d,0x8
    5aa7:	66 0f 6f 5c 3d 00    	movdqa xmm3,XMMWORD PTR [rbp+rdi*1+0x0]
    5aad:	66 0f 6e 64 24 10    	movd   xmm4,DWORD PTR [rsp+0x10]
    5ab3:	66 0f d2 dc          	psrld  xmm3,xmm4
    5ab7:	66 41 0f db d8       	pand   xmm3,xmm8
    5abc:	0f 29 1c 3b          	movaps XMMWORD PTR [rbx+rdi*1],xmm3
    5ac0:	66 0f 6f 74 3d 10    	movdqa xmm6,XMMWORD PTR [rbp+rdi*1+0x10]
    5ac6:	66 0f d2 f4          	psrld  xmm6,xmm4
    5aca:	66 41 0f db f0       	pand   xmm6,xmm8
    5acf:	0f 29 74 3b 10       	movaps XMMWORD PTR [rbx+rdi*1+0x10],xmm6
    5ad4:	66 0f 6f 7c 3d 20    	movdqa xmm7,XMMWORD PTR [rbp+rdi*1+0x20]
    5ada:	66 0f d2 fc          	psrld  xmm7,xmm4
    5ade:	66 41 0f db f8       	pand   xmm7,xmm8
    5ae3:	0f 29 7c 3b 20       	movaps XMMWORD PTR [rbx+rdi*1+0x20],xmm7
    5ae8:	66 44 0f 6f 54 3d 30 	movdqa xmm10,XMMWORD PTR [rbp+rdi*1+0x30]
    5aef:	66 44 0f d2 d4       	psrld  xmm10,xmm4
    5af4:	66 45 0f db d0       	pand   xmm10,xmm8
    5af9:	44 0f 29 54 3b 30    	movaps XMMWORD PTR [rbx+rdi*1+0x30],xmm10
    5aff:	66 44 0f 6f 64 3d 40 	movdqa xmm12,XMMWORD PTR [rbp+rdi*1+0x40]
    5b06:	66 44 0f d2 e4       	psrld  xmm12,xmm4
    5b0b:	66 45 0f db e0       	pand   xmm12,xmm8
    5b10:	44 0f 29 64 3b 40    	movaps XMMWORD PTR [rbx+rdi*1+0x40],xmm12
    5b16:	66 44 0f 6f 6c 3d 50 	movdqa xmm13,XMMWORD PTR [rbp+rdi*1+0x50]
    5b1d:	66 44 0f d2 ec       	psrld  xmm13,xmm4
    5b22:	66 45 0f db e8       	pand   xmm13,xmm8
    5b27:	44 0f 29 6c 3b 50    	movaps XMMWORD PTR [rbx+rdi*1+0x50],xmm13
    5b2d:	66 44 0f 6f 74 3d 60 	movdqa xmm14,XMMWORD PTR [rbp+rdi*1+0x60]
    5b34:	66 44 0f d2 f4       	psrld  xmm14,xmm4
    5b39:	66 45 0f db f0       	pand   xmm14,xmm8
    5b3e:	44 0f 29 74 3b 60    	movaps XMMWORD PTR [rbx+rdi*1+0x60],xmm14
    5b44:	66 44 0f 6f 7c 3d 70 	movdqa xmm15,XMMWORD PTR [rbp+rdi*1+0x70]
    5b4b:	66 44 0f d2 fc       	psrld  xmm15,xmm4
    5b50:	66 45 0f db f8       	pand   xmm15,xmm8
    5b55:	44 0f 29 7c 3b 70    	movaps XMMWORD PTR [rbx+rdi*1+0x70],xmm15
    5b5b:	48 83 ef 80          	sub    rdi,0xffffffffffffff80
    5b5f:	45 39 cc             	cmp    r12d,r9d
    5b62:	0f 87 37 ff ff ff    	ja     5a9f <gpu_run+0x564f>
    5b68:	e9 59 c2 ff ff       	jmp    1dc6 <gpu_run+0x1976>
/home/simon/prog/C/EMULATOR/GPU.c:387 (discriminator 3)
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
					A[indx].f = B[indx].f + C[indx].f;*/
					//if(i == 0) {
					//	printf("%i = %i(%f) + %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f+C[i].f);
					//}
					A[i].f = B[i].f + C[i].f;
    5b6d:	43 0f 28 34 04       	movaps xmm6,XMMWORD PTR [r12+r8*1]
    5b72:	83 c7 08             	add    edi,0x8
    5b75:	42 0f 58 74 05 00    	addps  xmm6,XMMWORD PTR [rbp+r8*1+0x0]
    5b7b:	42 0f 29 34 03       	movaps XMMWORD PTR [rbx+r8*1],xmm6
    5b80:	43 0f 28 7c 04 10    	movaps xmm7,XMMWORD PTR [r12+r8*1+0x10]
    5b86:	42 0f 58 7c 05 10    	addps  xmm7,XMMWORD PTR [rbp+r8*1+0x10]
    5b8c:	42 0f 29 7c 03 10    	movaps XMMWORD PTR [rbx+r8*1+0x10],xmm7
    5b92:	47 0f 28 44 04 20    	movaps xmm8,XMMWORD PTR [r12+r8*1+0x20]
    5b98:	46 0f 58 44 05 20    	addps  xmm8,XMMWORD PTR [rbp+r8*1+0x20]
    5b9e:	46 0f 29 44 03 20    	movaps XMMWORD PTR [rbx+r8*1+0x20],xmm8
    5ba4:	47 0f 28 4c 04 30    	movaps xmm9,XMMWORD PTR [r12+r8*1+0x30]
    5baa:	46 0f 58 4c 05 30    	addps  xmm9,XMMWORD PTR [rbp+r8*1+0x30]
    5bb0:	46 0f 29 4c 03 30    	movaps XMMWORD PTR [rbx+r8*1+0x30],xmm9
    5bb6:	47 0f 28 54 04 40    	movaps xmm10,XMMWORD PTR [r12+r8*1+0x40]
    5bbc:	46 0f 58 54 05 40    	addps  xmm10,XMMWORD PTR [rbp+r8*1+0x40]
    5bc2:	46 0f 29 54 03 40    	movaps XMMWORD PTR [rbx+r8*1+0x40],xmm10
    5bc8:	47 0f 28 5c 04 50    	movaps xmm11,XMMWORD PTR [r12+r8*1+0x50]
    5bce:	46 0f 58 5c 05 50    	addps  xmm11,XMMWORD PTR [rbp+r8*1+0x50]
    5bd4:	46 0f 29 5c 03 50    	movaps XMMWORD PTR [rbx+r8*1+0x50],xmm11
    5bda:	47 0f 28 64 04 60    	movaps xmm12,XMMWORD PTR [r12+r8*1+0x60]
    5be0:	46 0f 58 64 05 60    	addps  xmm12,XMMWORD PTR [rbp+r8*1+0x60]
    5be6:	46 0f 29 64 03 60    	movaps XMMWORD PTR [rbx+r8*1+0x60],xmm12
    5bec:	47 0f 28 6c 04 70    	movaps xmm13,XMMWORD PTR [r12+r8*1+0x70]
    5bf2:	46 0f 58 6c 05 70    	addps  xmm13,XMMWORD PTR [rbp+r8*1+0x70]
    5bf8:	46 0f 29 6c 03 70    	movaps XMMWORD PTR [rbx+r8*1+0x70],xmm13
    5bfe:	49 83 e8 80          	sub    r8,0xffffffffffffff80
    5c02:	41 39 ff             	cmp    r15d,edi
    5c05:	0f 87 62 ff ff ff    	ja     5b6d <gpu_run+0x571d>
    5c0b:	e9 59 ba ff ff       	jmp    1669 <gpu_run+0x1219>
    5c10:	41 83 c0 08          	add    r8d,0x8
/home/simon/prog/C/EMULATOR/GPU.c:368 (discriminator 3)
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = (uint32_t)(int32_t)B[indx].f;*/
					//if(i == 0) {
					//	printf("%i = (int)%i(%f) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)B[i].f);
					//}
					A[i].i = (uint32_t)(int32_t)B[i].f;
    5c14:	f3 46 0f 5b 4c 3d 00 	cvttps2dq xmm9,XMMWORD PTR [rbp+r15*1+0x0]
    5c1b:	f3 46 0f 5b 54 3d 10 	cvttps2dq xmm10,XMMWORD PTR [rbp+r15*1+0x10]
    5c22:	f3 46 0f 5b 5c 3d 20 	cvttps2dq xmm11,XMMWORD PTR [rbp+r15*1+0x20]
    5c29:	f3 46 0f 5b 64 3d 30 	cvttps2dq xmm12,XMMWORD PTR [rbp+r15*1+0x30]
    5c30:	f3 46 0f 5b 6c 3d 40 	cvttps2dq xmm13,XMMWORD PTR [rbp+r15*1+0x40]
    5c37:	f3 46 0f 5b 74 3d 50 	cvttps2dq xmm14,XMMWORD PTR [rbp+r15*1+0x50]
    5c3e:	f3 46 0f 5b 7c 3d 60 	cvttps2dq xmm15,XMMWORD PTR [rbp+r15*1+0x60]
    5c45:	f3 42 0f 5b 4c 3d 70 	cvttps2dq xmm1,XMMWORD PTR [rbp+r15*1+0x70]
    5c4c:	46 0f 29 0c 3b       	movaps XMMWORD PTR [rbx+r15*1],xmm9
    5c51:	46 0f 29 54 3b 10    	movaps XMMWORD PTR [rbx+r15*1+0x10],xmm10
    5c57:	46 0f 29 5c 3b 20    	movaps XMMWORD PTR [rbx+r15*1+0x20],xmm11
    5c5d:	46 0f 29 64 3b 30    	movaps XMMWORD PTR [rbx+r15*1+0x30],xmm12
    5c63:	46 0f 29 6c 3b 40    	movaps XMMWORD PTR [rbx+r15*1+0x40],xmm13
    5c69:	46 0f 29 74 3b 50    	movaps XMMWORD PTR [rbx+r15*1+0x50],xmm14
    5c6f:	46 0f 29 7c 3b 60    	movaps XMMWORD PTR [rbx+r15*1+0x60],xmm15
    5c75:	42 0f 29 4c 3b 70    	movaps XMMWORD PTR [rbx+r15*1+0x70],xmm1
    5c7b:	49 83 ef 80          	sub    r15,0xffffffffffffff80
    5c7f:	45 39 c1             	cmp    r9d,r8d
    5c82:	77 8c                	ja     5c10 <gpu_run+0x57c0>
    5c84:	e9 8b be ff ff       	jmp    1b14 <gpu_run+0x16c4>
/home/simon/prog/C/EMULATOR/GPU.c:209 (discriminator 3)
					/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
	        		A[indx].i = B[indx].i + C[indx].i;*/
					//if(i == 0) {
					//	printf("%i = %i(%i) + %i(%i) (%i)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].i,(int)(C-gpu_registers)/32,C[i].i,B[i].i+C[i].i);
					//}
					A[i].i = B[i].i + C[i].i;
    5c89:	66 0f 6f 7c 0d 00    	movdqa xmm7,XMMWORD PTR [rbp+rcx*1+0x0]
    5c8f:	83 c7 08             	add    edi,0x8
    5c92:	66 41 0f fe 3c 0c    	paddd  xmm7,XMMWORD PTR [r12+rcx*1]
    5c98:	0f 29 3c 0b          	movaps XMMWORD PTR [rbx+rcx*1],xmm7
    5c9c:	66 44 0f 6f 4c 0d 10 	movdqa xmm9,XMMWORD PTR [rbp+rcx*1+0x10]
    5ca3:	66 45 0f fe 4c 0c 10 	paddd  xmm9,XMMWORD PTR [r12+rcx*1+0x10]
    5caa:	44 0f 29 4c 0b 10    	movaps XMMWORD PTR [rbx+rcx*1+0x10],xmm9
    5cb0:	66 44 0f 6f 54 0d 20 	movdqa xmm10,XMMWORD PTR [rbp+rcx*1+0x20]
    5cb7:	66 45 0f fe 54 0c 20 	paddd  xmm10,XMMWORD PTR [r12+rcx*1+0x20]
    5cbe:	44 0f 29 54 0b 20    	movaps XMMWORD PTR [rbx+rcx*1+0x20],xmm10
    5cc4:	66 44 0f 6f 5c 0d 30 	movdqa xmm11,XMMWORD PTR [rbp+rcx*1+0x30]
    5ccb:	66 45 0f fe 5c 0c 30 	paddd  xmm11,XMMWORD PTR [r12+rcx*1+0x30]
    5cd2:	44 0f 29 5c 0b 30    	movaps XMMWORD PTR [rbx+rcx*1+0x30],xmm11
    5cd8:	66 44 0f 6f 64 0d 40 	movdqa xmm12,XMMWORD PTR [rbp+rcx*1+0x40]
    5cdf:	66 45 0f fe 64 0c 40 	paddd  xmm12,XMMWORD PTR [r12+rcx*1+0x40]
    5ce6:	44 0f 29 64 0b 40    	movaps XMMWORD PTR [rbx+rcx*1+0x40],xmm12
    5cec:	66 44 0f 6f 6c 0d 50 	movdqa xmm13,XMMWORD PTR [rbp+rcx*1+0x50]
    5cf3:	66 45 0f fe 6c 0c 50 	paddd  xmm13,XMMWORD PTR [r12+rcx*1+0x50]
    5cfa:	44 0f 29 6c 0b 50    	movaps XMMWORD PTR [rbx+rcx*1+0x50],xmm13
    5d00:	66 44 0f 6f 74 0d 60 	movdqa xmm14,XMMWORD PTR [rbp+rcx*1+0x60]
    5d07:	66 45 0f fe 74 0c 60 	paddd  xmm14,XMMWORD PTR [r12+rcx*1+0x60]
    5d0e:	44 0f 29 74 0b 60    	movaps XMMWORD PTR [rbx+rcx*1+0x60],xmm14
    5d14:	66 44 0f 6f 7c 0d 70 	movdqa xmm15,XMMWORD PTR [rbp+rcx*1+0x70]
    5d1b:	66 45 0f fe 7c 0c 70 	paddd  xmm15,XMMWORD PTR [r12+rcx*1+0x70]
    5d22:	44 0f 29 7c 0b 70    	movaps XMMWORD PTR [rbx+rcx*1+0x70],xmm15
    5d28:	48 83 e9 80          	sub    rcx,0xffffffffffffff80
    5d2c:	44 39 ff             	cmp    edi,r15d
    5d2f:	0f 82 54 ff ff ff    	jb     5c89 <gpu_run+0x5839>
    5d35:	e9 90 e7 ff ff       	jmp    44ca <gpu_run+0x407a>
/home/simon/prog/C/EMULATOR/GPU.c:526
							if(tmpCycles < GPU_TRAS) tmpCycles = GPU_TRAS;
							cyclesAccum += tmpCycles+GPU_TRP;
							tmpCycles = GPU_TRCD+1;//TRCD and TRAS overlap
						} else {
							merged = false;
							tmpCycles += 1;
    5d3a:	bf 05 00 00 00       	mov    edi,0x5
    5d3f:	e9 9f f4 ff ff       	jmp    51e3 <gpu_run+0x4d93>
/home/simon/prog/C/EMULATOR/GPU.c:414 (discriminator 2)
						/*int indx = GPU_ACTIVE_THREAD_INDEXES[i];
						A[indx].f = B[indx].f * C[indx].f;*/
						//if(i == 0) {
						//	printf("%i = %i(%f) * %i(%f) (%f)\n",(int)(A-gpu_registers)/32,(int)(B-gpu_registers)/32,B[i].f,(int)(C-gpu_registers)/32,C[i].f,B[i].f*C[i].f);
						//}
						A[i].f = B[i].f * C[i].f;
    5d44:	41 0f 10 1c 0c       	movups xmm3,XMMWORD PTR [r12+rcx*1]
    5d49:	41 83 c3 08          	add    r11d,0x8
    5d4d:	0f 59 5c 0d 00       	mulps  xmm3,XMMWORD PTR [rbp+rcx*1+0x0]
    5d52:	0f 11 1c 0b          	movups XMMWORD PTR [rbx+rcx*1],xmm3
    5d56:	41 0f 10 64 0c 10    	movups xmm4,XMMWORD PTR [r12+rcx*1+0x10]
    5d5c:	0f 59 64 0d 10       	mulps  xmm4,XMMWORD PTR [rbp+rcx*1+0x10]
    5d61:	0f 11 64 0b 10       	movups XMMWORD PTR [rbx+rcx*1+0x10],xmm4
    5d66:	41 0f 10 6c 0c 20    	movups xmm5,XMMWORD PTR [r12+rcx*1+0x20]
    5d6c:	0f 59 6c 0d 20       	mulps  xmm5,XMMWORD PTR [rbp+rcx*1+0x20]
    5d71:	0f 11 6c 0b 20       	movups XMMWORD PTR [rbx+rcx*1+0x20],xmm5
    5d76:	41 0f 10 74 0c 30    	movups xmm6,XMMWORD PTR [r12+rcx*1+0x30]
    5d7c:	0f 59 74 0d 30       	mulps  xmm6,XMMWORD PTR [rbp+rcx*1+0x30]
    5d81:	0f 11 74 0b 30       	movups XMMWORD PTR [rbx+rcx*1+0x30],xmm6
    5d86:	41 0f 10 7c 0c 40    	movups xmm7,XMMWORD PTR [r12+rcx*1+0x40]
    5d8c:	0f 59 7c 0d 40       	mulps  xmm7,XMMWORD PTR [rbp+rcx*1+0x40]
    5d91:	0f 11 7c 0b 40       	movups XMMWORD PTR [rbx+rcx*1+0x40],xmm7
    5d96:	45 0f 10 44 0c 50    	movups xmm8,XMMWORD PTR [r12+rcx*1+0x50]
    5d9c:	44 0f 59 44 0d 50    	mulps  xmm8,XMMWORD PTR [rbp+rcx*1+0x50]
    5da2:	44 0f 11 44 0b 50    	movups XMMWORD PTR [rbx+rcx*1+0x50],xmm8
    5da8:	45 0f 10 4c 0c 60    	movups xmm9,XMMWORD PTR [r12+rcx*1+0x60]
    5dae:	44 0f 59 4c 0d 60    	mulps  xmm9,XMMWORD PTR [rbp+rcx*1+0x60]
    5db4:	44 0f 11 4c 0b 60    	movups XMMWORD PTR [rbx+rcx*1+0x60],xmm9
    5dba:	45 0f 10 54 0c 70    	movups xmm10,XMMWORD PTR [r12+rcx*1+0x70]
    5dc0:	44 0f 59 54 0d 70    	mulps  xmm10,XMMWORD PTR [rbp+rcx*1+0x70]
    5dc6:	44 0f 11 54 0b 70    	movups XMMWORD PTR [rbx+rcx*1+0x70],xmm10
    5dcc:	48 83 e9 80          	sub    rcx,0xffffffffffffff80
    5dd0:	44 39 df             	cmp    edi,r11d
    5dd3:	0f 87 6b ff ff ff    	ja     5d44 <gpu_run+0x58f4>
    5dd9:	e9 ed c9 ff ff       	jmp    27cb <gpu_run+0x237b>
/home/simon/prog/C/EMULATOR/GPU.c:404
					int i = 0;
					cycles += 1;
					v4f * restrict Av = (v4f*)A;
					v4f * restrict Bv = (v4f*)B;
					v4f * restrict Cv = (v4f*)C;
					for(; i < __builtin_expect(GPU_ACTIVE_THREADS>>2,GPU_CORE_COUNT>>2); ++i) {
    5dde:	45 31 ff             	xor    r15d,r15d
    5de1:	e9 9a c7 ff ff       	jmp    2580 <gpu_run+0x2130>
/home/simon/prog/C/EMULATOR/GPU.c:501
					uint32_t cyclesAccum = 0;
					uint32_t lastAddr = -1;
					//uint32_t cyclesOnRow = 0;//cycles we've been writing to currently open row
					bool first = true;
					bool merged = false;
					for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    5de6:	be 02 00 00 00       	mov    esi,0x2
    5deb:	e9 1c f4 ff ff       	jmp    520c <gpu_run+0x4dbc>
/home/simon/prog/C/EMULATOR/GPU.c:543
				uint32_t tmpCycles = 6;//3*2, minimum time for instruction
				uint32_t tmp = 0;
				uint32_t lastAddr = -1;
				bool lastCache = false;//did the last memory read come from L2 cache
				bool lastMem = false;//did the last memory read come from memory
				for(int i = 0; i < GPU_ACTIVE_THREADS; ++i) {
    5df0:	b8 03 00 00 00       	mov    eax,0x3
    5df5:	e9 b4 ae ff ff       	jmp    cae <gpu_run+0x85e>
    5dfa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    5e00:	44 89 35 00 00 00 00 	mov    DWORD PTR [rip+0x0],r14d        # 5e07 <gpu_run+0x59b7>
    5e07:	e9 a4 b3 ff ff       	jmp    11b0 <gpu_run+0xd60>
    5e0c:	44 8b 74 24 30       	mov    r14d,DWORD PTR [rsp+0x30]
    5e11:	44 89 35 00 00 00 00 	mov    DWORD PTR [rip+0x0],r14d        # 5e18 <gpu_run+0x59c8>
    5e18:	e9 64 ae ff ff       	jmp    c81 <gpu_run+0x831>
