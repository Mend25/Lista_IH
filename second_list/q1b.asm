lw x8, x
lw x9, x
lw x10, x 
lw x11, x
lw x12, x

read_a:
	lb x5, 1025(x0)
	lw x6, neg
	beq x5, x6, end_0a
	lw x6, enter
	beq x5, x6, read_b
	jal x0, read_a

end_0a:
	addi x12, x12, 2
	jal x0, read_a

read_b:	
	lb x5, 1025(x0)
	addi x8, x8, 1
	lw x6, neg
	beq x5, x6, negative
	lw x6, one
	beq x6, x8, cmp_1
	lw x6, enter
	beq x5, x6, read_c
	lw x6, two
	beq x6, x8, cmp_2
	lw x6, three
	beq x8, x6, end_0b
	jal x0, read_b

negative:
	addi x8, x8, -1
	addi x9, x9, -1
	jal x0, read_b

cmp_1: 
	addi x5, x5, -48
	lw x6, six
	bge x5, x6, flag_6
	jal x0, read_b

cmp_2: 
	addi x5, x5, -48
	lw x6, three
	bge x5, x6, flag_3
	jal x0, read_b

flag_6:
	addi x9, x9, 1
	jal x0, read_b

flag_3:
	addi x9, x9, 1
	jal x0, read_b

end_0b:
	addi x9, x9, 2
	jal x0, read_b
	
	
read_c:
	lb x5, 1025(x0)
	addi x10, x10, 1
	lw x6, neg
	beq x5, x6, end_0c
	lw x6, one
	beq x6, x10, cmp1_c
	lw x6, enter
	beq x5, x6, end
	lw x6, two
	beq x6, x10, cmp2_c
	lw x6, three
	beq x10, x6, end_0c
	jal x0, read_c
	
cmp1_c:
	addi x5, x5, -48
	lw x6, one
	blt x5, x6, end_0c
	beq x5, x6, flag_1
	jal x0, read_c

cmp2_c: 
	addi x5, x5, -48
	lw x6, six
	blt x5, x6, flag_6c
	jal x0, read_c

flag_1:
	addi x11, x11, 1
	jal x0, read_c

flag_6c:
	addi x11, x11, 1
	jal x0, read_c

end_0c:
	addi x11, x11, 2
	jal x0, read_b

end:
	lw x7, x
	addi x7, x7, 48
	lw x6, two
	bge x12, x6, end_0
	bge x9, x6, end_0
	bge x11, x6, end_0
	blt x9, x6, end_1

end_0:
	sb x7, 1024(x0)
	halt 

end_1:
	addi x7, x7, 1
	sb x7, 1024(x0)
	halt

enter: .word 13
neg: .word 45
x: .word 0
six: .word 6
three: .word 3
two: .word 2
one: .word 1
seven: .word 7
six: .word 6
five: .word 5
four: .word 4




