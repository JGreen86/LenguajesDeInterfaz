section .data
    msj1 db "Lenguajes de Interfaz",10
    lenMsj1 equ $-msj1
    msj2 db "Unidad 3 - Modularizacion",10
    lenMsj2 equ $-msj2
    msj3 db "Semestre Marzo-Julio 2021",10
    lenMsj3 equ $-msj3
section .bss
global main
section .text
main:
    mov rax,1
    mov rdi,1
    mov rsi,msj1
    mov rdx,lenMsj1
    syscall

    mov rax,1
    mov rdi,1
    mov rsi,msj2
    mov rdx,lenMsj2
    syscall

    mov rax,1
    mov rdi,1
    mov rsi,msj3
    mov rdx,lenMsj3
    syscall

salir:
    mov rax,60
    mov rdi,0
    syscall
