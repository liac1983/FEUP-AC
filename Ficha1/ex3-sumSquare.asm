.data 
num: .word 4

.text   
     la t0, num
     lw a0, 0(t0)
     jal ra, sumSquare
     li a7, 10
     ecall

sumSquare:
     addi sp, sp, -16
     sw ra, 12(sp)
     sw s0, 8(sp)
     sw s1, 4(sp)
     add s0, a0, x0
     add s1, x0, x0
loop:bge x0, s0, end
     add a0, s0, x0
     jal ra, sumSquare
     add s1, s1, a0
     addi s0, s0, -1
     jal x0, loop
end: add a0, s1, x0
     lw ra, 12(sp)
     lw s0, 8(sp)
     lw s1, 4(sp)
     addi sp, sp, 16
     jr ra


square:
    mul a0, a0, a0
    ret
    
     