global main
extern printf, scanf

section .data
leitura db "%d%d", 0
escrita db "*", 0
quebraLinha db "", 10, 0

section .bss
x resq 1
y resq 1
j resq 1

section .text
main:
    ;--------ler x e y----------
    mov rdi, leitura
    mov rsi, x
    mov rdx, y
    xor rax, rax
    call scanf
    
    xor rbx, rbx
.INI_FOR_1
        cmp rbx, [x]
        jae .FIM_FOR_1
        xor rcx, rcx
        mov [j], rcx
    .INI_FOR_2
            mov rcx, [j]
            cmp rcx, [y]
            jae .FIM_FOR_2
            mov rdi, escrita
            xor rax, rax
            call printf
            inc qword [j]
            jmp .INI_FOR_2
    .FIM_FOR_2
        mov rdi, quebraLinha
        xor rax, rax
        call printf
        inc rbx
        jmp .INI_FOR_1
.FIM_FOR_1
    
xor rax, rax
ret