section .data
    msj db "Hola mundo!!!",10
    lenMsj equ $-msj
section .bss
    var1 resb 5
    global main
section .text
main:
    mov eax,[msj]  ; copiamos a eax el contenido de msj
    mov [var1],eax ; copiamos eax a var1
    mov [var1+4],BYTE 10

    mov rax,1 ; selecciona la llamada al sistema sys_write
    mov rdi,1 ; descriptor que indica la pantalla como salida
    mov rsi,var1 ; colocamos en rsi la direccion de memoria de la cadena a imprimir
    mov rdx,5 ; colocamos en rdx la longitud de la cadena a imprimir (var1)
    syscall ; genera una llamada al sistema en 64 bits

    mov rax,60 ; selecciona la llamada al sistema sys_exit
    mov rbx,0 ; indicamos que el programa termina sin errores
    syscall
