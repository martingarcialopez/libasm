global ft_list_sort

extern ft_list_size

section .text

ft_list_sort:

	;rdi **begin_list
	;rsi int (*cmp)()

	cmp rdi, 0
	jz .end
	cmp rsi, 0
	jz .end
	push rdi
	mov rdi, [rdi]
	call ft_list_size
	pop rdi
	mov rcx, rax    ; list size to rcx
.loop:
	cmp rcx, 0      ; while ( size--)
	jle .end
	dec rcx
	mov rdx, [rdi]  ; rdx = *begin_lst
.loop2:
	cmp rdx, 0	; while (lst && lst->next)
	jz .loop
	cmp qword[rdx + 8], 0
	jz .loop

	push rdi
	push rsi
	push rdx
	push rcx
	push r11
	mov r10, rsi
	mov rdi, [rdx]    ; lst->data to first param
	mov r8, [rdx + 8]
	mov rsi, [r8]     ; lst->next->data to second param
	call r10          ; call function pointed by fnct ptr
	pop r11
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	cmp eax, 0        ; we compare ONLY first 4 bytes of rax (int size)
	jle .j2 
	mov r8, [rdx + 8] ; r8 = lst->next
	mov r9, [r8 + 8]  ; r9 = lst->next->next
	mov [rdx + 8], r9 ; lst->next = r9
	mov [r8 + 8], rdx ; r8->next = lst

	cmp rdx, [rdi]    ; if lst == *begin_lst
	jnz .j1
	mov [rdi], r8     ; *begin_list = r8
	jmp .j2
.j1:                      ; else
	mov [r11 + 8], r8 ; lst_prev->next = r8
.j2:
	mov r11, rdx
	mov rdx, [rdx + 8] ; lst = lst->next
	jmp .loop2
.end:
	ret
