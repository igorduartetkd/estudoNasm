global main
extern printf, scanf

section .data
leitura db "%d", 0
escrita db "%d", 10, 0

segment .bss
soma RESQ 1
vetor RESQ 5

section .text
main:
        LEA RBX, [vetor + 8*RCX]    ;MOVE PARA RBX O RESULTADO DA OPERAÇAO ENTRE []

	MOV qword [vetor + 8], 3
        
        MOV RAX, vetor
        ADD RAX, 8
        MOV qword RAX, 5

	xor EAX, EAX
ret