.data
X: .float -2.0, 4.0, -3.0026, -5.0, 0.0
Y: .float 8.0, 1.5, -1.0, -4.0, 3.0
n: .word 5

.text
    la a0, X 
    la a1, Y 
    lw a2, n 
    jal ra, prodInt
    li a7, 10
    ecall

prodInt:
    fcvt.s.w ft7, zero
iter: beq a2, zero, fim
        flw ft0, (a0)
        flw ft1, (a1)
        fmadd.s ft7, ft0, ft1, ft7
        addi a0, a0, 4
        addi a1, a1, 4
        addi a2, a2, -1
        j iter
fim: fcvt.d.s fa0, ft7
     ret

