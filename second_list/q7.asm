lb x10, 0(x0)
sb x10, 1030(x0)

loop:
	lh x10, 1031(x0)

	lw t0, first_case
	blt x10, t0, if_one
	
	lw t0, second_case
	blt x10, t0, if_two
	
	lw t0, third_case
	blt x10, t0, if_three
	
	lw t0, fourth_case
	blt x10, t0, if_four

	lw t0, fifth_case
	blt x10, t0, if_five

	# else 
	lw x10, HIGH6
	sb x10, 1029(x0)
	lw x10, LOW
	sb x10, 1027(x0)
	jal x11, loop 

	if_one:
		lw x10, HIGH1
		sb x10, 1027(x0)
		lw x10, LOW
		sb x10, 1029(x0)
		jal x11, loop 
	if_two:
		lw x10, HIGH2
		sb x10, 1027(x0)
		lw x10, LOW
		sb x10, 1029(x0)
		jal x11, loop 
	if_three:
		lw x10, HIGH3
		sb x10, 1029(x0)
		lw x10, LOW
		sb x10, 1027(x0)
		jal x11, loop  	
	if_four:
		lw x10, HIGH4
		sb x10, 1027(x0)
		lw x10, LOW
		sb x10, 1029(x0)
		jal x11, loop
	if_five:
		lw x10, HIGH5
		sb x10, 1029(x0)
		lw x10, LOW
		sb x10, 1027(x0)
		jal x11, loop  

first_case: .word 327
second_case: .word 429
third_case: .word 531
fourth_case: .word 634
fifth_case: .word 736

HIGH1: .word 3
HIGH2: .word 12
HIGH3: .word 12
HIGH4: .word 48
HIGH5: .word 48
HIGH6: .word 3
LOW: .word 0
