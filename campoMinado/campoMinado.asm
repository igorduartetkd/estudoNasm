global main
extern printf, scanf, rand, srand, time, system

section .data
clear db "clear", 0
lerNome db "%s", 0
instrucaoNome db "Informe o nome do jogador: ", 0
lerNumero db "%d", 0
imprimeTeste db "mapa[i][j] = %d", 10, 0
instrucaoQntLinhas db "Informe a quantidade de linhas: ", 0
instrucaoQntColunas db "Informe a quantidade de colunas: ", 0
instrucaoQntBombas db "Informe a quantidade de bombas: ", 0

mapa dq   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

section .bss
nomeJogador resb 20
i resq 1
j resq 1
abertos resq 1

%macro limparTela 0
    mov rdi, clear
    call system
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
    
    ;sortear bombas
    call sortear_bombas
    
    ;abertos = 0
    mov qword [abertos], 0
    
    ;.inicio_jogo
    .INICIO_JOGO
    
    limparTela
    
    ;imprimir mapaAtual
    
    
    
xor rax, rax    
ret

sortear_bombas:
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
    mov rax,30
    mul qword [i]
    add rax, [j]
    mov rsi,[mapa + 8*rax]     
    cmp rsi, 10
    jae .INICIO_RAND
    
    ;mapa[i][j] = 10
    mov qword [mapa + 8*rax], 10
    
    ;incrementar adjacentes
    call incrementar_adj
    
    ;cnt++
    inc rbx
    cmp rbx, 10
    jb .INICIO_RAND
    
ret

incrementar_adj:
    lea rdi, [mapa + 8*rax]
    
    ;mapa[i-1][j-1]++
    inc qword [rdi - 8*31]
    ;mapa[i-1][j]++
    inc qword [rdi - 8*30]
    ;mapa[i-1][j+1]++
    inc qword [rdi - 8*29]
    ;mapa[i][j-1]++
    inc qword [rdi - 8]
    ;mapa[i][j+1]++
    inc qword [rdi + 8]
    ;mapa[i+1][j-1]++
    inc qword [rdi + 8*29]
    ;mapa[i+1][j]++
    inc qword [rdi + 8*30]
    ;mapa[i+1][j+1]++
    inc qword [rdi + 8*31]
ret