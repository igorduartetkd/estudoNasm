global main
extern printf, scanf

section .data
leitura db "%s", 0
escrita db "Vogais: %d", 10, "Consoantes: %d", 10, "Algarismos: %d", 10, "Outros: %d", 10, 0
vetVogais     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
vetConsoantes db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
vetAlgarismos db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
vetOutros     db 0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
vogais      dq 0
consoantes  dq 0
algarismos  dq 0
outros      dq 0

section .bss
caracter resb 1
string resb 100


section .text

main:    

    ;--------LER STRING--------------
    mov rdi, leitura
    mov rsi, string
    xor rax, rax
    call scanf
    
    xor rbx, rbx

.INI_WHILE

    ;----------C <- STRING[I]----------
    mov ah, [string + rbx]
    mov [caracter], ah    
    cmp byte [caracter], 0
    je .FIM_WHILE
    
    ;----------INCREMENTANDO NAS VARIAVEIS----------
    xor rcx, rcx
    mov cl, [caracter]

    
    ;vogal
    xor rax, rax
    mov al, [vetVogais + rcx]
    mov rdx, [vogais]
    add rdx, rax
    mov [vogais], rdx
    
    ;consoantes
    xor rax, rax
    mov al, [vetConsoantes + rcx]
    mov rdx, [consoantes]
    add rdx, rax
    mov [consoantes], rdx
    
    ;algarismos
    xor rax, rax
    mov al, [vetAlgarismos + rcx]
    mov rdx, [algarismos]
    add rdx, rax
    mov [algarismos], rdx
    ;outros
    xor rax, rax
    mov al, [vetOutros + rcx]
    mov rdx, [outros]
    add rdx, rax
    mov [outros], rdx
    ;----------I <- I+1 E DESVIO INCONDICIONAL----------
    inc rbx
    jmp .INI_WHILE
    
.FIM_WHILE
    ;---------IMPRIMINDO O RESULTADO-----------
    mov rdi, escrita
    ;mov rsi, [vogais]
    mov rsi, [vogais]
    mov rdx, [consoantes]
    mov rcx, [algarismos]
    mov r8, [outros]
    xor rax, rax
    call printf
   
    xor rax, rax
    ret