assume cs:codesg

datasg segment
	db "Beginner's All-purpose Symbolic Instruction Code.",0
datasg ends

codesg segment
begin:
	mov ax,datasg
	mov ds,ax
	mov si,0
	call letterc

	mov ax,4c00h
	int 21h

letterc:
	push si
	push ax
	push bx
	push cx

s:
	mov al,ds:[si]
	cmp al,0
	je ok
	cmp al,97
	jb next
	sub al,29h
	mov ds:[si],al
next:
	inc si
	jmp s

	ok:
	pop cx
	pop bx
	pop ax
	pop si
	ret
codesg ends
end begin