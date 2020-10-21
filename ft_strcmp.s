global ft_strcmp

section .text
ft_strcmp:

	xor rcx, rcx
.loop:
	cmp byte[rdi + rcx], 0
	je .end
	cmp byte[rsi + rcx], 0
	je .end
	mov al, [rdi + rcx]
	cmp [rsi + rcx], al
	jnz .end
	inc rcx
	jmp .loop

.end:
	xor rax, rax
	xor rdx, rdx
	mov al, [rdi + rcx]
	mov dl, [rsi + rcx]
	sub rax, rdx
	ret
