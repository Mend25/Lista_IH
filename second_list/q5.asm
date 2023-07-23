lw x9 , zero
lw x10, zero
lw x11, zero 
lw x12, zero
lw x13, zero
lw x14, zero
lw x15, zero 
lw x16, zero
lw x17, zero
lw x18, zero
lw x19, zero
lw x20, zero
lw x21, zero

read_a:
	lb x5, 1025(x0)
	lw x6, enter
	beq x5, x6, prep_a
	addi x7, x7, 1
	lw x6, neg
	beq x5, x6, neg_a
	lw x6, one
	beq x6, x7, save_1
	lw x6, two
	beq x6, x7, save_2
	lw x6, three
	beq x6, x7, save_3
	lw x6, four
	beq x6, x7, save_4
	jal x0, read_a

neg_a:
	addi x7, x7, -1
	jal x0, read_a

save_1:
	addi x5, x5, -48
	sw x5, s6
	jal x0, read_a

save_2:
	addi x5, x5, -48
	sw x5, s7
	jal x0, read_a

save_3:
	addi x5, x5, -48
	sw x5, s8
	jal x0, read_a

save_4:
	addi x5, x5, -48
	sw x5, s9
	jal x0, read_a

prep_a:
	lw x6, one
	beq x6, x7, unit_a
	lw x6, two
	beq x6, x7, tens_a
	lw x6, three
	beq x6, x7, hund_a
	lw x6, four
	beq x6, x7, thous_a

unit_a:
	add x9, x9, s6
	jal x0, read_b

tens_a:	
	add x9, x9, s6
	addi x10, x10, 1
	lw x6, ten
	beq x10, x6, mrg_2a
	jal x0, tens_a

mrg_2a:
	add x9, x9, s7
	jal x0, read_b

hund_a:
	add x9, x9, s6
	addi x10, x10, 1
	lw x6, one_hundred
	beq x10, x6, tens_s7
	jal x0, hund_a

tens_s7:
	add x11, x11, s7
	addi x12, x12, 1
	lw x6, ten
	beq x12, x6, mrg_3a
	jal x0, tens_s7

mrg_3a:
	add x9, x9, x11
	add x9, x9, s8
	jal x0, read_b

thous_a:
	add x9, x9, s6
	addi x10, x10, 1
	lw x6, one_thousnd
	beq x10, x6, hund_s7
	jal x0, thous_a

hund_s7:
	add x11, x11, s7
	addi x12, x12, 1
	lw x6, one_hundred
	beq x12, x6, tens_s8
	jal x0, hund_s7

tens_s8:
	add x13, x13, s8
	addi x14, x14, 1
	lw x6, ten
	beq x14, x6, mrg_4a
	jal x0, tens_s8

mrg_4a:
	add x9, x9, x11
	add x9, x9, x13
	add x9, x9, s9
	jal x0, read_b

read_b:	
	lb x5, 1025(x0)
	lw x6, enter
	beq x5, x6, prep_b
	addi x8, x8, 1
	lw x6, neg
	beq x5, x6, neg_b
	lw x6, one
	beq x6, x8, save_1b
	lw x6, two
	beq x6, x8, save_2b
	lw x6, three
	beq x6, x8, save_3b
	lw x6, four
	beq x6, x8, save_4b
	jal x0, read_b

neg_b:
	addi x8, x8, -1
	jal x0, read_b

save_1b:
	addi x5, x5, -48
	sw x5, s6
	jal x0, read_b

save_2b:
	addi x5, x5, -48
	sw x5, s7
	jal x0, read_b

save_3b:
	addi x5, x5, -48
	sw x5, s8
	jal x0, read_b

save_4b:
	addi x5, x5, -48
	sw x5, s9
	jal x0, read_b

prep_b:
	lw x6, one
	beq x6, x8, unit_b
	lw x6, two
	beq x6, x8, tens_b
	lw x6, three
	beq x6, x8, hund_b
	lw x6, four
	beq x6, x8, thous_b

unit_b:
	add x15, x15, s6
	jal x0, mult

tens_b:	
	add x15, x15, s6
	addi x16, x16, 1
	lw x6, ten
	beq x16, x6, mrg_2b
	jal x0, tens_b

mrg_2b:
	add x15, x15, s7
	jal x0, mult

hund_b:
	add x15, x15, s6
	addi x16, x16, 1
	lw x6, one_hundred
	beq x16, x6, tens_b2
	jal x0, hund_b

tens_b2:
	add x17, x17, s7
	addi x18, x18, 1
	lw x6, ten
	beq x17, x6, mrg_3b
	jal x0, tens_b2

mrg_3b:
	add x15, x15, x17
	add x15, x15, s8
	jal x0, mult

thous_b:
	add x15, x15, s6
	addi x16, x16, 1
	lw x6, one_thousnd
	beq x10, x6, hund_b2
	jal x0, thous_b

hund_b2:
	add x17, x17, s7
	addi x18, x18, 1
	lw x6, one_hundred
	beq x12, x6, tens_b3
	jal x0, hund_b2

tens_b3:
	add x19, x19, s8
	addi x20, x20, 1
	lw x6, ten
	beq x20, x6, mrg_4b
	jal x0, tens_b3

mrg_4b:
	add x15, x15, x17
	add x15, x15, x19
	add x15, x15, s9
	jal x0, mult

mult:
	add x21, x21, x9
	addi x15, x15, -1
	lw x6, zero
	beq x15, x6, print
	jal x0, mult 

print:
	addi x21, x21, 48
	sb x21, 1024(x0)
	halt

enter: .word 13
neg: .word 45
zero: .word 0
three: .word 3
two: .word 2
one: .word 1
four: .word 4
ten: .word 10
one_hundred: .word 100
one_thousnd: .word 1000
s6: .word 0 
s7: .word 0
s8: .word 0
s9: .word 0
t5: .word 0
t6: .word 0
t5: .word 0
t6: .word 0




