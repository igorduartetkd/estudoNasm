global main
extern printf, scanf

section .data
leitura db "%s", 0
escritaPadrao db "As duas strings sao ", 0
diferentes db "diferentes", 10, 0
iguais db "iguais", 10, 0
resultado db "iguais    ", 10, 0

section .bss
A resb 101
B resb 101
aux1 resb 1
aux2 resb 1

section .text
main:
    ;---------ler A-------------
    mov rdi, leitura
    mov rsi, A
    xor rax, rax
    call scanf
    
    ;---------ler B-------------
    mov rdi, leitura
    mov rsi, B
    xor rax, rax
    call scanf
    
    ;---------imprime saida padrao------
    mov rdi, escritaPadrao
    xor rax, rax
    call printf
    
    ;PERCORRE A
    ;---------i=0---------------
    xor rbx, rbx
    
    .INI_FOR
        ;--------aux1 = A[i]---------
        mov al, [A +rbx]
        mov [aux1], al
        
        ;--------aux2 = B[i]----------
        mov al, [B + rbx]
        mov [aux2], al
        
        ;--------aux1 == aux2---------
        mov al, [aux2]
        cmp [aux1], al
        jne .BREAK_FOR
        
        ;--------aux1 != 0------------
        cmp byte [aux1], 0
        je .BREAK_FOR_2
        
        ;--------i++------------
        inc rbx
        jmp .INI_FOR
        .BREAK_FOR
        ;--------imprime diferente-------
        mov rdi, diferentes
        xor rax, rax
        call printf
        jmp .FIM_FOR
        
        .BREAK_FOR_2
        mov rdi, iguais
        xor rax, rax
        call printf
    .FIM_FOR
      
xor rax, rax
ret