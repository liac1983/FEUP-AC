.data
v1: .word 5, 7, 2, -10, 4

.text
    la a0, v1
    li a1, 5
    jal SOMA
    li a7, 10
    ecall

SOMA: li t0,0

ciclo: beq a1, zero, sai
    lw t1, (a0)
    add t0, t0, t1
    addi a0, a0, 4
    addi a1,a1, -1
    j ciclo
sai: mv a0, t0
    li t2, -333
    li t3, 333
    li t4, 99
    li t5, -1001
    li t6, 314
    ret


