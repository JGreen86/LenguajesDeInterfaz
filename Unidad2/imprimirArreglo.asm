extern printf ; hacemos el import de printf
section .data
    mensaje db "Numero = %d",10,0
    arreglo dd 7,5,2,4,3

section .bss
    numero resd 1

    global main
section .text
main:
    mov rcx,3
    mov eax,[arreglo+rcx*4]
    mov [numero],eax
    call imprimir
    jmp salir
imprimir:
    mov rdi,mensaje
    mov rsi,[numero]
    call printf
    ret

salir:
    mov rax,60
    mov rdi,0
    syscall
