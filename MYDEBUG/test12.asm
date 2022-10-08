assume cs:code

code segment

start:call s0;计算字节
	db 'divide error'
s0: pop si;指向字符串首地址
	mov ax,cs
	mov ds,ax

	mov ax,0b800h;指向中间
	mov es,ax
	mov di,12*160+68

	mov ah,4;写入显存
	mov cx,12
s1: mov al,ds:[si]
	mov es:[di],ax
	inc si
	add di,2
	loop s1

	mov ax,4c00h;返回dos
	int 21h
end0:nop;计算字节
code ends
end start