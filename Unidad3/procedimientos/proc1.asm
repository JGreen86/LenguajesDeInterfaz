extern printf

section .data
    varX dd 8
    varY dd 8
    msj db "Resultado = %d",10,0
section .bss

global main

section .text
main:

    mov rax,[varX]
    mov rbx,[varY]

    sub rsp,8 ; reservamos espacio en la pila para el valor de retorno
    push rax ; pasamos primer parametro 'x'
    push rbx ; pasamos segundo parametro 'y'
    call miFuncion
    ; resultado se encuentra en el tope de la pila
    pop rsi
    call imprimir
    jmp salir

miFuncion:
    mov rcx,[rsp+16] ; recuperamos 'x'
    mov rdx,[rsp+8] ; recuperamos 'y'
    imul rcx,rdx ; rcx = rcx * rdx ; x = x * y
    mov [rsp+24],rcx ; colocamos el resultado en la posicion reservada
    mov rdi,[rsp] ; guardamos rsp en rdi
    mov [rsp+16],rdi ; movemos la direccion de retorno a rsp+16
    add rsp,16
    ret ; regresar a la posicion donde estaba al momento de llamar a miFuncion
imprimir:
    mov rdi,msj
    call printf
    ret
salir:
    mov rax,60
    mov rdi,0
    syscall
