extern printf ; hacemos el import de printf

section .data
    cadena db "abacdaazaxayra"
    lcad equ $-cadena
    letra db "c"
    msjResultado db "contador = %d",10,0
section .bss
global main
section .text
main:
    mov rdi,cadena ; direccion de memoria de cadena
    mov rsi,lcad
    mov dl,[letra]
    call buscarLetra
    ; rax contiene el resultado
    mov rsi,rax
    call imprimir

    mov rdi,cadena
    mov rsi,lcad
    mov dl,BYTE "a"
    call buscarLetra
    mov rsi,rax
    call imprimir

    jmp salir

buscarLetra:
    mov r8d,0 ; representa la variable i
    mov rax,0 ; representa nuestro contador
    push r12
    cicloFor:
        cmp r8d,esi
        jl buscar ; if(r8d < lcad) buscar
        pop r12
        ret
        buscar:
            mov r12b,[rdi+r8] ; equivalente a cadena[r8d]
            inc r8d ; nuestro i++
            cmp r12b,dl
            jne cicloFor ; if(r11b != letra) regresamos al ciclo for
            inc rax
            jmp cicloFor

imprimir:
    mov rdi,msjResultado ; primer parametro de la funcion printf
    call printf
    ret
salir:
    mov rax,60
    mov rdi,0
    syscall
