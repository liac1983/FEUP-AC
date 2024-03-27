.data
V: .byte 5, -3, 32, 0, 1, 127, -1, -3
n: .word 8
lim: .byte 1

.text 
    la a0, V 
    lw a1, n 
    lb a2, lim 
    jal contaInf
    li a7, 10
    ecall

contaInf: 
    srli a1, a1, 2
    slli t0, a2, 8
    add t0, t0, a2
    slli t1, t0, 16
    add t1, t1, t0
    mv t2, zero
prox: lw t0, 0(a0)
    scmplt8 t3, t0, t1
    add8 t2, t2, t3
    addi a0, a0, 4
    addi a1,a1, -1
    bne a1, zero, prox
    mv a0, zero
    sub8 t2, zero, t2
L0: andi t0, t2, 0x0FF
    add a0,a0, t0
    srli t2, t2, 8
    bne t2, zero, L0
    ret
    