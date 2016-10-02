global main
extern printf, scanf

section .data
leitura db "%d %d", 0
escrita db "Soma: %d", 10, "Diferenca: %d", 10, "Produto: %d", 10, "Quociente: %d", 10, "Resto:%d", 10, 0

section .bss
x resq 1
y resq 1
soma resq 1
diferenca resq 1
produto resq 1
quociente resq 1
resto resq 1

section .text

main:
    
    mov rdi, leitura
    mov rsi, x
    mov rdx, y
    xor rax, rax
    call scanf

    ;-------------ADICAO-------------
    mov rax, [x]
    add rax, [y]
    mov [soma], rax
    
    ;-------------SUBTRACAO-------------
    mov rax, [x]
    sub rax, [y]
    mov [diferenca], rax
    
    ;-------------PRODUTO-------------
    mov rax, [x]
    mul qword [y]
    mov [produto], rax
    
    ;-------------QUOCIENTE E RESTO-------------
    mov rax, [x]
    div qword [y]
    mov [quociente], rax
    mov [resto], rdx
    
    ;-------------IMPRIMINDO A SAIDA-------------
    mov rdi, escrita
    mov rsi, [soma]
    mov rdx, [diferenca]
    mov rcx, [produto]
    mov r8, [quociente]
    mov r9, [resto]
    xor rax, rax
    call printf
    
    xor rax, rax
    ret