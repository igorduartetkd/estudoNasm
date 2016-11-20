global main
extern printf, scanf

section .data
lerNome db "%s", 0
instrucaoNome db 10, "Informe o nome do jogador: ", 0
lerNumero db "%d", 0
instrucaoQntLinhas db 10, "Informe a quantidade de linhas: ", 0
instrucaoQntColunas db 10, "Informe a quantidade de colunas: ", 0
instrucaoQntBombas db 10, "Informe a quantidade de bombas: ", 0

section .bss
nomeJogador resb 20
qntLinhas resq 1
qntColunas resq 1
qntBombas resq 1
abertos resq 1

section .text
main:
    ;lendo os ajustes
    

    ;ler nome do jogador
    mov rdi, instrucaoNome
    xor rax, rax
    call printf
    mov rdi, lerNome
    mov rsi, nomeJogador
    xor rax, rax
    call scanf
    
    ;sortear bombas
    
    
xor rax, rax    
ret