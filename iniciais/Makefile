all: rodar

rodar: programa
	./programa

programa: *.o
	gcc *.o -o programa

*.o: *.asm
	nasm -f elf64 -g *.asm

