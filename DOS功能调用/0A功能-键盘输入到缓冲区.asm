datas segment
    buf db 252 dup('$')	;开辟7个字节的空间(包括Enter键和字符串结束符'$')
    br db 0dh,0ah,'$'
    msg1 db 'Please input some text:',0dh,0ah,24h
    msg2 db 'The letters you typed is:$'
datas ends

stacks segment
    ;此处输入堆栈段代码
stacks ends

codes segment
    assume cs:codes,ds:datas,ss:stacks
start:
    mov ax,datas
    mov ds,ax

	lea dx,msg1	   ;显示提示信息1
    mov ah,9
    int 21h
	
    lea dx,buf ;设置dx,使字符串首地址=ds:dx
    mov bx,dx
    mov byte ptr[bx],250	;设置缓冲区长度
    mov ah,0ah
    int 21h
    
    lea dx,br	;打印换行
    mov ah,9
    int 21h
    
    lea dx,msg2	   ;显示提示信息2
    mov ah,9
    int 21h
    
    mov bl,buf+1
    add bl,48		;将10进制数字转换为ASCII显示
	mov dl,bl
    mov ah,2
    int 21h
exit:
	mov ah,4ch
    int 21h
codes ends
    end start
    
;一个寄存器有两个字节


