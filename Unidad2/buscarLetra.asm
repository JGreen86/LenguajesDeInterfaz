extern printf ; hacemos el import de printf

section .data
    cadena db "abacdaaza"
    lcad equ $-cadena
    letra db "a"
    msjResultado db "contador = %d",10,0
section .bss
global main
section .text
main:
    mov edi,0 ; representa la variable i
    mov rcx,0 ; representa nuestro contador
cicloFor:
    cmp edi,lcad
    jge imprimir ; if(edi >= lcad) imprimir
    mov al,[cadena+edi] ; equivalente a cadena[edi]
    inc edi ; nuestro i++
    cmp al,[letra]
    jne cicloFor ; if(al != letra) regresamos al ciclo for
    inc ecx
    jmp cicloFor

imprimir:
    push rbp
    mov rdi,msjResultado ; primer parametro de la funcion printf
    mov rsi,rcx ; segundo parametro de la funcion printf
    call printf
    pop rbp
salir:
    mov rax,60
    mov rdi,0
    syscall
