static uint32_t fixpadd(uint32_t a, uint32_t b) {
	/*int64_t C = ((int32_t)a)+(int32_t)b;*/
	int32_t A = a < 0 ? -(a&0x7fffffff) : a;
	int32_t B = b < 0 ? -(b&0x7fffffff) : b;
	int64_t C = ((int64_t)A)+(int64_t)B;
	uint32_t out = 0;
	if(C < 0) {
		out = 0x80000000;
		C = -C;
	}
	if(C > 0x7fffffff) {
		C = 0x7fffffff;
	}
	return out + (uint32_t)C;
}
static uint32_t fixpmul(uint32_t a, uint32_t b) {
	uint64_t prod = ((uint64_t)(a&0x7fffffff)) * ((uint64_t)(b&0x7fffffff));
	prod >>= 15;
	if(prod > 0x7fffffff) {
		prod = 0x7fffffff;
	}
	return ((a ^ b) & 0x80000000)+(uint32_t)prod;
}
static uint32_t fixpdiv(uint32_t a, uint32_t b) {
	uint64_t prod = a&0x7fffffff;
	prod <<= 15;
	prod = (b&0x7fffffff) == 0 ? 0x7fffffff : prod / (b&0x7fffffff);
	if(prod > 0x7fffffff) {
		prod = 0x7fffffff;
	}
	return ((a ^ b) & 0x80000000)+(uint32_t)prod;
}
static uint64_t llisqrt(uint64_t x)
{
    register uint64_t op, res, one;

    op = x;
    res = 0;

    /* "one" starts at the highest power of four <= than the argument. */
    one = 1ULL << 62;  /* second-to-top bit set */
    while (one > op) one >>= 2;

    while (one != 0) {
        if (op >= res + one) {
            op -= res + one;
            res += one << 1;  // <-- faster than 2 * one
        }
        res >>= 1;
        one >>= 2;
    }
    return res;
}
static uint32_t fixpveclen(uint32_t a, uint32_t b) {
	uint64_t prod = a&0x7fffffff;
	prod *= prod;
	uint64_t tmp = b&0x7fffffff;
	prod += tmp*tmp;
	//prod >> 1;//uncomment for square blending
	prod = llisqrt(prod);
	
	if(prod > 0x7fffffff) {
		prod = 0x7fffffff;
	}
	return ((a ^ b) & 0x80000000)+(uint32_t)prod;
}
