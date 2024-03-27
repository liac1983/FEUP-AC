.data
V: .float -5.0, 0.26, 3.5, 15.33, -5.0, 0.0, 32.125
n: .word 7
a: .float 0.0
b: .float 10.0

.text
    la a0, V 
    lw a1, n 
    la t0, a 
    la t1, b 
    flw fa0, 0(t0)
    flw fa1, 0(t1)
    call conta_intervalo
    li a7, 10
    ecall

conta_intervalo:
    add t6, zero, zero
next: beq a1, zero, end
    addi a1, a1, -1
    flw ft0, 0(a0)
    addi a0, a0, 4
    fle.s t1, fa0, ft0
    beq t1, zero, next
    fle.s t1, ft0, fa1
    beq t1, zero, next
    addi t6, t6,1 
    j next
end: mv a0, t6
    ret
    