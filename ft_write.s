global ft_write
extern __errno_location

section .text
ft_write:

	mov rax, 1
	syscall
	test rax, rax
	js .error
	ret

.error:
	imul rax, -1
	mov r10, rax
	push r10
	call __errno_location
	pop r10
	mov [rax], r10
	mov rax, -1
	ret
