global ft_read
extern __ernno_location

section .text
ft_read:

	mov rax, 0
	syscall
	test rax,rax
	js .error
	ret

.error
	imul rax, -1
	mov r10, rax
	push
	call __errno_location
	pop r10
	mov [rax], r10
	mov rax, -1
	ret
