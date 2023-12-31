loop:

	lw x10, low # apenas zerando

	lb x7, 1025(x0) # primeiro caractere
	lw x4, ascii_zero
	sub x4, x7, x4
	slli x4, x4, 3
	add x10, x10, x4

	lb x7, 1025(x0) # segundo caractere
	lw x4, ascii_zero
	sub x4, x7, x4
	slli x4, x4, 2
	add x10, x10, x4

	lb x7, 1025(x0) # terceiro caractere
	lw x4, ascii_zero
	sub x4, x7, x4
	slli x4, x4, 1
	add x10, x10, x4


	lb x7, 1025(x0) # quarto caractere
	lw x4, ascii_zero
	sub x4, x7, x4
	add x10, x10, x4

    lw t0, in_0
	beq x10, t0, if_zero

	lw t0, in_1
	beq x10, t0, if_one
	
    lw t0, in_2
	beq x10, t0, if_two
	
    lw t0, in_3
	beq x10, t0, if_three
	
	lw t0, in_4
	beq x10, t0, if_four
	
    lw t0, in_5
	beq x10, t0, if_five
	
    lw t0, in_6
	beq x10, t0, if_six

    lw t0, in_7
	beq x10, t0, if_seven
	
    lw t0, in_8
	beq x10, t0, if_eight
	
    lw t0, in_9
	beq x10, t0, if_nine
	
	lw t0, in_15
	beq x10, t0, else

    if_zero:
        lw x10, ans_0
		sb x10, 1027(x0)
		lw x10, low
		sb x10, 1029(x0)
		jal x11, loop 
	if_one:
		lw x10, ans_1
		sb x10, 1027(x0)
		lw x10, low
		sb x10, 1029(x0)
		jal x11, loop 
	if_two:
		lw x10, ans_2
		sb x10, 1027(x0)
		lw x10, seg_g
		sb x10, 1029(x0)
		jal x11, loop 
	if_three:
		lw x10, ans_3
		sb x10, 1027(x0)
		lw x10, seg_g
		sb x10, 1029(x0)
		jal x11, loop  	
	if_four:
		lw x10, ans_4
		sb x10, 1027(x0)
		lw x10, seg_g
		sb x10, 1029(x0)
		jal x11, loop
	if_five:
		lw x10, ans_5
		sb x10, 1027(x0)
		lw x10, seg_g
		sb x10, 1029(x0)
		jal x11, loop  
    if_six:
		lw x10, ans_6
		sb x10, 1027(x0)
		lw x10, seg_g
		sb x10, 1029(x0)
		jal x11, loop  
    if_seven:
		lw x10, ans_7
		sb x10, 1027(x0)
		lw x10, low
		sb x10, 1029(x0)
		jal x11, loop  
    if_eight:
		lw x10, ans_8
		sb x10, 1027(x0)
		lw x10, seg_g
		sb x10, 1029(x0)
		jal x11, loop 
    if_nine:
		lw x10, ans_9
		sb x10, 1027(x0)
		lw x10, seg_g
		sb x10, 1029(x0)
		jal x11, loop   
	else:
		lw x10, low
		sb x10, 1027(x0)
		lw x10, low
		sb x10, 1029(x0)
		jal x11, loop 

in_0: .word 0
in_1: .word 1
in_2: .word 2 
in_3: .word 3 
in_4: .word 4 
in_5: .word 5
in_6: .word 6
in_7: .word 7 
in_8: .word 8 
in_9: .word 9 
in_15: .word 15

# seg | pins
# [a-f] : 8-13
# g : 2

ans_0: .word 63 
ans_1: .word 6
ans_2: .word 27 # has seg 'g'
ans_3: .word 15 # has seg 'g'
ans_4: .word 38 # has seg 'g'
ans_5: .word 45 # has seg 'g'
ans_6: .word 61 # has seg 'g'
ans_7: .word 7 
ans_8: .word 63 # has seg 'g'
ans_9: .word 47 # has seg 'g'

seg_g: .word 1
low: .word 0

ascii_zero: .word '0'
