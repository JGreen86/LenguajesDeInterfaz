extern printf
section .data
    msj db "%d",10,0
section .bss

    global main
section .text
main:
    mov rax,5
    mov rbx,7
    mov rcx,3

    push rax
    push rbx
    push rcx

    add rsp,16
    pop rsi

    call imprimir
    jmp salir

imprimir:
    mov rdi,msj
    call printf
    ret
salir:
    mov rax,60
    mov rdi,0
    syscall
