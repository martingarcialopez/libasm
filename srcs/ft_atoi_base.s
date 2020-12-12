global ft_atoi_base

section .text

check_base:

	cmp byte[rdi], 0
	jz .error
	inc rdi
	cmp byte[rdi], 0
	jz .error
	dec rdi
.loop0:
	cmp byte[rdi], 0
	jz .end0
	cmp byte[rdi], 32
	jz .error
	cmp byte[rdi], 43
	jz .error
	cmp byte[rdi], 45
	jz .error
	mov rcx, 1
.loop1:
	cmp byte[rdi + rcx], 0
	jz .end1
	mov dl, [rdi + rcx]
	cmp byte[rdi], dl
	jz .error
	inc rcx
	jmp .loop1
.end1:
	inc rdi
	jmp .loop0
.end0:
	mov al, 1
	ret
.error:
	xor al, al
	ret

ft_atoi_base:

	; rdi char *str
	; rsi char *base
	; r10 neg
	; r11 nb
	; r13 baselen
	; r14 tmp
	; r15 offset

	sub rsp, 127 ; reserve space on stack for a char[127] array
	push r13
	push r14
	push r15
	; after pushing 3 registers to the stack now the first element
	; of the array will be at [rsp + 24]

	push rdi
	mov rdi, rsi
	call check_base
	pop rdi
	cmp al, 0
	jz .base_error

	mov r10, rsp
	add r10, 24
	mov rcx, 127
.loop:
	cmp rcx, 0
	jz .loop0
	mov byte[r10], -1
	inc r10
	dec rcx
	jmp .loop
.loop0:
	cmp byte[rdi], 32
	jnz .end0
	inc rdi
	jmp .loop0
.end0:
	xor r10, r10
.hello:
	cmp byte[rdi], 45
	jnz .j0
	inc r10
	inc rdi
	jmp .hello
.j0:
	cmp byte[rdi], 43
	jnz .bye
	inc rdi
	jmp .hello
.bye:
	xor r11d, r11d
.loop1:
	cmp byte[rsi], 0
	jz .end1
	xor r15, r15
	add r15b, byte[rsi]
	add r15, 24
	mov byte[rsp + r15], r11b
	inc rsi
	inc r11b
	jmp .loop1
.end1:
	mov r13d, r11d
	xor r11d, r11d
.loop2:
	cmp byte[rdi], 0
	jz .end2
	xor r15, r15
	add r15b, byte[rdi]
	add r15, 24
	xor r14d, r14d
	mov r14b, byte[rsp + r15]
	cmp r14b, -1
	jz .end2
	imul r11d, r13d
	add r11d, r14d
	inc rdi
	jmp .loop2
.end2:
	mov eax, r11d
	cmp r10, 0
	jle .epilogue
	and r10, 1
	cmp r10, 0
	jz .epilogue
	imul eax, -1
.epilogue:
	pop r15
	pop r14
	pop r13
	add rsp, 127
	ret

.base_error:
	xor eax, eax
	jmp .epilogue
