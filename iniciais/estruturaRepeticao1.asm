global main
extern printf, scanf

section .data
leitura db "%d", 0
escrita db "%d", 10, 0

segment .bss
n RESQ 1
argumento RESQ 1

section .text
main:
        mov qword [n], 5        


	XOR RBX, RBX			;ZERANDO O ITERADOR

	.INI_FOR
	CMP RBX, [n]			;5 PODE SER VALOR DE N
	JGE .FIM_FOR			;DESVIO SE FOR MAIOR OU IGUAL
	
	XOR RAX, RAX		
	MOV RDI, escrita 		
	mov rsi, rbx
	CALL printf
	
	INC RBX; 			;INCREMENTANDO O ITERADOR
	JMP .INI_FOR			;DESVIO INCONDICIONAL
	
	.FIM_FOR

    xor rax, rax
    ret