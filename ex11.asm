prodintV: 
    srli a2, a2, 1
    mv t0, zero
.LP0: beq a2, zero, .LP1
    lw t1, 0(a0)
    lw t2, 0(a1)
    kmda t3, t1, t2
    add t0,t0,t3
    addi a0,a0,4
    addi a1,a1,4
    addi a2,a2,-1
    j .LP0
.LP1: mv a0, t0
    ret