section .data

section .bss
    var resb 8
    global main
section .text
main:
    ; sys_read para leer del teclado
    mov rax,0
    mov rdi,0
    mov rsi,var
    mov rdx,8
    syscall
    ; sys_write para imprimir en pantalla
    mov rax,1
    mov rdi,1
    mov rsi,var
    mov rdx,8
    syscall
salir:
    mov rax,60
    mov rdi,0
    syscall
