%macro imprimir 2
    mov rax,1
    mov rdi,1
    mov rsi,%1
    mov rdx,%2
    syscall
%endmacro

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
    imprimir msj1,lenMsj1
    imprimir msj2,lenMsj2
    imprimir msj3,lenMsj3
salir:
    mov rax,60
    mov rdi,0
    syscall
