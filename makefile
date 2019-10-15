.PHONY: all
all: a.out cpu.out

Program.o: Program.c
	gcc -c Program.c -O3 -march=native -Wall -flto

GPU.o: GPU.c GPU.h
	gcc -c GPU.c -O3 -Wall -flto  -funroll-loops -ftree-vectorize -ftree-vectorizer-verbose=1
	gcc -g -c GPU.c -o GPU_debug.o -O3 -Wall  -funroll-loops -ftree-vectorize -ftree-vectorizer-verbose=1
	objdump -d -M intel -S -l GPU_debug.o > GPU.s
	rm -f GPU_debug.o

CPU.o: CPU2.c CPU.h
	gcc -g -c CPU2.c -march=native -Wall -flto -o CPU.o

TestCPU.o: TestCPU.c
	gcc -g -c TestCPU.c -march=native -Wall -flto

RASP.o: RASP.c RASP.h GPU.h
	gcc -c RASP.c -O3	-march=native -Wall -flto

a.out: Program.o GPU.o RASP.o CPU.o
	gcc Program.o CPU.o GPU.o RASP.o -O3 -march=native -lSDL2 -lm -flto

cpu.out: CPU.o TestCPU.o
	gcc -g CPU.o TestCPU.o -O3 -march=native -Wall -o cpu.out

Demo.o: Demo.c
	gcc -c Demo.c -O3 -march=native -Wall -flto

demo: Demo.o GPU.o RASP.o
	gcc Demo.o GPU.o RASP.o -O3 -march=native -lSDL2 -lm -flto -o demo

.PHONY: debug
debug:
	make clean
	gcc -c Program.c -O0 -g -Wall
	gcc -c GPU.c -O0 -g -Wall
	gcc -c RASP.c -O0 -g -Wall
	gcc -c CPU2.c -O0 -g -Wall -o CPU.o
	gcc Program.o GPU.o RASP.o CPU.o -O0 -g -lSDL2 -lm

.PHONY: clean
clean:
	rm -f GPU.o
	rm -f Program.o
	rm -f RASP.o
	rm -f a.out
	rm -f Demo.o
	rm -f CPU.o
	rm -f cpu.out
	rm -f GPU.s
	rm -f TestCPU.o
