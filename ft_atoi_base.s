global ft_atoi_base

extern ft_strlen

section .text
ft_atoi_base:
	
	; str rdi
	; base rsi
	; neg r10
	; nb  r11
	; nblen	r12
	; baselen r13
	; tmp	r14
	; offset r15

	sub rsp, 127
	push r12
	push r13
	push r14
	push r15

.loop0:
	cmp byte[rdi], 32
	jnz .end0
	inc rdi
	jmp .loop0
.end0:
	xor r10, r10
	cmp byte[rdi], 45
	jnz .j0
	mov r10, 1
	inc rdi
.j0:
	call ft_strlen
	mov r12, rax
	xor r11, r11
.loop1:
	cmp byte[rsi], 0
	jz .end1
	xor r15, r15
	add r15b, byte[rsi]
	add r15, 32
	mov byte[rsp + r15], r11b
	inc rsi
	inc r11
	jmp .loop1
.end1:
	mov r13, r11
	xor r11, r11
.loop2:
	cmp byte[rdi], 0
	jz .end2
	dec r12
	xor r15, r15
	add r15b, byte[rdi]
	add r15, 32
	xor r14, r14
	mov r14b, byte[rsp + r15]
	push r12
	mov rax, 1
.loop3:
	cmp r12, 0
	jle .end3
	dec r12
	imul rax, r13
	jmp .loop3
.end3:
	pop r12
	imul r14, rax
	add r11, r14
	inc rdi
	jmp .loop2
.end2:
	mov rax, r11
	cmp r10, 1
	jnz .epilogue
	imul rax, -1
.epilogue:
	pop r15
	pop r14
	pop r13
	pop r12
	add rsp, 127
	ret
