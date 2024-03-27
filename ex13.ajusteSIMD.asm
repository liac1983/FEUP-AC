ajustSIMD: 
    srli a2, a2, 1
    li t1, 0x0000FFFF
    and a3,a3, t1
    slli t0, a3, 16
    or t4, a3, t0

ciclo: beq a2, zero, ajFim
        lw t0, 0(a0)
        lw t1, 0(a1)
        kabs16 t0,t0
        smul16 t5, t4, t0
        pkbb16 t2, t6, t5
        sub16 t1, t1, t2
        sw t1, o(a1)
        addi a0, a0, 4
        addi a1,a1, 4
        addi a2, a2, -1
        j ciclo
    
ajFim: ret
