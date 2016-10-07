global main
extern printf, scanf

section .data
leitura db "%d", 0
escrita db "%d",9, 0
quebraLinha db 10, 0

section .bss
A resq 9
B resq 9
C resq 9
j resq 1
aux resq 1

section .text
main:
    mov rbp, rsp; for correct debugging
    ;LER A
    ;I=0
    xor rbx, rbx
    .INI_FOR_1
    
        ;I<3
        cmp rbx, 3
        jae .FIM_FOR_1
        
        ;J = 0
        mov qword [j], 0
        .INI_FOR_2
        
            ;J<3
            cmp qword [j], 3
            jae .FIM_FOR_2
            
            ;ler A[i][j]
            mov rdi, leitura
            mov rsi, aux
            xor rax, rax
            call scanf
            mov rcx, [aux]
            mov rax, 3
            mul rbx
            add rax, [j]
            mov [A + 8*rax], rcx
            
            ;j++
            inc qword [j]
            jmp .INI_FOR_2
        .FIM_FOR_2
        
        ;i++
        inc rbx
        jmp .INI_FOR_1
    .FIM_FOR_1
    
    ;LER b
    ;I=0
    xor rbx, rbx
    .INI_FOR_1_2
    
        ;I<3
        cmp rbx, 3
        jae .FIM_FOR_1_2
        
        ;J = 0
        mov qword [j], 0
        .INI_FOR_2_2
        
            ;J<3
            cmp qword [j], 3
            jae .FIM_FOR_2_2
            
            ;ler B[i][j]
            mov rdi, leitura
            mov rsi, aux
            xor rax, rax
            call scanf
            mov rcx, [aux]
            mov rax, 3
            mul rbx
            add rax, [j]
            mov [B + 8*rax], rcx
            
            ;j++
            inc qword [j]
            jmp .INI_FOR_2_2
        .FIM_FOR_2_2
        
        ;i++
        inc rbx
        jmp .INI_FOR_1_2
    .FIM_FOR_1_2
    
    ;inicio C = A+B
    ;I=0
    xor rbx, rbx
    .INI_FOR_3
        ;I<3
        cmp rbx, 3
        jae .FIM_FOR_3
        
        ;J=0
        mov qword [j], 0
        
        .INI_FOR_4
            ;J<3
            cmp qword [j], 3
            jae .FIM_FOR_4
            
            ;C[I][J] = A[I][J] + B[I]J]
            mov rax, 3
            mul rbx
            add rax, [j]
            mov rdi, rax
            mov rcx, [A + 8*rdi]
            mov rdx, [B + 8*rdi]
            add rcx, rdx
            mov [C + 8*rdi], rcx    
            
            ;j++
            inc qword [j]
            jmp .INI_FOR_4
        .FIM_FOR_4    
        ;I++
        inc rbx
        jmp .INI_FOR_3
    .FIM_FOR_3
    
    ;IMPRIMIR C
    ;I=0
    xor rbx, rbx
    .INI_FOR_1_2_2
    
        ;I<3
        cmp rbx, 3
        jae .FIM_FOR_1_2_2
        
        ;J = 0
        mov qword [j], 0
        .INI_FOR_2_2_2
        
            ;J<3
            cmp qword [j], 3
            jae .FIM_FOR_2_2_2
            
            ;IMPRIMIR C[i][j]
            mov rax, 3
            mul rbx
            add rax, [j]
            mov rsi, [C + 8*rax]
            
            mov rdi, escrita
            xor rax, rax
            call printf
           
            
            ;j++
            inc qword [j]
            jmp .INI_FOR_2_2_2
        .FIM_FOR_2_2_2
        
        ;quebra linha
        mov rdi, quebraLinha
        xor rax, rax
        call printf
        
        ;i++
        inc rbx
        jmp .INI_FOR_1_2_2
    .FIM_FOR_1_2_2
xor rax, rax
ret