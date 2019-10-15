#include "RASP.h"
#include "GPU.h"
#include <stdio.h>
#include <math.h>
//rasterization processor
//interacts with the gpu
//assigns registers and triggers gpu execution.

void setReg_byte(uint32_t addr, uint8_t val) {

}
void setReg_hword(uint32_t addr, uint16_t val) {

}
void setReg_word(uint32_t addr, uint32_t val) {

}

unsigned long long rastTri(float topx, float topy, float midx1, float midy, float botx, float boty, int xOffset, int yOffset) {
	float tmp;
	unsigned long long totalTime = 0;
	float ma, mb, mc, md, moffx, moffy;//matrix for finding barycentric coordinates
	moffx = topx;
	moffy = topy;
	//printf("matrix: %f %f %f %f\n",(midx1-moffx),(midy-moffy),(botx-moffx),(boty-moffy));
	ma = (boty-moffy);//(midx1-moffx);//already swapped with md
	mb = (moffy-midy);//(midy-moffy);//already made negative
	mc = (moffx-botx);//(botx-moffx);//already made negative
	md = (midx1-moffx);//(boty-moffy);//already swapped with ma
	tmp = 1.0f/(ma*md-mb*mc);//determinant. Read notes above
	ma *= tmp;
	mb *= tmp;
	mc *= tmp;
	md *= tmp;
	//printf("inverse: %f %f %f %f\n",ma,mb,mc,md);
	//sort vertices
	if(topy > midy) {
		tmp = topy;
		topy = midy;
		midy = tmp;
		tmp = topx;
		topx = midx1;
		midx1 = tmp;
	}
	if(topy > boty) {
		tmp = topy;
		topy = boty;
		boty = tmp;
		tmp = topx;
		topx = botx;
		botx = tmp;
	}
	if(midy > boty) {
		tmp = midy;
		midy = boty;
		boty = tmp;
		tmp = midx1;
		midx1 = botx;
		botx = tmp;
	}//4 cycles each
	//calculate midx2
	float midx2 = topx + (botx-topx)*((midy-topy)/(boty-topy));
	//sort midx
	if(midx2 < midx1) {
		tmp = midx2;
		midx2 = midx1;
		midx1 = tmp;
	}
	//draw top triangle
	int tid = 0;
	tmp = 1.0f/(midy-topy);
	float d1 = (midx1-topx)*tmp;
	float d2 = (midx2-topx)*tmp;
	tmp = ((int)(topy+0.5f))+0.5f;
	float l = topx+(tmp-topy)*d1;
	float r = topx+(tmp-topy)*d2;
	float _a = (tmp-moffy)*mc;
	float _b = (tmp-moffy)*md;
	int yend = yOffset+(int)(midy+0.5f);
	int drawBottomTriangle = 1;
DRAW_TRIANGLE_LABEL:
	for(int yi = yOffset+(int)tmp; yi < yend; ++yi) {
		int end = xOffset+(int)(r+0.5f);
		tmp = (((int)(l+0.5f))-moffx+0.5f);
		float a = _a+tmp*ma;
		float b = _b+tmp*mb;
		for(int colX = xOffset+(int)(l+0.5f); colX < end; ++colX) {
			(GPU_REGISTERS+(0*GPU_CORE_COUNT))[tid].i = colX;
			(GPU_REGISTERS+(1*GPU_CORE_COUNT))[tid].i = yi;
			(GPU_REGISTERS+(2*GPU_CORE_COUNT))[tid].f = a;
			(GPU_REGISTERS+(3*GPU_CORE_COUNT))[tid].f = b;
			(GPU_REGISTERS+(4*GPU_CORE_COUNT))[tid].f = (1.0f - a) - b;
			GPU_ACTIVE_THREAD_INDEXES[tid] = tid;
			a += ma;
			b += mb;

			++tid;
			if(tid == GPU_CORE_COUNT) {
				GPU_ACTIVE_THREADS = GPU_CORE_COUNT;
				unsigned long long minTime = totalTime + GPU_CORE_COUNT + 3;//minimum time for shader runtime is the time to fill each core, plus pipeline delay
				totalTime += gpu_run();
				totalTime = totalTime < minTime ? minTime : totalTime;
				tid = 0;

			}
		}
		l += d1;
		r += d2;
		_a += mc;
		_b += md;
	}
	if(drawBottomTriangle) {
		//draw bottom triangle
		tmp = 1.0f/(boty-midy);
		d1 = (botx-midx1)*tmp;
		d2 = (botx-midx2)*tmp;
		tmp = ((int)(midy+0.5f))+0.5f;
		l = midx1+(tmp-midy)*d1;
		r = midx2+(tmp-midy)*d2;
		_a = (tmp-moffy)*mc;
		_b = (tmp-moffy)*md;
		yend = yOffset+(int)(boty+0.5f);
		drawBottomTriangle = 0;
		goto DRAW_TRIANGLE_LABEL;
	}
	/*for(int yi = yOffset+(int)tmp; yi < yend; ++yi) {
		int end = xOffset+(int)(r+0.5f);
		tmp = (((int)(l+0.5f))-moffx+0.5f);
		float a = _a+tmp*ma;
		float b = _b+tmp*mb;
		for(int colX = xOffset+(int)(l+0.5f); colX < end; ++colX) {
			(GPU_REGISTERS+(0<<GPU_CORE_SHIFT))[tid] = colX;
			(GPU_REGISTERS+(1<<GPU_CORE_SHIFT))[tid] = yi;
			union{float f; uint32_t i;} convert;
			convert.f = a;
			(GPU_REGISTERS+(2<<GPU_CORE_SHIFT))[tid] = convert.i;
			convert.f = b;
			(GPU_REGISTERS+(3<<GPU_CORE_SHIFT))[tid] = convert.i;
			GPU_ACTIVE_THREAD_INDEXES[tid] = tid;
			a += ma;
			b += mb;

			++tid;
			if(tid == GPU_CORE_COUNT) {
				GPU_ACTIVE_THREADS = GPU_CORE_COUNT;
				unsigned long long minTime = totalTime + GPU_CORE_COUNT;
				totalTime += gpu_run();
				totalTime = totalTime < minTime ? minTime : totalTime;
				tid = 0;
			}
		}
		l += d1;
		r += d2;
		_a += mc;
		_b += md;
	}*/
	if(tid) {
		GPU_ACTIVE_THREADS = tid;
		unsigned long long minTime = totalTime + tid + 3;
		totalTime += gpu_run();
		totalTime = totalTime < minTime ? minTime : totalTime;
		tid = 0;
	}
	return totalTime;
}

unsigned long long rastRect(int x, int y, int w, int h, uint32_t initPC){
	unsigned long long totalTime = 0;
	//set reg 0 and 1 to x and y
	//for an entire rectangle, set registers
	int tid = 0;
	for(int _y = 0; _y < h; ++_y) {
		for(int _x = 0; _x < w; ++_x) {
			(GPU_REGISTERS+(0*GPU_CORE_COUNT))[tid].i = _x+x;
			(GPU_REGISTERS+(1*GPU_CORE_COUNT))[tid].i = _y+y;
			GPU_ACTIVE_THREAD_INDEXES[tid] = tid;
			if(++tid == GPU_CORE_COUNT) {
				GPU_ACTIVE_THREADS = GPU_CORE_COUNT;
				unsigned long long tmp = gpu_run();
				//printf("%llu %i %i %i\n",tmp,GPU_EXIT_CODE,GPU_EXIT_PC,GPU_EXIT_MESSAGE);
				totalTime += tmp;
				tid = 0;
			}
		}
	}
	if(tid) {
		GPU_ACTIVE_THREADS = tid;
		unsigned long long tmp = gpu_run();
		//printf("%llu %i %i %i\n",tmp,GPU_EXIT_CODE,GPU_EXIT_PC,GPU_EXIT_MESSAGE);
		totalTime += tmp;
		tid = 0;
		GPU_ACTIVE_THREADS = 0;
	}
	return totalTime;
}
