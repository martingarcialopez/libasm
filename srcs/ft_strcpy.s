global ft_strcpy

section .text
ft_strcpy:

	push rdi
	push rsi
.loop:
	cmp byte[rsi], 0
	je .end
	mov dl, [rsi] ; copy a byte of
	mov [rdi], dl ; source to dest
	inc rdi
	inc rsi
	jmp .loop
.end:
	mov byte[rdi], 0 ; NULL terminate string
	pop rsi		 ; restore register values
	pop rdi
	mov rax, rdi	 ; return dest pointer
	ret
