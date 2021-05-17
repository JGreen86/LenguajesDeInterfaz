section .data
    op1 db 0b01000001
    op2 db 0b01100010
section .bss
    resul resb 1

global main
section .text
main:
    mov rax,[op1]
    AND rax,[op2]
    mov [resul],rax

    ; sys_write
    mov rax,1
    mov rdi,1
    mov rsi,resul
    mov rdx,1
    syscall

salir:
    mov rax,60
    mov rdi,0
    syscall
