.data
V1: .byte 4, 18, -5, 0, 3

.text
    la a0, V1
    li a1, 5
    jal ra, maxVbyte
    li a7, 10
    ecall

maxVbyte:
    lb t0, 0(a0)
prox: addi a1, a1, -1
    beq a1, zero, fim
    addi a0, a0, 1
    lb t1, 0(a0)
    ble t1, t0, prox
    mv t0, t1
    j prox

fim: mv a0, t0
    ret
