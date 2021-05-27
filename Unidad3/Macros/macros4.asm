%macro llamada 4
    mov rax,%1
    mov rdi,%2
    mov rsi,%3
    mov rdx,%4
    syscall
%endmacro

section .data
    archivo db "archivo.txt",0
section .bss
    texto resb 11

    global main
section .text
main:

abrir:
    llamada 2,archivo,2,0 ; llamada al sistema sys_open para abrir archivo
    mov r12,rax ; descriptor del archivo en rax lo pasamos a r12
leer:
    llamada 0,r12,texto,11 ; llamada al sistema sys_read para leer del archivo
imprimir:
    llamada 1,1,texto,11 ; imprimir texto
cerrar:
    llamada 3,r12,0,0 ; llamada al sistema sys_close para cerrar el archivo
salir:
    llamada 60,0,0,0
