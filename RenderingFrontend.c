#include "GPU.h"
#include "RASP.h"

static void simple_asm(int opcode, int regA, int regB, int regC, uint8_t *mem, uint32_t *index) {
	uint32_t op = (regC<<16) + (opcode << 10) + (regA << 5) + regB;
	mem[(*index)++] = op&0xff;
	mem[(*index)++] = (op>>8)&0xff;
	mem[(*index)++] = (op>>16)&0xff;
	mem[(*index)++] = (op>>24)&0xff;
}
static void simple_asm_im(int opcode, int regA, int regB, uint16_t im, uint8_t *mem, uint32_t *index) {
	uint32_t op =  ((im & 0xffff)<<16) + (opcode << 10) + (regA << 5) + (regB << 0);
	mem[(*index)++] = op&0xff;
	mem[(*index)++] = (op>>8)&0xff;
	mem[(*index)++] = (op>>16)&0xff;
	mem[(*index)++] = (op>>24)&0xff;
}

void renderInit() {

}

void drawTriangle() {
	//project

	//adjust to screen-space

	//call the draw command
}

void setTexture(int x, int y, int h, int w) {

}

void setTextureMap(float ux, float uy, float vx, float vy, int wx, int wy) {

}

void renderSquare(int x, int y, int h, int w) {
	//sraw a square
}

void renderShader(int PC) {
	//set shader program
}

void shaderReset() {
	//resets the shader pointer
}

void shaderStart() {
	//stores the current program
}


int shaderEnd() {
	//returns the initial program counter for the shader
}

//performs perspective correction
void shaderPerspectiveCorrect() {

}

//read texture value from memory
void shaderSampleTexture32(uint32_t flags) {

}

//convert color to vector
void shaderColToVector() {

}

//read color from screen
void shaderSampleScreen() {

}

//multiply vector
void shaderMul() {

}

//subtract vector
void shaderSub() {

}

//multiply vector
void shaderAdd() {

}

void shaderLoadCol(uint32_t col) {

}

void shaderLoadVec(float a, float b, float c) {

}

void shaderDepthTest() {

}

void shaderEmit(uint32_t flags) {

}
