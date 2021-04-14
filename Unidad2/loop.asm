section .data
    msj db "Hola",10
    lenMsj equ $-msj
section .bss

    global main
section .text
main:
    mov rcx,5
ciclo:
    mov r14,rcx ; guardamos rcx
    mov rax,1
    mov rdi,1
    mov rsi,msj
    mov rdx,lenMsj
    syscall
    mov rcx,r14 ; restauramos rcx
    LOOP ciclo

salir:
    mov rax,60
    mov rbx,0
    syscall
