section .data
    archivo db "prueba2.txt",0
    msj db "Hola que ase",10
    lenMsj equ $-msj
section .bss
    texto resb 11

    global main
section .text
main:

abrir:
    mov rax,2 ; llamada al sistema sys_open para abrir archivo
    mov rdi,archivo
    mov rsi,66
    mov rdx,438
    syscall
    mov r12,rax ; descriptor del archivo en rax lo pasamos a r12
escribir:
    mov rax,1
    mov rdi,r12
    mov rsi,msj
    mov rdx,lenMsj
    syscall
cerrar:
    mov rax,3 ; llamada al sistema sys_close para cerrar el archivo
    mov rdi,r12 ; descriptor del archivo
    syscall
salir:
    mov rax,60
    mov rdi,0
    syscall
