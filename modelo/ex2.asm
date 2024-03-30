.text
.global norma
.type norma, " function "

norma:
    # Argumentos:
    # v - $a0
    # p - $a1
    
    # Variáveis locais:
    # resultado - $f0
    # xi_abs - $f2
    # xi_p - $f4
    # norma_p - $f6
    
    # Inicializar o resultado da norma
    flw.x.w f0, zero  # resultado = 0
    
    # Loop sobre os elementos do vetor
    li t0, 0         # Inicializar contador de loop
    loop_start:
        bge t0, 3, loop_end  # Verificar se o loop terminou
        
        # Carregar o elemento atual do vetor (xi)
        flw f2, 4(a0)    # $f2 = v[i]
        
        # Calcular o valor absoluto de xi (|xi|)
        fabs.s f2, f2   # $f2 = |xi|
        
        # Calcular xi elevado a p (xi^p)
        fcvt.w.s f4, f2   # Converter |xi| para inteiro
        fmv.w.x f2, f4   # Carregar |xi| como inteiro em $f2
        fmv.w.x f4, a1   # Carregar p como inteiro em $f4
        fmul.s f2, f2, f4   # Calcular |xi|^p
        fcvt.s.w f2, f2   # Converter |xi|^p para ponto flutuante
        
        # Adicionar xi^p ao resultado da norma
        fadd.s f0, f0, f2   # resultado += |xi|^p
        
        # Atualizar o índice e avançar para o próximo elemento
        addi a0, a0, 4   # Avançar para o próximo elemento do vetor
        addi t0, t0, 1   # Incrementar o contador de loop
        j loop_start
    
    loop_end:
        # Calcular a raiz p-ésima do resultado
        fcvt.w.s f6, f0   # Converter o resultado para inteiro
        fmv.w.x f0, f6   # Carregar o resultado como inteiro em $f0
        fmv.w.x f4, a1   # Carregar p como inteiro em $f4
        jal ra, raizN   # Chamar a sub-rotina raizN
        
        # Retornar o resultado da norma
        fmv.s.x f0, f6   # Carregar o resultado como ponto flutuante em $f0
        ret

    # Fim da sub-rotina
