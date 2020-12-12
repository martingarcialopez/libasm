global ft_list_size

section .text

ft_list_size:

	xor rax, rax
.loop:
	cmp rdi, 0
	jz .end
	inc rax
	mov rcx, [rdi + 8]
	mov rdi, rcx
	jmp .loop
.end:
	ret
