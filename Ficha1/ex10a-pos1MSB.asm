.data
num1: .word 1

.text
    lw a0, num1
    jal ra, pos1MSB
    li a7, 10
    ecall

pos1MSB:
    li t0, 31
    li t1, 1
    slli t1, t1, 31
L1: and t2, a0, t1
    bne t2, zero, fim
    addi t0, t0, -1
    slli a0, a0, 1
    bne a0, zero, L1
fim: mv a0, t0
     ret