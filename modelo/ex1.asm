.text
.global filtrar
.type filtrar, @function

filtrar:
    # Argumentos:
    # a - $a0
    # b - $a1
    # n - $a2
    # v - $a3
    
    # Variáveis locais:
    # i - $t0
    # contador - $t1
    
    # Inicializar contador de elementos não alterados
    li t1, 0
    
    # Loop sobre os elementos do vetor
    li t0, 0         # Inicializar contador de loop
    loop_start:
        bge t0, a2, loop_end  # Verificar se o loop terminou
        
        # Carregar o elemento atual do vetor
        lbu t2, 0(a3)    # $t2 = v[i]
        
        # Verificar condições e modificar o elemento, se necessário
        blt t2, a0, menor_que_a  # vi < a
        bgt t2, a1, maior_que_b  # vi > b
        
        # Se vi está entre a e b, não fazemos nada
        j sem_alteracao
        
        # Caso vi <= a
        menor_que_a:
            li t2, 0    # vi = 0
            j incrementar_contador
        
        # Caso vi >= b
        maior_que_b:
            li t2, 255   # vi = 255
            j incrementar_contador
        
        # Elemento não foi alterado
        sem_alteracao:
            addi t1, t1, 1
        
        # Armazenar o elemento de volta no vetor
        sb t2, 0(a3)
        
        # Incrementar o índice e avançar para o próximo elemento
        addi a3, a3, 1   # Avançar para o próximo elemento do vetor
        addi t0, t0, 1   # Incrementar o contador de loop
        j loop_start
    
    loop_end:
        # Retornar o contador de elementos não alterados
        mv a0, t1
        jr ra    # Retornar
    
    # Rotina para incrementar o contador
    incrementar_contador:
        addi t1, t1, 1
        j loop_end   # Saltar de volta ao final do loop
    
    # Fim da sub-rotina
