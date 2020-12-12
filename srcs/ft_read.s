global ft_read

extern __errno_location

section .text
ft_read:

	mov rax, 0 ; 0, syscall number for read
	syscall
	test rax,rax
	js .error ; jump if sign flag
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
