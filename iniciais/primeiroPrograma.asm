global main
extern printf, scanf

section .data
texto1 db "5x5 usando mul :%d", 10, 0
texto2 db "5x5 usando LEA :%d", 10, 0

section .bss
valor RESQ 1
resultado RESQ 1


section .text
main:

        mov qword [valor], 5
        
        mov qword RDI, texto1
       
        mov RAX, [valor]
        mul qword [valor]
        MOV [resultado], RAX
        mov RSI, [resultado]

        xor RAX, RAX
        call printf
        
        mov RBX, [valor]
        LEA RBX, [RBX * 5]
        mov [resultado], RBX
        mov RSI, [resultado]
        mov qword RDI, texto1
        xor RAX, RAX
        call printf

	xor RAX, RAX
ret