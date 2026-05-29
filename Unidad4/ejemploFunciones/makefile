run:
	nasm -f elf64 funciones.asm
	gcc -m64 -no-pie principal.c funciones.o -o principal
	./principal
