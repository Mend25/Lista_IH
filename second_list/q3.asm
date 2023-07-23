start:
    jal x1, read
	l1:	
    sub x11, x11, x12
    jal x1, print
	l2:	
    halt
print:
	addi x11, x11, 65
	sb x11, 1024(x0)
    jal x0, l2
read:  
    lw x5, vogais
    lb x10, 1025(x0)
	lw x7, enter
    bne x10, x7, count
    jal x0, l1
count:
    addi x11, x11, 1 #contador de letras

is_vog:
    lb x6, 0(x5)
    beq x10, x6, vog #verifica se eh vogal pela string vogais
    addi x5, x5, 1
	lw x7, zero
    bne x6, x7, is_vog
    jal x0, read
vog:
    addi x12, x12, 1 #contador de vogais
    jal x0, read

vogais: .asciz "aeiouAEIOU"
zero: .word 0
ten: .word 10
enter: .word 13
