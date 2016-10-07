global main
extern printf, scanf

section .data
leitura db "%[^\]", 0 
escrita db "%s", 10, 0
teste dq 2

section .bss
string resb 100
tam resq 1
metade resq 1
aux1 resb 1

section .text
main:
    mov rbp, rsp; for correct debugging
    ;------ler string----------
    mov rdi, leitura
    mov rsi, string
    xor rax, rax
    call scanf
    
    ;encontrar tamanho
    ;------i=0----------
    xor rbx, rbx
    
    .INI_FOR_1
        ;---------aux1 = string[i]---------
        mov al, [string + rbx]
        mov [aux1], al
        
        ;----------aux1 != 0---------------
        cmp byte [aux1], 0
        je .FIM_FOR_1
        
        ;-----------i++-----------------
        inc rbx
        jmp .INI_FOR_1
    .FIM_FOR_1
    
    ;tamanho = i
    mov [tam], rbx
    
    ;metade = (i+1)/2
    inc rbx
    mov rax, rbx
    xor rdx, rdx
    div qword [teste]
    mov [metade], rax
    
    ;percorrr ate metade trocando 
    ;i = 0
    xor rbx, rbx
    
    .INI_FOR_2
        ;i<metade
        cmp rbx, [metade]
        jae .FIM_FOR_2
        
        ;aux1 = string[i]
        mov al, [string + rbx]
        mov [aux1], al
        
        ;string[i] = string[tam-i-1]
        mov rdx, [tam]
        sub rdx, rbx
        sub rdx, 1
        mov al, [string + rdx]
        mov [string + rbx], al
        
        ;string[tam-i-1] = aux1
        mov al, [aux1]
        mov [string + rdx], al
        
        ;i++
        inc rbx
        jmp .INI_FOR_2
    .FIM_FOR_2
    
    ;imprime string
    mov rdi, escrita
    mov rsi, string
    xor rax, rax
    call printf
xor rax, rax
ret