section .data
    msj db "HolaMundo",10
    lenMsj equ $-msj
    lenVar1 equ lenMsj+1
section .bss
    var1 resb lenVar1
global main
section .text
main:
    mov eax,[msj] ; movemos Hola a eax
    mov [var1],eax ; movemos Hola a var1
    mov [var1+4],BYTE 32 ; equivalente a concatenar "Hola" + " "
    mov eax,[msj+4] ; movemos 'Mund' a eax
    mov [var1+5],eax ; equivalente a concatenar "Hola " + "Mund"
    mov ax,[msj+8] ; movemos 'o',10 a ax
    mov [var1+9],ax ; equivalente a concatenar "Hola Mund" + "o",10

    mov rax,1
    mov rdi,1
    mov rsi,var1
    mov rdx,lenVar1
    syscall

    mov rax,60 ; sys_exit
    mov rdi,0
    syscall
