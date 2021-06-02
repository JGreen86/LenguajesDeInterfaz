extern printf

section .data
    varX dd 8
    varY dd 5
    msj db "Resultado = %d",10,0
section .bss

global main

section .text
main:
    mov rdi,[varX] ; pasamos primer parametro 'x'
    mov rsi,[varY] ; pasamos segundo parametro 'y'
    call miFuncion
    ; resultado se encuentra en rax
    mov rsi,rax
    call imprimir
    jmp salir

miFuncion:
    imul rdi,rsi ; rdi = x * y
    mov rax,rdi ; resultado en rax
    ret ; regresar a la posicion donde estaba al momento de llamar a miFuncion
imprimir:
    mov rdi,msj
    call printf
    ret
salir:
    mov rax,60
    mov rdi,0
    syscall
