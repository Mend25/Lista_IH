.data
vogais: .string "aeiouAEIOU"
.text
start:
    jal x1, read
    sub x11, x11, x12
    jal x1, print
    halt
print:
    div x5, x11, 10
    sb x5, 1024(x0)
    rem x5, x11, 10
    sb x5, 1024(x0)
    ret
read:  
    la x5, vogais
    lb x10, 1025(x0)
    bne x10, 10, count
    ret
count:
    addi x11, x11, 1 #contador de letras
    mv x7, 0
is_vog:
    lb x6, 0(x5)
    beq x10, x6, vog #verifica se eh vogal pela string vogais
    addi x6, x6, 1
    bne x6, 0, is_vog
    jal x0, read
vog:
    addi x12, x12, 1 #contador de vogais
    jal x0, read


    
