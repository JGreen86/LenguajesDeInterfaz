section .data
	salto db 10
section .bss

	global main
section .text
main:
 	pop r9
    	add rsp,8
	dec r9
loop:
	cmp r9,0
	jz salir
	pop rsi
	mov rdx,0
while:
	cmp [rsi+rdx], BYTE 0
	je imprimir
	inc rdx
	jmp while
imprimir:
	mov rax,1
	mov rdi,1
	syscall

	mov rax,1
	mov rdi,1
	mov rsi,salto
	mov rdx,1
	syscall
	dec r9
	jmp loop
salir:
    mov rax,60
    mov rdi,0
    syscall
