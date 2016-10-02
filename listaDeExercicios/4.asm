global main
extern printf, scanf

section .data
leitura db "%d %d", 0
escrita db "%d elevado a %d é: %d", 10, 0

section .bss
x resq 1
y resq 1
resultado resq 1

section .text
main:
       
    ;-----------LER X E Y---------------
    mov rdi, leitura
    mov rsi, x
    mov rdx, y
    xor rax, rax
    call scanf
    
    ;-----------CALCULA X ELEVADO A Y---------------
    xor rbx, rbx
    mov qword [resultado], 1
    
.INI_FOR
    cmp rbx, [y]
    jae .FIM_FOR
    mov rax, [resultado]    ;PARA A MULTIPLICACAO
    mul qword [x]        ;MULTIPLICA RAX POR CONTEUDO DE X
    mov [resultado], rax
    inc rbx
    jmp .INI_FOR
    
.FIM_FOR

    ;-----------IMPRIME O RESULTADO---------------    
    mov rdi, escrita
    mov rsi, [x]
    mov rdx, [y]
    mov rcx, [resultado]
    xor rax, rax
    call printf
    
    xor rax, rax
    ret