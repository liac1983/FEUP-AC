.text
.global CheckABS

.data
x: .word 20
dim: .word 0
v: .word 7, -8, -23, 56, 20, -10, 0, 40

.text
lw a0, x
lw a1, dim
la a2, v
jal ra, CheckABS
li a7, 10
ecall


CheckABS:
      li t0, 0
iter: beq a1, zero, fim
      lw t1, 0(a2)
      bgtz t1, pos
      neg t1, t1
pos:  ble t1, a0, prox
      sw zero, 0(a2)
      addi t0, t0, 1
prox: addi a2, a2, 4
      addi a1, a1, -1
      j iter
fim: mv a0, t0
     ret