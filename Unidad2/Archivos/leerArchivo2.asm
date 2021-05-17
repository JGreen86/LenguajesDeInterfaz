section .data
    archivo db "prueba1.txt",0
    msj db "Fin del archivo",10
    lenMsj equ $-msj
section .bss
    texto resb 11
    texto2 resb 1
    global main
section .text
main:

abrir:
    mov rax,2 ; llamada al sistema sys_open para abrir archivo
    mov rdi,archivo
    mov rsi,2
    syscall
    mov r12,rax ; descriptor del archivo en rax lo pasamos a r12
leer:
    mov rax,0 ; llamada al sistema sys_read para leer del archivo
    mov rdi,r12
    mov rsi,texto
    mov rdx,11
    syscall
    ; despues de leer, rax contiene la cantidad de bytes leidos. Si rax=0, indica fin del archivo
    ; leemos de nuevo el archivo
    mov rax,0
    mov rdi,r12
    mov rsi,texto2
    mov rdx,1
    syscall
    ; ahora comparamos la cantidad de bytes leidos (rax) contra cero
    cmp rax,0
    jne imprimir
    ; si rax=0
    mov rax,1
    mov rdi,1
    mov rsi,msj
    mov rdx,lenMsj
    syscall
imprimir:
    mov rax,1 ; imprimir texto
    mov rdi,1
    mov rsi,texto
    mov rdx,11
   syscall
cerrar:
    mov rax,3 ; llamada al sistema sys_close para cerrar el archivo
    mov rdi,r12 ; descriptor del archivo
    syscall
salir:
    mov rax,60
    mov rdi,0
    syscall
