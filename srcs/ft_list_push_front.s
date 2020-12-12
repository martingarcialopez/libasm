global ft_list_push_front

extern malloc

section .text

ft_create_elem:

	push rdi
	mov rdi, 16
	call malloc
	pop rdi
	test rax, rax
	jz .ret
	mov [rax], rdi
	mov qword[rax + 8], 0
.ret:
	ret

ft_list_push_front:

	push rdi
	mov rdi, rsi
	call ft_create_elem
	pop rdi
	mov rcx, [rdi]
	mov [rax + 8], rcx
	mov [rdi], rax
	ret
