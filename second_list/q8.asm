loop:
	# lh x10, 1031(x0)

    lw t0, in_0
	blt x10, t0, if_zero

	lw t0, in_1
	blt x10, t0, if_one
	
    lw t0, in_2
	blt x10, t0, if_two
	
    lw t0, in_3
	blt x10, t0, if_three
	
	lw t0, in_4
	blt x10, t0, if_four
	
    lw t0, in_5
	blt x10, t0, if_five
	
    lw t0, in_6
	blt x10, t0, if_six

    lw t0, in_7
	blt x10, t0, if_seven
	
    lw t0, in_8
	blt x10, t0, if_eight
	
    lw t0, in_9
	blt x10, t0, if_nine

	# else 
	lw x10, low
	sb x10, 1027(x0)
	lw x10, low
	sb x10, 1029(x0)
	jal x11, loop 

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

# seg | pins
# [a-f] : 8-13
# g : 2

ans_0: .word 63 
ans_1: .word 6
ans_2: .word 51 # has seg 'g'
ans_3: .word 23 # has seg 'g'
ans_4: .word 38 # has seg 'g'
ans_5: .word 45 # has seg 'g'
ans_6: .word 61 # has seg 'g'
ans_7: .word 7 
ans_8: .word 63 # has seg 'g'
ans_9: .word 47 # has seg 'g'

seg_g: .word 1
low: .word 0
