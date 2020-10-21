global ft_strcpy

section .text
ft_strcpy:

	push rdi
	push rsi
.loop:
	cmp byte[rsi], 0
	je .end
	mov dl, [rsi]
	mov [rdi], dl
	inc rdi
	inc rsi
	jmp .loop

.end:
	mov byte[rdi], 0
	pop rsi
	pop rdi
	mov rax, rdi
	ret
