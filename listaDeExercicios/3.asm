global main
extern printf, scanf

section .data
leitura db "%c %c %c", 0
escrita db "codigo alterado: %s", 10, 0
textoAlterar db "bosta mole", 0

section .bss
x resb 1
y resb 1
z resb 1

section .text
main:
    ;-------------LENDO OS DADOS-------------
    mov rdi, leitura
    mov rsi, x
    mov rdx, y
    mov rcx, z
    xor rax, rax
    call scanf
    
    ;-------------ALTERANDO OS VALORES-------------
    mov ah, [x]
    mov al, [y]
    mov bh, [z]
    mov [textoAlterar], ah
    mov [textoAlterar + 1], al
    mov [textoAlterar + 2], bh
    
    ;-------------IMPRIMINDO OS DADOS-------------
    mov rdi, escrita
    mov rsi, textoAlterar
    xor rax, rax
    call printf

    xor rax, rax
    ret