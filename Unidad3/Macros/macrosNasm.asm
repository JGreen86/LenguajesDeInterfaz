%macro imprimir 2
    mov rax,1
    mov rdi,1
    mov rsi,%1
    mov rdx,%2
    syscall
%endmacro

section .data
    msj db "i < 5",10
    lenMsj equ $-msj
    msj2 db "i >= 5",10
    lenMsj2 equ $-msj2
section .bss
    global main
section .text
main:

ciclo:
    %assign i 0 ; i = 0
    %rep 10 ; repetir 10 veces
        %if i < 5
            imprimir msj,lenMsj
        %else
            imprimir msj2,lenMsj2
        %endif
        %assign i i+1
    %endrep
    ; NOTA: %exitrep permite salir del ciclo indicado por %rep
salir:
    mov rax,60
    mov rdi,0
    syscall
