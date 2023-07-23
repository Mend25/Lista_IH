lb x10, 1025(x0)
lw x4, x10

lb x10, 1025(x0)
lw x5, x10

lb x10, 1025(x0)
lw x6, x10

lw x7, zero

bge x4, zero, C2
halt 

C2:
	lw x11, six_two
	bge x11, x5, C3
	halt 

C3:	
	lw x11, fifteen
	blt x11, x6, ans	
	halt

ans:
	lw x7, one
	halt 

zero: .word 0
six_two: .word 62
one: .word 1
fifteen: .word 15

