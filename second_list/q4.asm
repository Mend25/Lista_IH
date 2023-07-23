start:
    lw x13, zero 
    lw x12, zero
    jal x0, read_player
    l1:
    add x13, x13, x12
    lw x12, zero
    jal x0, read_player
    l2:
    jal x1, result

result:
    beq x13, x12, empate
    blt x13, x12, jogador2
    jal x0, jogador1

empate:
    lw x16, em
    sb x16, 1024(x0)
    lw x16, mm
    sb x16, 1024(x0)
    lw x16, pm
    sb x16, 1024(x0)
    lw x16, am
    sb x16, 1024(x0)
    lw x16, tm
    sb x16, 1024(x0)
    lw x16, em
    sb x16, 1024(x0)
    lw x16, enter
    sb x16, 1024(x0)
    halt

jogador2:
    lw x16, jm
    sb x16, 1024(x0)
    lw x16, two
    addi x16, x16, 48
    sb x16, 1024(x0)
    lw x16, space
    sb x16, 1024(x0)
    lw x16, wm
    sb x16, 1024(x0)
    lw x16, im
    sb x16, 1024(x0)
    lw x16, nm
    sb x16, 1024(x0)
    lw x16, sm
    sb x16, 1024(x0)
    lw x16, enter
    sb x16, 1024(x0)
    halt

jogador1:
    lw x16, jm
    sb x16, 1024(x0)
    lw x16, one
    addi x16, x16, 48
    sb x16, 1024(x0)
    lw x16, space
    sb x16, 1024(x0)
    lw x16, wm
    sb x16, 1024(x0)
    lw x16, im
    sb x16, 1024(x0)
    lw x16, nm
    sb x16, 1024(x0)
    lw x16, sm
    sb x16, 1024(x0)
    lw x16, enter
    sb x16, 1024(x0)
    halt

division:
    lw x17, zero
    lw x15, zero
    add x15, x15, x12
    lw x6, ten
    blt x15, x6, div_stop
    div_loop:
    addi x17, x17, 1
    sub x15, x15, x6
    bge x11, x6, div_loop
    div_stop:
    jal x0, post_div

print:
    lw x6, ten
    lw x16, zero
    jal x0, division
    post_div:
    addi x15, x15, 48
    addi x17, x17, 48
    lw x14, zero
    beq x14, x17, if0
    sb x17, 1024(x0)
    if0:
    sb x15, 1024(x0)
    lw x15, enter
    sb x15, 1024(x0)
    beq x13, x16, l1
    jal x0, l2

read_player:  
    lb x10, 1025(x0)
    lw x7, enter
    bne x10, x7, point1
    jal x0, print
point1:
    lw x6, am
    beq x10, x6, p1_end
    lw x6, em
    beq x10, x6, p1_end
    lw x6, im
    beq x10, x6, p1_end
    lw x6, om
    beq x10, x6, p1_end
    lw x6, um
    beq x10, x6, p1_end
point3:
    lw x6, dm
    beq x10, x6, p3_end
    lw x6, gm
    beq x10, x6, p3_end
    lw x6, tm
    beq x10, x6, p3_end
point5:
    lw x6, bm
    beq x10, x6, p5_end
    lw x6, cm
    beq x10, x6, p5_end
    lw x6, mm
    beq x10, x6, p5_end
    lw x6, nm
    beq x10, x6, p5_end
    lw x6, pm
    beq x10, x6, p5_end
point4:
    lw x6, fm
    beq x10, x6, p4_end
    lw x6, hm
    beq x10, x6, p4_end
    lw x6, vm
    beq x10, x6, p4_end
    lw x6, wm
    beq x10, x6, p4_end
    lw x6, ym
    beq x10, x6, p4_end
point2:
    lw x6, km
    beq x10, x6, p2_end
    lw x6, rm
    beq x10, x6, p2_end
    lw x6, sm
    beq x10, x6, p2_end
point6:
    lw x6, jm
    beq x10, x6, p6_end
    lw x6, lm
    beq x10, x6, p6_end
    lw x6, xm
    beq x10, x6, p6_end
point9:
    lw x6, qm
    beq x10, x6, p9_end
    lw x6, zm
    beq x10, x6, p9_end
error:
    jal x0, read_player
p1_end:
    addi x12, x12, 1
    jal x0, read_player
p2_end:
    addi x12, x12, 2
    jal x0, read_player
p3_end:
    addi x12, x12, 3
    jal x0, read_player
p4_end:
    addi x12, x12, 4
    jal x0, read_player
p5_end:
    addi x12, x12, 5
    jal x0, read_player
p6_end:
    addi x12, x12, 6
    jal x0, read_player
p9_end:
    addi x12, x12, 9
    jal x0, read_player

zero: .word 0
two: .word 2
one: .word 1
space: .word 32
ten: .word 10
enter: .word 13
a: .word 'a'
b: .word 'b'
c: .word 'c'
d: .word 'd'
e: .word 'e'
f: .word 'f'
g: .word 'g'
h: .word 'h'
i: .word 'i'
j: .word 'j'
k: .word 'k'
l: .word 'l'
m: .word 'm'
n: .word 'n'
o: .word 'o'
p: .word 'p'
q: .word 'q'
r: .word 'r'
s: .word 's'
t: .word 't'
u: .word 'u'
v: .word 'v'
w: .word 'w'
x: .word 'x'
y: .word 'y'
z: .word 'z'
am: .word 'A'
bm: .word 'B'
cm: .word 'C'
dm: .word 'D'
em: .word 'E'
fm: .word 'F'
gm: .word 'G'
hm: .word 'H'
im: .word 'I'
jm: .word 'J'
km: .word 'K'
lm: .word 'L'
mm: .word 'M'
nm: .word 'N'
om: .word 'O'
pm: .word 'P'
qm: .word 'Q'
rm: .word 'R'
sm: .word 'S'
tm: .word 'T'
um: .word 'U'
vm: .word 'V'
wm: .word 'W'
xm: .word 'X'
ym: .word 'Y'
zm: .word 'Z'

