global main
extern printf, scanf

section .data
leitura db "%d", 0
escrita db "%d ", 0


section .bss
A resq 10
aux resq 1
j resq 1

section .text
main:
    mov rbp, rsp; for correct debugging
    ;LER VETOR
    ;;--------i = 0-----------
    xor rbx, rbx
    .INI_FOR_LEITURA
        ;----------i<10----------
        cmp rbx, 10
        jae .FIM_FOR_LEITURA
        ;----------ler A[i]------
        mov rdi, leitura
        mov rsi, aux
        xor rax, rax
        call scanf
        mov rax, [aux]
        mov [A + 8*rbx], rax
        ;----------i++----------
        inc rbx
        jmp .INI_FOR_LEITURA
    .FIM_FOR_LEITURA
    ;PARANAUE
    ;-------------i=0--------------
    xor rbx, rbx
    .INI_FOR_1
        ;------------i<10-----------
        cmp rbx, 10
        jae .FIM_FOR_1
        ;------------j=0-------------
        mov qword [j], 0
        .INI_FOR_2
            ;-----------j<10----------
            cmp qword [j], 10
            jae .QUASE_FIM_FOR_2
            ;----------i!=j------------
            cmp rbx, [j]
            je .CONTINUE_FOR_2
            ;-----------A[i] != A[j]--------
            mov rcx, [A + 8*rbx]
            mov rax, [j]
            mov rdx, [A + 8*rax]
            cmp rdx, rcx
            je .FIM_FOR_2
            .CONTINUE_FOR_2
            ;-----------j++------------
            inc qword [j]
            jmp .INI_FOR_2
            .QUASE_FIM_FOR_2
            ;------------IMPRIME A[I]---------
            mov rdi, escrita
            mov rsi, [A + 8*rbx]
            xor rax, rax
            call printf
        .FIM_FOR_2
        ;-------------I++-----------------
        inc rbx
        jmp .INI_FOR_1
    .FIM_FOR_1
xor rax, rax
ret