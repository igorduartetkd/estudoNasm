global main
extern scanf, printf

section .data
instrucao db "Informe x e y :", 10, 0
leitura db "%d %d", 0
escrita db "Valor trocado: x = %d y = %d", 10, 0

section .bss
x resq 1
y resq 1

section .text
main:
    ;-------------IMPRIMINDO INSTRUCAO-------------
    mov rdi, instrucao
    xor rax, rax
    call printf
    
    ;-------------LEITURA DE X E Y-------------
    mov rdi, leitura
    mov rsi, x
    mov rdx, y
    xor rax, rax
    call scanf
    
    ;-------------TROCA DE X COM Y-------------
    mov rax, [x]
    mov rbx, [y]
    mov [y], rax
    mov [x], rbx
    
    ;-------------IMPRIMINDO VALORES TROCADOS-------------
    mov rdi, escrita
    mov rsi, [x]
    mov rdx, [y]
    xor rax, rax
    call printf

 
    xor rax, rax
    ret