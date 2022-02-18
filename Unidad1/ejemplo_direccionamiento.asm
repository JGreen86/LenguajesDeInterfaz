section .data
    var1 db "a"
    var2 db "b"
section .bss
    global main
section .text
main:
    ; ocupamos dos movimientos para hacer var1 = var2
    mov rax,[var2]
    mov [var1],rax

imprimir:
    mov rax,1
    mov rdi,1
    mov rsi,var1
    mov rdx,1
    syscall

    mov rax,60
    mov rdi,0
    syscall
