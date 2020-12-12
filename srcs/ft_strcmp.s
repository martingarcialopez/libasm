global ft_strcmp

section .text
ft_strcmp:

	xor eax, eax ; set first 4 bytes of rax to 0
	xor rcx, rcx
.loop:
	mov al, [rdi + rcx] ; al -> first byte of rax
	cmp al, 0
	je .end
	cmp byte[rsi + rcx], 0
	je .end
	cmp al, [rsi + rcx]
	jnz .end
	inc rcx
	jmp .loop
.end:
	xor edx, edx
	mov dl, [rsi + rcx]
	sub eax, edx
	ret
