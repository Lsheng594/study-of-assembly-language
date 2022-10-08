              ASSUME    cs:CODE,ds:DATA,ss:STACK
        DATA  SEGMENT
              DW        0123H,0456H,0789H,0ABCH,0DEFH,0FEDH,0CBAH,0987H
        DATA  ENDS
       STACK  SEGMENT
              DW        0,0,0,0,0,0,0,0
       STACK  ENDS
        CODE  SEGMENT
      START:  MOV       ax,STACK
              MOV       ss,ax
              MOV       sp,16
              MOV       ax,DATA
              MOV       ds,ax

              PUSH      ds:[0]
              PUSH      ds:[2]
              POP       DS:[2]
              POP       DS:[0]

              MOV       AX,4C00H
              INT       21H
        CODE  ENDS
              END       START
