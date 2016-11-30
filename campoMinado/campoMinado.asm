global main
extern printf, scanf, rand, srand, time, system,sleep

section .data
depura db "abertos %d", 10, 0
clear db "clear", 0
lerNome db "%[^",10,"]", 0
instrucaoNome db "Informe o nome do jogador: ", 0
instrucaoQntBombas   db "Informe a quantidade de bombas que tu queres: ", 0
lerNumero db "%d", 0
imprimeTeste db "mapa[i][j] = %d", 10, 0
instrucaoCaractere  db "Digite 'M' para marcar/desmarcar ou 'A' para abrir: ", 0
lerCaractere        db " %c", 0
instrucaoLerPosicao db "Informe a posicao linha coluna: ", 0
lerPosicao          db "%d %d", 0
posicaoMarcada      db "Posicao marcada!", 10, 0
venceuJogo          db "%s venceu o jogo", 10, 0
perdeuJogo          db "%s eh um bosta! perdeu o jogo", 10, 0

mapa        dq   20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20
mapaAtual   db    "    1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  ", 10, "  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"1 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"2 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"3 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"4 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"5 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"6 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"7 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"8 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"9 |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"10|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"11|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"12|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"13|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"14|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,"15|   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |", 10,"  +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+",10,


section .bss
nomeJogador resb 20
c resb 1
i resq 1
j resq 1
abertos resq 1
qntBombas resq 1
msgFinal resq 1

%macro limparTela 0
    push rdi
    mov rdi, clear
    call system
    pop rdi
%endmacro

%macro calculaPosicaoMapaAtual 0
    push rdx
    push rdi
    mov rax, 248
    mul qword [i]
    mov rdx, [j]
    lea rdi, [rdx*4]
    add rax, rdi
    pop rdi
    pop rdx
%endmacro

%macro calculaPosicaoMapa 0
    push rdx
    mov rax,32
    mul qword [i]
    add rax, [j]
    mov rdx, 8
    mul rdx
    pop rdx
%endmacro

section .text
main:
    limparTela

    ;ajustes
    xor rdi, rdi
    call time
    xor rdi, rsi    ;colocando a saida do time no rdi
    call srand

    ;ler nome do jogador
    mov rdi, instrucaoNome
    xor rax, rax
    call printf
    mov rdi, lerNome
    mov rsi, nomeJogador
    xor rax, rax
    call scanf
    
    ;ler qnt bombas
    mov rdi, instrucaoQntBombas
    xor rax, rax 
    call printf
    mov rdi, lerNumero
    mov rsi, qntBombas
    xor rax, rax
    call scanf
    
    ;sortear bombas
    call sortear_bombas
    
    ;abertos = 0
    mov qword [abertos], 0
    
    ;.inicio_jogo
    .INICIO_JOGO
    
        limparTela
        
        ;imprimir mapaAtual
        mov rdi, mapaAtual
        xor rax, rax
        call printf
        
        ;imprimir instrucao
        mov rdi, instrucaoCaractere
        xor rax, rax
        call printf
        
        ;ler c
        mov rdi, lerCaractere
        mov rsi, c
        xor rax, rax
        call scanf
        
        ;ler posicao
        mov rdi, instrucaoLerPosicao
        xor rax, rax
        call printf
        mov rdi, lerPosicao
        mov rsi, i
        mov rdx, j
        xor rax, rax
        call scanf
        
        ;rax = calculaPosicaoMapaAtual
        calculaPosicaoMapaAtual
        ;add rax, 95
        
        ;c == 'M'
        cmp byte [c], 'M'
        jne .SENAO1
        
            ;mapaAtual[pos] = 'M'
            cmp byte [mapaAtual + rax], 'M'
            jne .NAO_MARCADO
            
                ;mapaAtual[pos] = ' '
                mov byte [mapaAtual + rax], ' '
                jmp .INICIO_JOGO
            
            .NAO_MARCADO
            ;mapaAtual[pos] = 'M'
            cmp byte [mapaAtual + rax], ' '
            jne .INICIO_JOGO
                
                ;mapaAtual[pos] = 'M'
                mov byte [mapaAtual + rax], 'M'
                jmp .INICIO_JOGO
        
        .SENAO1
        ;mapaAtual[pos] == 'M'
        cmp byte [mapaAtual + rax], 'M'
        jne .ABRIR_POSICAO
        
        ;imprima "posicao marcada"
        mov rdi, posicaoMarcada
        xor rax, rax
        call printf
        mov rdi, 2
        xor rax, rax
        call sleep
        
        jmp .INICIO_JOGO
        
        .ABRIR_POSICAO
        
        ;rbx < 10
        calculaPosicaoMapa
        mov rbx, [mapa + rax]
        cmp rbx, 10
        jae .PERDEU
        
        ;abrirPosicao
        call abrirPosicao
        
        ;abertos== qntlinhas * qntcolunas - qntbombas
        mov rdi, 450
        sub rdi, [qntBombas]
        cmp qword [abertos], rdi
        
        jne .INICIO_JOGO
        
        ;VENCEU
        mov qword [msgFinal], venceuJogo
        jmp .FIM_JOGO
        
        .PERDEU
        mov qword [msgFinal], perdeuJogo
        
        .FIM_JOGO
        
        ;imprime mapa
        call revelarMapa
        
        mov rdi, mapaAtual
        xor rax, rax
        call printf
        
        mov rdi, [msgFinal]
        mov rsi, nomeJogador
        xor rax, rax
        call printf
        
        
xor rax, rax    
ret

sortear_bombas:
    push rbx
    push rdi
    push rdx
    push rsi
    push rax
    
    ;cnt = 0
    xor rbx,rbx
    
    ;label .inicio_rand
    .INICIO_RAND 
    
    ;i = rand()
    xor rax, rax
    call rand       ;a saida do rand fica no rax
    mov rdi,15
    xor rdx, rdx
    div rdi
    mov [i], rdx
    
    ;i++
    inc qword [i]
    
    ;j = rand()
    xor rax, rax
    call rand
    mov rdi,30
    xor rdx, rdx
    div rdi
    mov [j], rdx
    
    ;j++
    inc qword [j]
    
    ;mapa[i][j] < 10
    calculaPosicaoMapa
    mov rsi,[mapa + rax]     
    cmp rsi, 10
    jae .INICIO_RAND
    
    ;mapa[i][j] = 10
    mov qword [mapa + rax], 10
    
    ;incrementar adjacentes
    call incrementar_adj
    
    ;cnt++
    inc rbx
    cmp rbx, [qntBombas]
    jb .INICIO_RAND
    
    pop rax
    pop rsi
    pop rdx
    pop rdi
    pop rbx
ret

incrementar_adj:
    push rdi
    
    lea rdi, [mapa + rax]
    
    ;mapa[i-1][j-1]++
    inc qword [rdi - 8*33]
    ;mapa[i-1][j]++
    inc qword [rdi - 8*32]
    ;mapa[i-1][j+1]++
    inc qword [rdi - 8*31]
    ;mapa[i][j-1]++
    inc qword [rdi - 8]
    ;mapa[i][j+1]++
    inc qword [rdi + 8]
    ;mapa[i+1][j-1]++
    inc qword [rdi + 8*31]
    ;mapa[i+1][j]++
    inc qword [rdi + 8*32]
    ;mapa[i+1][j+1]++
    inc qword [rdi + 8*33]
    
    pop rdi
ret

abrirPosicao:
    enter 0,0
    push rax
    push rbx
    push qword [j]
    push qword [i]
    
    
    ;calcula posicao no mapa
    calculaPosicaoMapa
    
    ;rbx = mapa[posicao]
    xor rbx, rbx
    mov rbx,[mapa + rax]
    
    cmp rbx, 20
    jae .FIM_ABRIR_POSICAO
    
    ;calculaPosicaoMapaAtual
    calculaPosicaoMapaAtual
    
    cmp byte [mapaAtual + rax], ' '
    jne .FIM_ABRIR_POSICAO
    
    inc qword [abertos]
    
    ;mapaAtual[pos] = rbx
    add rbx, 48
    mov byte [mapaAtual + rax], bl
    
    sub rbx, 48
    
    ;rbx ==0
    cmp rbx, 0
    jne .FIM_ABRIR_POSICAO
        
        dec qword [i]
        dec qword [j]
        call abrirPosicao
        
        inc qword [i]
        call abrirPosicao
        
        inc qword [i]
        call abrirPosicao
        
        inc qword [j] 
        call abrirPosicao
        
        dec qword [i]
        dec qword [i]
        call abrirPosicao
        
        inc qword [j]
        
        call abrirPosicao
        
        inc qword [i]
        call abrirPosicao
        
        inc qword [i]
        call abrirPosicao

    
    .FIM_ABRIR_POSICAO
    pop qword [i]
    pop qword [j]
    pop rbx
    pop rax
    leave
ret

revelarMapa:
    push rbx
    push rcx
    push rax
    push qword [i]
    push qword [j]
    
    mov qword [i], 1
    
    .INI_FOR1
    cmp qword[i], 15
    ja .FIM_FOR1
        mov qword [j], 1
        
        .INI_FOR2
        cmp qword [j], 30
        ja .FIM_FOR2
        
            calculaPosicaoMapa
  
            xor rbx, rbx
            mov rbx,[mapa + rax]
            
            ;calculaPosicaoMapaAtual
            calculaPosicaoMapaAtual
            
            
            add rbx, 48
            mov byte [mapaAtual + rax], bl
            
            cmp rbx, 58
            jb .FINALZINHO
            
            mov byte [mapaAtual + rax], '*'
            
            .FINALZINHO
            inc qword [j]
            jmp .INI_FOR2
            
        .FIM_FOR2
        
        inc qword [i]
        jmp .INI_FOR1
        
    .FIM_FOR1
    
    pop qword [j]
    pop qword [i]
    pop rax
    pop rcx
    pop rbx
ret