section .data
    op1 db 0b01000001
    op2 db 0b01100010

    op3 db "A"
    op4 db "j"
section .bss
    resul resb 1

global main
section .text
main:
    mov al,[op1]
    AND al,[op2]
    mov [resul],al
;   jmp imprimir

    mov al,[op3]
    AND al,[op4]
    mov [resul],al
;   jmp imprimir

    mov al,[op3]
    OR al,[op4]
    mov [resul],al
;   jmp imprimir

    mov al,[op3]
    XOR al,[op4]
    XOR al,[op4]
    mov [resul],al
;    jmp imprimir

    mov al,[op3]
    NOT al
    mov [resul],al
;   jmp imprimir
imprimir:
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
