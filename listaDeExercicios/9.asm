global main
extern printf, scanf

section .data
leitura db "%s", 0
escrita db "%lld", 10, 0
map     db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
num dq 0

section .bss
aux resb 1
string resb 21


section .text
main:
    mov rbp, rsp; for correct debugging
    
    ;-------------LER STRING--------------
    mov rdi, leitura
    mov rsi, string
    xor rax, rax
    call scanf
    
    xor rbx, rbx
.INI_WHILE    ;INICIO DO WHILE
    ;----------c<-string[i]
    xor rax, rax
    mov al, [string + rbx]
    mov [aux], al
    cmp byte [aux], 0    ;CONDICAO DO WHILE
    je .FIM_WHILE
    
    ;ENTROU NO WHILE
    ;-----------INICIO DO PARANAUE----------------
    ;--------AUX <- MAP[C]
    xor rcx, rcx
    mov cl, [aux]
    xor rdx, rdx
    mov dl, [map + rcx - 48]
    mov [aux], dl
    
    ;--------NUM <- NUM*10--------------
    mov rax, [num]
    mov rcx, 10
    mul rcx
    mov [num], rax
    
    ;--------NUM <- NUM + AUX-----------
    mov rax, [num]
    xor rcx, rcx
    mov cl, [aux]
    add rax, rcx
    mov [num], rax
    ;FIM DO PARANAUE
    
    ;INCREMENTO
    inc rbx
    jmp .INI_WHILE
    
.FIM_WHILE    

    mov rdi, escrita
    mov rsi, [num]
    xor rax, rax
    call printf

    xor rax, rax 
    ret