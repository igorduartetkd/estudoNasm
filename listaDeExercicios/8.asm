global main
extern printf, scanf

section .data
leitura db "%[^\]", 0 ;nao sei como mas funcionou assim
escrita db "%s",10, 0
testeEscrita db "%d ",10, 0 



section .bss
vetTransforma resb 257
vetString resb 102
caracter resb 1

section .text
main:
    ;populando vetTranforma
    xor rbx, rbx
.INI_FOR
    cmp rbx, 257
    ja .FIM_FOR
    mov [vetTransforma + rbx], rbx
    inc rbx
    jmp .INI_FOR
    
.FIM_FOR    

    ;trocando os minusculos por maiusculos no vetor de transformacao
    mov rbx, 65
.INI_FOR_2
    cmp rbx, 90
    ja .FIM_FOR_2
    mov [vetTransforma + rbx + 32], rbx
    inc rbx
    jmp .INI_FOR_2
    
.FIM_FOR_2

    ;lendo a entrada
    mov rdi, leitura
    mov rsi, vetString
    xor rax, rax
    call scanf
    
    xor rbx, rbx
.INI_WHILE

    ;----------C <- STRING[I]----------
    xor rax, rax
    mov al, [vetString + rbx]
    mov [caracter], al
        
    cmp byte [caracter], 0
    je .FIM_WHILE
    
    ;-----------PASSAR PELO VETOR MAPEADO
    xor rdx, rdx
    xor rax, rax
    mov al, [caracter]
    ;mov cl, ah
    mov dl, [vetTransforma + rax]
    mov [vetString + rbx], dl
    
    ;----------I <- I+1 E DESVIO INCONDICIONAL----------
    inc rbx
    jmp .INI_WHILE
    
    
    
.FIM_WHILE

    ;--------IMPRIMINDO O RESULTADO---------    
    mov rdi, escrita
    mov rsi, vetString
    xor rax, rax
    call printf
    
    xor rax, rax
    ret