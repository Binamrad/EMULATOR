xor r2, r2
add	r2, 0xcafe0000
xor r3, r3
add	r3, 0x0000babe
add r2, r3
xor r1, r1
add [r1], r2

