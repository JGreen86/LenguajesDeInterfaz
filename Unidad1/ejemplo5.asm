section .data
    msj db "Hola"

section .bss
    var1 resb 2

global main
section .text
main:
    ;mov ax,[msj] ; copiamos "Ho" en 'ax'
    ;mov [var1],al ; var1 = "H"

    mov ah,BYTE 65 ; 65 = 'A' en codigo ascii
    mov al,BYTE 66 ; 66 = 'B' en codigo ascii
    mov [var1],ax

    mov rax,1 ; sys_write
    mov rdi,1
    mov rsi,var1
    mov rdx,2
    syscall

    mov rax,60 ;sys_exit
    mov rdi,0 ; retornar sin errores
    syscall
