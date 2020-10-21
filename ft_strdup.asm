global ft_strdup

extern malloc
extern ft_strlen
extern ft_strcpy

section .text
ft_strdup:

	push rdi
	call ft_strlen
	add rax, 1
	mov rdi, rax
	call malloc
	test rax, rax
	jz .null
	mov rdi, rax
	pop rsi
	push rax
	call ft_strcpy
	pop rax
	ret

.null:
	xor rax, rax
	ret
