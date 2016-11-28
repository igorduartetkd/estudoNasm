global main
extern printf, scanf, rand, srand, time

section .data
lerNome db "%s", 0
instrucaoNome db "Informe o nome do jogador: ", 0
lerNumero db "%d", 0
imprimeTeste db "i = %d", 10, "j = %d", 10, 0
instrucaoQntLinhas db "Informe a quantidade de linhas: ", 0
instrucaoQntColunas db "Informe a quantidade de colunas: ", 0
instrucaoQntBombas db "Informe a quantidade de bombas: ", 0
mapa dq     1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

section .bss
nomeJogador resb 20
i resq 1
j resq 1
abertos resq 1

section .text
main:
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
    
    
ret