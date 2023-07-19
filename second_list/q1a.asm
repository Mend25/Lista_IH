lw x4, a
lw x5, b
lw x6, c
lw x7, x

lw x7, zero

bge x4, zero, C2
halt 

C2:
	lw x10, six_two
	bge x10, x5, C3
	halt 

C3:	
	lw x10, fifteen
	blt x10, x6, ans	
	halt

ans:
	lw x7, one
	halt 

a: .word 10
b: .word 10
c: .word 18 
x: .word 10
zero: .word 0
six_two: .word 62
one: .word 1
fifteen: .word 15
