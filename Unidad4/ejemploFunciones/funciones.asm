section .text
global fsuma, fproducto, factorial
fsuma:
	;2 parámetros de entrada: rdi, rsi
	;no hay variables locales
	mov rax, rdi
	add rax, rsi
	ret ;retorno de resultado por medio de rax, rax=rdi+rsi
fproducto:
	;2 parámetros de entrada: rdi, rsi
	;no hay variables locales
	mov rax, rdi
	imul rax, rsi ;rax=rax*rsi=rdi*rsi
	ret ;retorno de resultado por medio de rax
factorial:
	;1 parámetro de entrada: rdi
	;no hay variables locales
	push rdi ;rdi es modificado por el procedimiento
	mov rax, 1 ;rax será el resultado
	while:
		imul rax, rdi
		dec rdi
		cmp rdi, 1 ;Se hace la comparación
		jg while ;Si se cumple la condición salta a while
		;En rax tendremos el valor del factorial de rdi
		pop rdi ;restauramos el valor de rdi
		ret
