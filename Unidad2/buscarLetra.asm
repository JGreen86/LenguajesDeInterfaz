section .data
    cadena db "abacda"
    lcad dd $-cadena
    letra db "a"
section .bss
    contador resd 1
global main
section .text
main:
    mov edi,0 ; representa la variable i
    mov ecx,0 ; representa nuestro contador
cicloFor:
    cmp edi,[lcad]
    jge imprimir ; if(edi >= lcad) imprimir
    mov al,[cadena+edi] ; equivalente a cadena[edi]
    inc edi ; nuestro i++
    cmp al,[letra]
    jne cicloFor ; if(al != letra) regresamos al ciclo for
    inc ecx
    jmp cicloFor
imprimir:
    mov [contador],ecx ; contador = ecx
    mov rax,1
    mov rdi,1
    mov rsi,contador
    mov rdx,4
    syscall
salir:
    mov rax,60
    mov rdi,0
    syscall
