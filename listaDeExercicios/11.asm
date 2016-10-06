global main
extern printf, scanf

section .data
leitura db "%d", 0
escrita db "%d ", 0
quebraLinha db 10, 0
escritaC db "Somente em A: ", 0
escritaD db "Somente em B: ", 0
escritaI db "Em A e B    : ", 0  
escritaU db "Em A ou B   : ", 0
tamC dq 0
tamD dq 0
tamI dq 0
tamU dq 5

section .bss
A resq 5
B resq 5
C resq 5
D resq 5
I resq 5
U resq 10
aux resq 1
j resq 1
flag resb 1

section .text
main:
    mov rbp, rsp; for correct debugging
    ;----ler A----
    xor rbx, rbx
    .INI_FOR_LEITURA_A
        ;---------i<5--------
        cmp rbx, 5
        jae .FIM_FOR_LEITURA_A
        ;---------ler A[i]---------
        mov rdi, leitura
        mov rsi, aux
        xor rax, rax
        call scanf
        mov rax, [aux]
        mov [A + 8*rbx], rax
        ;-----------i++--------------
        inc rbx
        jmp .INI_FOR_LEITURA_A
    .FIM_FOR_LEITURA_A
    xor rbx, rbx
    .INI_FOR_LEITURA_B
        ;---------i<5--------
        cmp rbx, 5
        jae .FIM_FOR_LEITURA_B
        ;---------ler B[i]---------
        mov rdi, leitura
        mov rsi, aux
        xor rax, rax
        call scanf
        mov rax, [aux]
        mov [B + 8*rbx], rax
        ;-----------i++--------------
        inc rbx
        jmp .INI_FOR_LEITURA_B
    .FIM_FOR_LEITURA_B
    ;---------percorre A------------
    xor rbx, rbx
    .INI_FOR_1
        ;-------i<5----------
        cmp rbx, 5
        jae .FIM_FOR_1
        mov rax, [A + 8*rbx]
        mov [U + 8*rbx], rax
        ;-----j = 0--------
        mov qword [j], 0
        .INI_FOR_2
            ;--------j<5---------
            cmp qword [j], 5
            jae .SENAO_1
            ;---------A[i] != B[j]-------
            mov rax, [j]
            mov rcx, [B + 8*rax]
            cmp [A + 8*rbx], rcx
            je .FIM_FOR_2
            ;------------j++------------
            inc qword [j]
            jmp .INI_FOR_2
        .FIM_FOR_2
        ;--------I[tamI] = A[I]----------
        mov rax, [A + 8*rbx]
        mov rcx, [tamI]
        mov [I + 8*rcx], rax
        ;---------tamI++-------------
        inc qword [tamI]
        jmp .FIM_SE_1
        .SENAO_1
            ;---------C[tamC] = A[i]-----
            mov rax, [A + 8*rbx]
            mov rcx, [tamC]
            mov qword [C + 8*rcx], rax
            ;---------tamC++---------
            inc qword [tamC]
        .FIM_SE_1
        ;----i++-------
        inc rbx
        jmp .INI_FOR_1
    .FIM_FOR_1
    ;-----------PERCORRE B---------------
    ;---------i = 0----------------
    xor rbx, rbx
    .INI_FOR_3
        ;-----------i<5------------
        cmp rbx, 5
        jae .FIM_FOR_3
        ;--------j = 0-------------
        mov qword [j], 0
        mov byte [flag], 1
        .INI_FOR_4
            ;----------j<tamI----------
            mov rcx, [tamI]
            cmp [j], rcx
            jae .FIM_FOR_4
            ;-----------B[i] != I[j]------
            mov rcx, [j]
            mov rdx, [I + 8*rcx]
            cmp qword [B + 8*rbx], rdx
            je .FIM_SE_4
            ;----------j++--------------
            inc qword [j]
            jmp .INI_FOR_4
        .FIM_FOR_4
        ;----------D[tamD] = B[i]--------
        mov rcx, [B + 8*rbx]
        mov rax, [tamD]
        mov [D + 8*rax], rcx
        ;-----------tamD++-------------
        inc qword [tamD]
        ;-----------U[tamU] = B[i]-------
        mov rax, [tamU]
        mov [U + 8*rax], rcx
        ;-----------tamU++-------------
        inc qword [tamU]
        .FIM_SE_4
        ;----------i++-----------
        inc rbx
        jmp .INI_FOR_3
    .FIM_FOR_3
    ;IMPRIME RESULTADO
    ;----------IMPRIME ESCRITAC-----------
    mov rdi, escritaC
    xor rax, rax
    call printf
    xor rbx, rbx
    .INI_FOR_5
        ;----------I<tamC--------
        cmp rbx, [tamC]
        jae .FIM_FOR_5
        ;----------IMPRIME C[I]---------
        mov rdi, escrita
        mov rsi, [C + 8*rbx]
        xor rax, rax
        call printf
        ;----------i++---------
        inc rbx
        jmp .INI_FOR_5
    .FIM_FOR_5
    ;imprime quebra de linha  
    mov rdi, quebraLinha
    xor rax, rax
    call printf
    ;-------inprime escritaD------
    mov rdi, escritaD
    xor rax, rax
    call printf
    xor rbx, rbx
    .INI_FOR_6
        ;----------I<tamD--------
        cmp rbx, [tamD]
        jae .FIM_FOR_6
        ;----------IMPRIME D[I]---------
        mov rdi, escrita
        mov rsi, [D + 8*rbx]
        xor rax, rax
        call printf
        ;----------i++---------
        inc rbx
        jmp .INI_FOR_6
    .FIM_FOR_6
    ;imprime quebra de linha  
    mov rdi, quebraLinha
    xor rax, rax
    call printf
    ;-------inprime escritaI------
    mov rdi, escritaI
    xor rax, rax
    call printf
    xor rbx, rbx
    .INI_FOR_7
        ;----------I<tamI--------
        cmp rbx, [tamI]
        jae .FIM_FOR_7
        ;----------IMPRIME I[I]---------
        mov rdi, escrita
        mov rsi, [I + 8*rbx]
        xor rax, rax
        call printf
        ;----------i++---------
        inc rbx
        jmp .INI_FOR_7
    .FIM_FOR_7
    ;imprime quebra de linha  
    mov rdi, quebraLinha
    xor rax, rax
    call printf
    ;-------inprime escritaU------
    mov rdi, escritaU
    xor rax, rax
    call printf
    xor rbx, rbx
    .INI_FOR_8
        ;----------I<tamU--------
        cmp rbx, [tamU]
        jae .FIM_FOR_8
        ;----------IMPRIME U[I]---------
        mov rdi, escrita
        mov rsi, [U + 8*rbx]
        xor rax, rax
        call printf
        ;----------i++---------
        inc rbx
        jmp .INI_FOR_8
    .FIM_FOR_8
    ;imprime quebra de linha  
    mov rdi, quebraLinha
    xor rax, rax
    call printf
xor rax, rax
ret