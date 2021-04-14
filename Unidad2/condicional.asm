section .data
    msjIguales db "Son iguales",10
    lenMsjIguales equ $-msjIguales
    msjDif db "Son diferentes",10
    lenMsjDif equ $-msjDif
    n1 dd 5  ; int n1 = 5
    n2 dd 5 ; int n2 = 5
section .bss

global main
section .text
main:
    mov eax,[n1]
    cmp eax,[n2] ; comparamos eax(n1) con n2
    je cierto ; if(n1 == n2) entonces salta a la etiqueta cierto | je = 'jump if equals'
    ; else (imprimir msjDif)
    mov rax,1
    mov rdi,1
    mov rsi,msjDif
    mov rdx,lenMsjDif
    syscall
    jmp salir ; salta a la etiqueta salir
cierto:
    ; imprimir msjIguales
    mov rax,1
    mov rdi,1
    mov rsi,msjIguales
    mov rdx,lenMsjIguales
    syscall
salir:
    mov rax,60
    mov rbx,0
    syscall
