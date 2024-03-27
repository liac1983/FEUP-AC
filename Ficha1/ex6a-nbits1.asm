.data

num: .word 38 

.text
.global nbits1
    la t0, num
    lw a0, 0(t0)
    jal ra, nbits1
    li a7, 10
    ecall

nbits1:
    mv t0, zero
ciclo: beq a0, zero, fim
    andi t1, a0, 1
    add t0, t0, t1
    srli a0, a0, 1
    j ciclo
fim: mv a0, t0
    ret
