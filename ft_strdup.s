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
	call ft_strcpy
	ret

.null:
	ret
