#ifndef RASP_H_INCLUDED
#define RASP_H_INCLUDED
#include <stdint.h>
typedef struct {
  float x,y;
  float interp0, interp1, interp3;
} RASP_vertex;

unsigned long long rastRect(int x, int y, int w, int h, uint32_t initPC);
unsigned long long rastTri(float topx, float topy, float midx1, float midy, float botx, float boty, int xOffset, int yOffset);
#endif
