assume cs:codesg
codesg segment

        mov ax,2000H
        mov ss,ax
        mov sp,0
        add sp,10
        pop ax
        pop bx
        push ax
        push bx
        pop ax
        pop bx

        mov ax,4c00H
        int 21H

codesg ends

end

0：BE
01：00
02：BE
03：00
04：BE
05：BE
06：BE
07:
