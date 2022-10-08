assume cs:codesg,ss:stacksg,ds:datasg
stacksg segment
	dw 0,0,0,0,0,0,0,0
stacksg ends
datasg segment
	db '1.display'
	db '2.display'
	db '3.display'
	db '4.display'
datasg ends

codesg sgment
	start:
	mov ax,stacksg
	mov ss,ax
	mov sp,16;定义空栈

	mov ax,datasg
	mov ds,ax
	mov bx,0;使用段寄存器ds指向数据段datasg
	mov cx,4;外层循环次数
	s1:
	push cx
	mov si,0;内层循环的偏移
	mov cx,4;内层循环次数
	s2:
	mov al,[bx+si+3]
	and al,11011111b
	mov [bx+si+3],al
	inc si
	loop s2;内层循环偏移1个字节

	add bx,16;外层循环偏移16个字节
	pop cx
	loop s1

	mov ax,4c00h
	int 21h
	
codesg ends

end start