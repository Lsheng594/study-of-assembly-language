assume  cs:codesg

codesg segment

       MOV AX,0123H
       MOV BX,0456h
       add ax,bx
       add ax,ax

       mov ax,4c00h
       int 21h

codesg ends

end
