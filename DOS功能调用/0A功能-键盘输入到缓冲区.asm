datas segment
    buf db 7 dup('$')	;开辟6个字节的空间(包括Enter键和字符串结束符'$')
datas ends

stacks segment
    ;此处输入堆栈段代码
stacks ends

codes segment
    assume cs:codes,ds:datas,ss:stacks
start:
    mov ax,datas
    mov ds,ax
input:
    lea dx,buf ;设置dx,使字符串首地址=ds:dx
    mov bx,dx
    mov byte ptr[bx],6	;设置缓冲区字节数为5(不包括回车)
    mov ah,0ah
    int 21h
exit:
    mov ah,4ch
    int 21h
codes ends
    end start
    
;一个寄存器有两个字节


