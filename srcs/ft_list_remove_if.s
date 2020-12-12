global ft_list_remove_if

extern free

section .text

ft_list_remove_if:

	; rdi **begin_list
	; rsi *data_ref
	; rdx int (*cmp)()
	; rcx void (*free_fct)(void*)
	; r12 *current
	; r13 *last
	; r14 *tmp

	push r12
	push r13
	push r14
	mov r12, [rdi]
.loop0:
	cmp r12, 0
	jz .end0
	push rdi
	push rsi
	push rdx
	push rcx
	mov rdi, [r12]
	call rdx
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	cmp eax, 0
	jnz .j0
	cmp r12, [rdi]
	jnz .j1
	mov r14, [r12 + 8]
	mov [rdi], r14
	jmp .j2
.j1:
	mov r14, [r12 + 8]
	mov [r13 + 8], r14
.j2:
	mov r14, r12
	mov r12, [r12 + 8]
	push rdi
	push rsi
	push rdx
	push rcx
	mov rdi, [r14]
	call rcx
	mov rdi, r14
	call free
	pop rcx
	pop rdx
	pop rsi
	pop rdi
.j0:
	mov r13, r12
	mov r12, [r12 + 8]
	jmp .loop0
.end0:
	pop r14
	pop r13
	pop r12
	ret
