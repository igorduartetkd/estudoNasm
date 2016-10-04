global main
extern printf, scanf

section .data
leitura db "%lld %lld", 0
escrita db "%lld dividido 2 elevado a %lld é: %lld", 10, 0

section .bss
x resq 1
y resq 1
resultado resq 1
virgula resq 1

section .text
main:
       
    ;-----------LER X E Y---------------
    mov rdi, leitura
    mov rsi, x
    mov rdx, y
    xor rax, rax
    call scanf
    
    ;-----------MOVIMENTA X PARA DIREITA Y VEZES---------------
    mov rbx, [x]
    mov cl, [y]
    shr rbx, cl
    mov [resultado], rbx

    ;-----------IMPRIME X---------------
    mov rdi, escrita
    mov rsi, [x]
    mov rdx, [y]
    mov rcx, [resultado]
    xor rax, rax
    call printf
    
    xor rax, rax
    ret