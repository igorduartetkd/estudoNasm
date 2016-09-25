global main
extern printf, scanf

section .data
leitura db "%d %d", 0
escrita db "O resultado da potencia e : %ld", 10, 0
instrucao db "Informe a base e o expoente:", 10, 0
testeDeLeitura db "Base: %d Expoente: %d", 10, 0

section .bss
base resq 1
expoente resq 1
resultado resq 1

section .text
main:
    ;;;;;;;;;;;;;;;ESCREVENDO A INSTRUCAO;;;;;;;;;;;;;;;;;;;
    mov rdi, instrucao
    xor rax, rax
    call printf
    
    ;;;;;;;;;;;;;;;LENDO A BASE E EXPOENTE;;;;;;;;;;;;;;;;;;;
    mov rdi, leitura
    mov rsi, base
    mov rdx, expoente
    xor rax, rax
    call scanf
    
    ;;;;;;;;;;;;;;;TESTANDO A LEITURA;;;;;;;;;;;;;;;;;;;
    ;mov rdi, testeDeLeitura
    ;mov rsi, [base]
    ;mov rdx, [expoente]
    ;xor rax, rax
    ;call printf
    
    ;;;;;;;;;;;;;;;EXECUTANDO A POTENCIACAO;;;;;;;;;;;;;;;;;;;
    mov qword [resultado], 1
    xor rbx, rbx
    .INI_FOR
    cmp rbx, [expoente]
    jge .FIM_FOR
    mov rax, [resultado]    ;PARA A MULTIPLICACAO
    mul qword [base]        ;MULTIPLICA RAX POR CONTEUDO DA BASE
    mov [resultado], rax
    
    inc rbx
    jmp .INI_FOR
    
    .FIM_FOR
    mov rdi, escrita
    mov rsi, [resultado]
    xor rax, rax
    call printf
    
    xor rax, rax
ret