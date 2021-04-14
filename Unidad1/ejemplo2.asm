section .data
    msj db "Hola mundo!!!",10
    lenMsj equ $-msj
section .bss
    global main
section .text
main:
    mov rax,4 ; seleccionar la llamada al sistema sys_write
    mov rbx,1 ; para imprimir en pantalla
    mov rcx,msj ; direccion de memoria donde inicia la variable
    mov rdx,lenMsj ; longitud de la cadena msj
    int 0x80 ; interrupcion que contiene las llamadas al sistema

    mov rax,1 ; seleccionar la llamada al sistema sys_exit
    mov rbx,0 ; indicar que el programa termina sin errores
    int 0x80
