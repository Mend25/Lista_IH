lw x29, enter
lw x28, one

input1:
	lb x5, 1025(x0)
	beq x5, x29, end_input
	addi x5, x5, -48
	jal x0, input2

input2:
	lb x6, 1025(x0)
	beq x6, x29, end_input
	addi x6, x6, -48
	jal x0, input3

input3:
	lb x7, 1025(x0)
	beq x7, x29, end_input
	addi x7, x7, -48
	jal x0, input4

input4:
	lb x10, 1025(x0)
	beq x10, x29, end_input
	addi x10, x10, -48
	jal x0, input5

input5:
	lb x11, 1025(x0)
	beq x11, x29, end_input
	addi x11, x11, -48
	jal x0, input6

input6:
	lb x12, 1025(x0)
	beq x12, x29, end_input
	addi x12, x12, -48
	jal x0, end_input

end_input:
	beq x5, x29, num2
	add x31, x0, x5
	beq x31, x28, num2
	beq x31, x0, num2
	add x13, x0, x5
	addi x14, x0, 1
	jal x0, loop1_1
	loop1_1:
		add x30, x0, x31
		addi x14, x0, 1
		addi x13, x13, -1
		beq x13, x14, num2 
		jal x0, loop2_1
		loop2_1:
			add x31, x31, x30
			addi x14, x14, 1
			beq x14, x13, loop1_1
			jal x0, loop2_1

	 
num2:
	add x17, x17, x31
	beq x6, x29, print
	add x31, x0, x6
	beq x31, x28, num3
	beq x31, x0, num3
	add x13, x0, x6
	addi x14, x0, 1
	jal x0, loop1_2
	loop1_2:
		add x30, x0, x31
		addi x14, x0, 1
		addi x13, x13, -1
		beq x13, x14, num3 
		jal x0, loop2_2
		loop2_2:
			add x31, x31, x30
			addi x14, x14, 1
			beq x14, x13, loop1_2
			jal x0, loop2_2

num3:
	add x17, x17, x31
	beq x7, x29, print
	add x31, x0, x7
	beq x31, x28, num4
	beq x31, x0, num4
	add x13, x0, x7
	addi x14, x0, 1
	jal x0, loop1_3
	loop1_3:
		add x30, x0, x31
		addi x14, x0, 1
		addi x13, x13, -1
		beq x13, x14, num4
		jal x0, loop2_3
		loop2_3:
			add x31, x31, x30
			addi x14, x14, 1
			beq x14, x13, loop1_3
			jal x0, loop2_3

num4:
	add x17, x17, x31
	beq x10, x29, print
	add x31, x0, x10
	beq x31, x28, num5
	beq x31, x0, num5
	add x13, x0, x10
	addi x14, x0, 1
	jal x0, loop1_4
	loop1_4:
		add x30, x0, x31
		addi x14, x0, 1
		addi x13, x13, -1
		beq x13, x14, num5
		jal x0, loop2_4
		loop2_4:
			add x31, x31, x30
			addi x14, x14, 1
			beq x14, x13, loop1_4
			jal x0, loop2_4

num5:
	add x17, x17, x31
	beq x11, x29, print
	add x31, x0, x11
	beq x31, x28, num6
	beq x31, x0, num6
	add x13, x0, x11
	addi x14, x0, 1
	jal x0, loop1_5
	loop1_5:
		add x30, x0, x31
		addi x14, x0, 1
		addi x13, x13, -1
		beq x13, x14, num6
		jal x0, loop2_5
		loop2_5:
			add x31, x31, x30
			addi x14, x14, 1
			beq x14, x13, loop1_5
			jal x0, loop2_5

num6:
	add x17, x17, x31
	beq x12, x29, print
	add x31, x0, x12
	beq x31, x28, print
	beq x31, x0, print
	add x13, x0, x12
	addi x14, x0, 1
	jal x0, loop1_6
	loop1_6:
		add x30, x0, x31
		addi x14, x0, 1
		addi x13, x13, -1
		beq x13, x14, print
		jal x0, loop2_6
		loop2_6:
			add x31, x31, x30
			addi x14, x14, 1
			beq x14, x13, loop1_6
			jal x0, loop2_6

print:
	addi x17, x17, 48
	sb x17, 1024(x0)


enter: .word 13
zero: .word 0
one: .word 1
