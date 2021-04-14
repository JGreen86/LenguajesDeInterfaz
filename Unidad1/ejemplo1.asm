section .data
    msj db "Hola mundo!!!",10
    lenMsj equ $-msj
section .bss

    global main
section .text
main:
    mov rax,1 ; selecciona la llamada al sistema sys_write
    mov rdi,1 ; descriptor que indica la pantalla como salida
    mov rsi,msj ; colocamos en rsi la direccion de memoria de la cadena a imprimir
    mov rdx,lenMsj ; colocamos en rdx la longitud de la cadena a imprimir (msj)
    syscall ; genera una llamada al sistema en 64 bits

    mov rax,60 ; selecciona la llamada al sistema sys_exit
    mov rbx,0 ; indicamos que el programa termina sin errores
    syscall
