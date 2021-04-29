extern scanf ; hacemos el import de scanf
extern printf ; hacemos el import de printf
section .data
    formato db "%d"
    mensaje db "Numero = %d",10,0

section .bss
    numero resd 1

    global main
section .text
main:
    call leer
    call imprimir
    jmp salir
leer:
    mov rdi,formato
    mov rsi,numero
    call scanf
    ret
imprimir:
    mov rdi,mensaje
    mov rsi,[numero]
    call printf
    ret

salir:
    mov rax,60
    mov rdi,0
    syscall
