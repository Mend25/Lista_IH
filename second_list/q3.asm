start:
    jal x1, read
	l1:	
    sub x11, x11, x12
    jal x1, print
	l2:	
    halt

division:
	lw x17, zero
	addi x17, x17, -1
	lw x6, ten
	div_loop:
	addi x17, x17, 1
	sub x11, x11, x6
	bge x11, x6, div_loop
	jal x0, post_div

print:
    lw x6, ten
    jal x0, division
    post_div:
    addi x11, x11, 48
    addi x17, x17, 48
    lw x14, zero
    beq x14, x17, if0
    sb x17, 1024(x0)
    if0:
    sb x5, 1024(x0)
    jal x0, l2
read:  
    lb x10, 1025(x0)
	lw x7, enter
    bne x10, x7, count
    jal x0, l1
count:
    addi x11, x11, 1 #contador de letras
is_vog:
    lw x6, a
    beq x10, x6, vog
    lw x6, e
    beq x10, x6, vog
    lw x6, i
    beq x10, x6, vog
    lw x6, o
    beq x10, x6, vog
    lw x6, u
    beq x10, x6, vog
    lw x6, am
    beq x10, x6, vog
    lw x6, em
    beq x10, x6, vog
    lw x6, im
    beq x10, x6, vog
    lw x6, om
    beq x10, x6, vog
    lw x6, um
    beq x10, x6, vog
    jal x0, read
vog:
    addi x12, x12, 1 #contador de vogais
    jal x0, read

zero: .word 0
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
