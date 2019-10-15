#include <sys/times.h>
#include <stdio.h>
#include <unistd.h>
#include "GPU.h"
#include <stdint.h>
#include <SDL2/SDL.h>
#include "RASP.h"
#include <math.h>
#include "CPU.h"
#include <stdbool.h>

typedef struct {
	float v[3];
} vector;

typedef struct {
	float m[9];
} matrix;

vector subVecVec(vector v0, vector v1) {
	vector r;
	r.v[0] = v0.v[0]-v1.v[0];
	r.v[1] = v0.v[1]-v1.v[1];
	r.v[2] = v0.v[2]-v1.v[2];
	return r;
}

vector addVecVec(vector v0, vector v1) {
	vector r;
	r.v[0] = v0.v[0]+v1.v[0];
	r.v[1] = v0.v[1]+v1.v[1];
	r.v[2] = v0.v[2]+v1.v[2];
	return r;
}

vector mulMatVec(matrix mat, vector v) {
	vector ret;
	ret.v[0] = mat.m[0]*v.v[0]+mat.m[1]*v.v[1]+mat.m[2]*v.v[2];
	ret.v[1] = mat.m[3]*v.v[0]+mat.m[4]*v.v[1]+mat.m[5]*v.v[2];
	ret.v[2] = mat.m[6]*v.v[0]+mat.m[7]*v.v[1]+mat.m[8]*v.v[2];
	return ret;
}

matrix mulMatMat(matrix mat0, matrix mat1) {
	matrix ret;
	ret.m[0] = mat0.m[0]*mat1.m[0]+mat0.m[1]*mat1.m[3]+mat0.m[2]*mat1.m[6];
	ret.m[3] = mat0.m[3]*mat1.m[0]+mat0.m[4]*mat1.m[3]+mat0.m[5]*mat1.m[6];
	ret.m[6] = mat0.m[6]*mat1.m[0]+mat0.m[7]*mat1.m[3]+mat0.m[8]*mat1.m[6];

	ret.m[1] = mat0.m[0]*mat1.m[1]+mat0.m[1]*mat1.m[4]+mat0.m[2]*mat1.m[7];
	ret.m[4] = mat0.m[3]*mat1.m[1]+mat0.m[4]*mat1.m[4]+mat0.m[5]*mat1.m[7];
	ret.m[7] = mat0.m[6]*mat1.m[1]+mat0.m[5]*mat1.m[4]+mat0.m[8]*mat1.m[7];

	ret.m[2] = mat0.m[0]*mat1.m[2]+mat0.m[1]*mat1.m[5]+mat0.m[2]*mat1.m[8];
	ret.m[5] = mat0.m[3]*mat1.m[2]+mat0.m[4]*mat1.m[5]+mat0.m[5]*mat1.m[8];
	ret.m[8] = mat0.m[6]*mat1.m[2]+mat0.m[7]*mat1.m[5]+mat0.m[8]*mat1.m[8];

	return ret;
}

matrix makeRotMatrix(float x, float y, float z) {

	matrix rotx;
	rotx.m[0] = 1;		rotx.m[1] = 0; 		rotx.m[2] = 0;//		(	1,		0,      0,
	rotx.m[3] = 0;		rotx.m[4] = cos(x);	rotx.m[5] = -sin(x);//		0,      cos(x),-sin(x),
	rotx.m[6] = 0;		rotx.m[7] = sin(x);	rotx.m[8] = cos(x);//		0,      sin(x), cos(x));
	matrix roty;
	roty.m[0] = cos(y); roty.m[1] = 0;		roty.m[2] = sin(y);//(	cos(y), 0,      sin(y),
	roty.m[3] = 0;		roty.m[4] = 1;		roty.m[5] = 0;//		0,      1,      0,
	roty.m[6] = -sin(y);roty.m[7] = 0;		roty.m[8] = cos(y);//	-sin(y),0,      cos(y));
	//mat3 rotz(	cos(z),-sin(z),	0,
	//			sin(z), cos(z), 0,
	//			0,		0,		1);
	//return mulMatMat(mulMatMat(roty,rotx),rotz);
	return mulMatMat(roty,rotx);
}


void simple_asm(int opcode, int regA, int regB, int regC, uint8_t *mem, uint32_t *index) {
	uint32_t op = (regC<<16) + (opcode << 10) + (regA << 5) + regB;
	mem[(*index)++] = op&0xff;
	mem[(*index)++] = (op>>8)&0xff;
	mem[(*index)++] = (op>>16)&0xff;
	mem[(*index)++] = (op>>24)&0xff;
}
void simple_asm_im(int opcode, int regA, int regB, uint16_t im, uint8_t *mem, uint32_t *index) {
	uint32_t op =  ((im & 0xffff)<<16) + (opcode << 10) + (regA << 5) + (regB << 0);
	mem[(*index)++] = op&0xff;
	mem[(*index)++] = (op>>8)&0xff;
	mem[(*index)++] = (op>>16)&0xff;
	mem[(*index)++] = (op>>24)&0xff;
}

double read_timer() {
    static int initialized = 0;
    static struct tms start;
    static clock_t cstart;
    struct tms end;
    clock_t cend;

    if( !initialized )
    {
        //gettimeofday( &start, NULL );
        cstart = times(&start);
        initialized = 1;
    }
    //gettimeofday( &end, NULL );
    cend = times( &end );
    //return (double)((end.tms_utime) - (start.tms_utime)) / (double)sysconf(_SC_CLK_TCK);
    return (double)((cend) - (cstart)) / (double)sysconf(_SC_CLK_TCK);
}

//The window we'll be rendering to
SDL_Window* window = NULL;
//The surface contained by the window
SDL_Surface* screenSurface = NULL;

#define SCREEN_WIDTH 1024//640
#define SCREEN_HEIGHT 1024//360

int SDL_INIT() {
	//Initialization flag
	int success = 1;
	//Initialize SDL
	if( SDL_Init( SDL_INIT_VIDEO ) < 0 ) {
		printf( "SDL could not initialize! SDL_Error: %s\n", SDL_GetError() );
		success = 0;
	} else {
		//Create window
		window = SDL_CreateWindow( "VM", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SCREEN_WIDTH, SCREEN_HEIGHT, SDL_WINDOW_SHOWN );
		if( window == NULL ) {
			printf( "Window could not be created! SDL_Error: %s\n", SDL_GetError() );
			success = 0;
		} else {
			//Get window surface
			screenSurface = SDL_GetWindowSurface( window );
		}
	}
	SDL_PixelFormat *fmt;
	fmt = screenSurface->format;
	if(fmt->BytesPerPixel != 4) {
		printf("error: wrong pixel format\n");
		success = 0;
	} else if(fmt->Rmask != 0x00ff0000) {
		printf("error: wrong Rmask\n");
		success = 0;
	} else if(fmt->Gmask != 0x0000ff00) {
		printf("error: wrong Gmask\n");
		success = 0;
	} else if(fmt->Bmask != 0x000000ff) {
		printf("error: wrong Bmask\n");
		success = 0;
	}


	return success;
}

void SDL_CLOSE() {
	//save screenshot
	SDL_SaveBMP( screenSurface, "screenshot.bmp" );
	//Destroy window
	SDL_DestroyWindow( window );
	window = NULL;
	//Quit SDL subsystems
	SDL_Quit();
}

int main(void) {
	unsigned long long cycles = 0;
	double start_time, end_time;
	gpu_init();

	if(!SDL_INIT()) {
		return 1;
	}

	uint8_t *gpu_program_mem = gpu_command_buffer;
	uint8_t *gpu_gfx_mem = gpu_get_mem();
	unsigned int index = 0;
	//simple do-nothing program, for testing how gpu behaves
	//simple_asm_32(GPUOP_TID, 9, 9, 9, gpu_mem, &index);
	//simple_asm_im(GPUOP_MOVIL, 10, 10, 1, gpu_mem, &index);
	//simple_asm_im(GPUOP_MOVIL, 8, 8, 0, gpu_mem, &index);
	//simple_asm_im(GPUOP_MOVIH, 8, 8, 0, gpu_mem, &index);
	for(int i = 0; i < 255; ++i) {
		//simple_asm_32(GPUOP_TILE, 8, 8, 8, gpu_mem, &index);
		//simple_asm_32(GPUOP_FADD, 0, 0, 0, gpu_mem, &index);
		//simple_asm_16(GPUOP_NOP, 0, 0, gpu_mem, &index);
		//simple_asm_32(GPUOP_WR32, 3, 0, 1, gpu_mem, &index);
		//simple_asm_32(GPUOP_ADD, 8, 8, 10, gpu_mem, &index);
		//simple_asm_32(GPUOP_ADD, 3, 3, 3, gpu_mem, &index);
		//simple_asm_32(GPUOP_ADD, 3, 3, 3, gpu_mem, &index);
		//simple_asm_32(GPUOP_ADD, 3, 3, 3, gpu_mem, &index);
		//simple_asm_32(GPUOP_ADD, 3, 3, 3, gpu_mem, &index);
		//simple_asm_32(GPUOP_ADD, 3, 3, 3, gpu_mem, &index);
		//simple_asm_32(GPUOP_ADD, 3, 3, 3, gpu_mem, &index);
		//simple_asm_32(GPUOP_ADD, 3, 3, 3, gpu_mem, &index);
		//simple_asm_32(GPUOP_ADD, 3, 3, 3, gpu_mem, &index);
		//simple_asm_32(GPUOP_FADD, 3, 3, 3, gpu_mem, &index);
		simple_asm(GPUOP_FMUL, 3, 3, 3, gpu_program_mem, &index);
	}
	simple_asm(GPUOP_END, 0, 0, 0, gpu_program_mem, &index);
	//simple program for testing arithmetic
	/*simple_asm_im(GPUOP_FXMOVIUINT,0,0,2,gpu_mem,&index);
	simple_asm_im(GPUOP_FXMOVIUINT,1,1,3,gpu_mem,&index);
	simple_asm_32(GPUOP_FXMUL,2,1,0,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIL,3,3,15,gpu_mem,&index);
	simple_asm_32(GPUOP_SR,2,2,3,gpu_mem,&index);
	simple_asm_32(GPUOP_WR8,2,0,0,gpu_mem,&index);
	simple_asm_16(GPUOP_END,0,0,gpu_mem,&index);*/
	/*//this program colors half the screen white, the other black
	simple_asm_im(GPUOP_MOVIL,2,2,0xffff,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIH,2,2,0x00ff,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIL,3,3,0,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIH,3,3,0,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIL,4,4,1,gpu_mem,&index);
	simple_asm_32(GPUOP_ADD,5,0,1,gpu_mem,&index);
	simple_asm_16(GPUOP_AND,5,4,gpu_mem,&index);
	simple_asm_32(GPUOP_LESS,4,3,5,gpu_mem,&index);
	simple_asm_im(GPUOP_SEL,2,3,4,gpu_mem,&index);
	simple_asm_32(GPUOP_WR32,2,0,1,gpu_mem,&index);
	simple_asm_16(GPUOP_END,0,0,gpu_mem,&index);*/
	//draws rainbow pattern over whole area
	/*
	//get a range 0.0-1.0 for x and y in 2 and 3
	simple_asm_im(GPUOP_MOVIH,5,5,0,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIL,5,5,20,gpu_mem,&index);
	simple_asm_32(GPUOP_SUB,1,1,5,gpu_mem,&index);
	simple_asm_32(GPUOP_ITOF,2,0,0,gpu_mem,&index);
	simple_asm_32(GPUOP_ITOF,3,1,1,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIH,4,4,0,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIL,4,4,639,gpu_mem,&index);
	simple_asm_32(GPUOP_ITOF,4,4,0,gpu_mem,&index);
	simple_asm_32(GPUOP_FDIV,2,2,4,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIH,4,4,0,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIL,4,4,359,gpu_mem,&index);
	simple_asm_32(GPUOP_ITOF,4,4,0,gpu_mem,&index);
	simple_asm_32(GPUOP_FDIV,3,3,4,gpu_mem,&index);
	//create a color
	simple_asm_im(GPUOP_MOVIH,4,4,0,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIL,4,4,255,gpu_mem,&index);
	simple_asm_32(GPUOP_ITOF,4,4,0,gpu_mem,&index);
	simple_asm_32(GPUOP_FMUL,2,2,4,gpu_mem,&index);
	simple_asm_32(GPUOP_FMUL,3,3,4,gpu_mem,&index);
	simple_asm_32(GPUOP_FTOI,2,2,2,gpu_mem,&index);
	simple_asm_32(GPUOP_FTOI,3,3,3,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIH,4,4,0,gpu_mem,&index);
	simple_asm_im(GPUOP_MOVIL,4,4,8,gpu_mem,&index);
	simple_asm_32(GPUOP_SL,3,3,4,gpu_mem,&index);
	simple_asm_32(GPUOP_ADD,3,3,2,gpu_mem,&index);
	//output color
	simple_asm_32(GPUOP_ADD,1,1,5,gpu_mem,&index);
	simple_asm_32(GPUOP_WR32,3,0,1,gpu_mem,&index);
	simple_asm_16(GPUOP_END,0,0,gpu_mem,&index);*/
	//interpolate between red, green, blue at each triangle corner
	//get influence of each vertex at pixel
	/*simple_asm_im(GPUOP_MOVIL,4,4,1,gpu_mem,&index);//1
	simple_asm_im(GPUOP_MOVIH,4,4,0,gpu_mem,&index);//2
	simple_asm_32(GPUOP_ITOF,4,4,4,gpu_mem,&index);//3
	simple_asm_32(GPUOP_FSUB,4,4,2,gpu_mem,&index);//4
	simple_asm_32(GPUOP_FSUB,4,4,3,gpu_mem,&index);//5
	//get max color value
	simple_asm_im(GPUOP_MOVIL,5,5,255,gpu_mem,&index);//6
	simple_asm_im(GPUOP_MOVIH,5,5,0,gpu_mem,&index);//7
	simple_asm_32(GPUOP_ITOF,5,5,5,gpu_mem,&index);//8
	//get color values
	simple_asm_32(GPUOP_FMUL,2,2,5,gpu_mem,&index);//11
	simple_asm_32(GPUOP_FMUL,3,3,5,gpu_mem,&index);//14
	simple_asm_32(GPUOP_FMUL,4,4,5,gpu_mem,&index);//17
	//merge into one integer
	simple_asm_32(GPUOP_FTOI,2,2,2,gpu_mem,&index);//18
	simple_asm_32(GPUOP_FTOI,3,3,3,gpu_mem,&index);//19
	simple_asm_32(GPUOP_FTOI,4,4,4,gpu_mem,&index);//20
	simple_asm_im(GPUOP_MOVIL,5,5,8,gpu_mem,&index);//21
	simple_asm_im(GPUOP_MOVIH,5,5,0,gpu_mem,&index);//22
	simple_asm_32(GPUOP_SL,2,2,5,gpu_mem,&index);//23
	simple_asm_16(GPUOP_OR,2,3,gpu_mem,&index);//24
	simple_asm_32(GPUOP_SL,2,2,5,gpu_mem,&index);//25
	simple_asm_16(GPUOP_OR,2,4,gpu_mem,&index);//26
	//write color back
	simple_asm_32(GPUOP_WR32,2,0,1,gpu_mem,&index);//42
	simple_asm_16(GPUOP_END,0,0,gpu_mem,&index);//43*/
	//texture mapped polygons
	//make texture
	/*for(int y = 380; y < (380+32); ++y) {
		for(int x = 0; x < 32; ++x) {
			uint32_t tmpx = x;//final goal x0 y0 x2-x32
			uint32_t tmpy = y-380;//final goal: x1 y1, y2-y32
			uint32_t outx = tmpx&0x0000000c;
			uint32_t outy = tmpy&0x00000003;
			tmpx = (tmpx & 0xfffffff3) + (outy<<2);
			tmpy = 380+(tmpy & 0xfffffffc) + (outx>>2);
			//printf("writing texture to %u %u\n",tmpx, tmpy);
			*((uint32_t*)(gpu_gfx_mem+tmpy*4096+tmpx*4)) = ((x^y)&1)*0x00ffffff;
		}
	}
	union {float f; uint32_t i;} converter;
	converter.f = 32.0f;
	uint32_t gpu_params[16];
	gpu_params[0] = converter.i;
	gpu_params[1] = 0;
	gpu_params[2] = 0;
	gpu_params[3] = converter.i;
	gpu_params[4] = 0;
	gpu_params[5] = 380;
	gpu_set_program_params(gpu_params);

	//simple texturing program
	//multiply by barycentric coordinates to get texture offset
	simple_asm(GPUOP_FMUL,5,2,16,gpu_program_mem,&index);//1
	simple_asm(GPUOP_FMUL,6,2,17,gpu_program_mem,&index);//2
	simple_asm(GPUOP_FMUL,7,3,18,gpu_program_mem,&index);//3
	simple_asm(GPUOP_FMUL,8,3,19,gpu_program_mem,&index);//4
	//add x and y offsets to base coordinates
	simple_asm(GPUOP_FADD,5,5,7,gpu_program_mem,&index);//5
	simple_asm(GPUOP_FADD,6,6,8,gpu_program_mem,&index);//6
	//convert floats to integers to get texture coordinates
	simple_asm(GPUOP_FTOI,5,5,5,gpu_program_mem,&index);//7
	simple_asm(GPUOP_FTOI,6,6,6,gpu_program_mem,&index);//8
	simple_asm(GPUOP_TILE,5,6,6,gpu_program_mem,&index);//10
	//add texture base coordinates
	simple_asm(GPUOP_ADD,5,5,20,gpu_program_mem,&index);//11
	simple_asm(GPUOP_ADD,6,6,21,gpu_program_mem,&index);//12
	//write color to the screen
	simple_asm(GPUOP_RD32,4,5,6,gpu_program_mem,&index);//24//benchmarked at 12 cycles
	simple_asm(GPUOP_WR32,4,0,1,gpu_program_mem,&index);//34//benchmarked at ~10 cycles
	simple_asm(GPUOP_END,0,0,0,gpu_program_mem,&index);//35
	*/

    start_time = read_timer();
    while(cycles < 50000000) {
        cycles += gpu_run();
		//printf("%llu\n",cycles);
    }
    end_time = read_timer();
	/*
	printf("memory after execution:\n");
	for(int j = 0; j < 16; ++j) {
		for(int i = 0; i < 16; ++i) {
			printf("%i",gpu_mem[i+j*16]);
			if(gpu_mem[i+j*16]>100) {
				printf(" ");
			} else if(gpu_mem[i+j*16]>10) {
				printf("  ");
			} else {
				printf("   ");
			}
		}
		printf("\n");
	}*/

	//r0 = address
	//r1 = value
	//r2 = end condition on negative

	//CPU_2REG(CPU_OPCODE_2REG_MOV, CPU_REGISTER_R0, 0, true, 0, 2, 2, CPU_MEM_MODE_REGISTER);//512
	//for(int i = 0; i < 1024; ++i) {
	//	CPU_MEM[CPU_CODE_WRITE_INDEX++] = CPUOP_ADD;
	//	CPU_MEM[CPU_CODE_WRITE_INDEX++] = 0;
	//	CPU_MEM[CPU_CODE_WRITE_INDEX++] = 0;
	//}
	//CPU_MEM[CPU_CODE_WRITE_INDEX] = 0;
	//start_time = read_timer();
	//unsigned long long totalTime = 0;
	//while (totalTime < 100000000) {
	//	totalTime += cpu_run();
	//}
	//end_time = read_timer();
	//printf("%lf\n",end_time-start_time);
	//for(int i = 0; i < 200; ++i) {
	//	printf("%i\n",((uint32_t*)CPU_MEM)[i]);
	//}
	//for(int i = 1; i < 60*18; ++i) {//fps*polygons_needed_to_cover_screen*overdraw
	/*start_time = read_timer();
	for(int i = 0; i < 60; ++i) {//fps*polygons_needed_to_cover_screen*overdraw
		//start_time = read_timer();
		//cycles = rastRect(0, 20, 640, 360, 16);
		//const int times = 90;
		//for(int i = 0; i < times; ++i) {
		//while(cycles < 50000000) {
			//cycles = rastTri(100.0f, 100.0f, 500.0f, 120.0f, 200.0f, 300.0f, 0, 20);

			//cycles += rastTri(1.0f, 1.0f, 3.0f, 1.0f, 3.0f, 340.0f, 0, 20);
			//cycles += rastTri(1.0f, 1.0f, 1.0f, 340.0f, 3.0f, 340.0f, 0, 20);

			//cycles += rastTri(0.0f, 0.0f, 640.0f, 0.0f, 0.0f, 360.0f, 0, 20);
			//cycles += rastTri(640.0f, 360.0f, 640.0f, 0.0f, 0.0f, 360.0f, 0, 20);
		//}
		/*cycles += rastTri(	640.0f*0.5f+100*cos(2.0f*3.1415f/3.0f+0.01f*3.1415f*2.0f*(float)i),
							360.0f*0.5f+100*sin(2.0f*3.1415f/3.0f+0.01f*3.1415f*2.0f*(float)i),
							640.0f*0.5f+100*cos(2.0f*2.0f*3.1415f/3.0f+0.01f*3.1415f*2.0f*(float)i),
							360.0f*0.5f+100*sin(2.0f*2.0f*3.1415f/3.0f+0.01f*3.1415f*2.0f*(float)i),
							640.0f*0.5f+100*cos(3.0f*2.0f*3.1415f/3.0f+0.01f*3.1415f*2.0f*(float)i),
							360.0f*0.5f+100*sin(3.0f*2.0f*3.1415f/3.0f+0.01f*3.1415f*2.0f*(float)i),
							0, 20);*/
		/*cycles += rastTri(	0,
							0,
							640,
							0,
							0,
							360,
							0, 20);
		cycles += rastTri(	640,
							0,
							0,
							360,
							640,
							360,
							0, 20);
		//end_time = read_timer();
		//printf("cycles: %llu\n",cycles*times*2);
		printf("cycles: %llu\n",cycles);
		//DRAW
		SDL_LockSurface(screenSurface);

		uint32_t yOffset = 20;

		//SDL_memset(gScreenSurface->pixels, 0, gScreenSurface->h * gScreenSurface->pitch);
		for(int y = 0; y < SCREEN_HEIGHT; ++y) {
			for(int x = 0; x < SCREEN_WIDTH; ++x) {
				//printf("%i : %i\n", y*(screenSurface->pitch)+x*4, *(uint32_t*)(gpu_mem+(y+yOffset)*4096+x*4));
				*((uint32_t*)(screenSurface->pixels+y*(screenSurface->pitch)+x*4)) = *(uint32_t*)(gpu_gfx_mem+(y+yOffset)*4096+x*4);
				//printf("%i\n",*(uint32_t*)(gpu_mem+(y+yOffset)*4096+x*4));
			}
		}

		SDL_UnlockSurface(screenSurface);
		SDL_UpdateWindowSurface(window);
		//SDL_Delay(100);
	}
	end_time = read_timer();*/
	printf("Program exited with %i: %i at %i\n",GPU_EXIT_CODE, GPU_EXIT_MESSAGE, GPU_EXIT_PC);

	printf("%lf\n",end_time-start_time);

	SDL_CLOSE();
	return 0;
}
