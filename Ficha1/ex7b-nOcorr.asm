.data
str1: .asciz "Não foi gerado por chatGPT!"
str2: .asciz "123

.text
    la a0, str1
    li a1, 'o'
    call nOcorr
    li a7, 10
    ecall

nOcorr:
    addi sp, sp, -16
    sw s0, 12(sp)
    sw s1, 8(sp)
    mv s0, zero
prox: lbu s1, 0(a0)
    beq s1, zero, fim
    bne s1, a1, dif
    addi s0, s0, 1
dif: addi a0, a0, 1
    j prox
fim: mv a0, s0
    lw s0, 12(sp)
    lw s1, 8(sp)
    addi sp, sp, 16
    ret
    