datas segment
    buf db 252 dup('$')	;����7���ֽڵĿռ�(����Enter�����ַ���������'$')
    br db 0dh,0ah,'$'
    msg1 db 'Please input some text:',0dh,0ah,24h
    msg2 db 'The letters you typed is:$'
datas ends

stacks segment
    ;�˴������ջ�δ���
stacks ends

codes segment
    assume cs:codes,ds:datas,ss:stacks
start:
    mov ax,datas
    mov ds,ax

	lea dx,msg1	   ;��ʾ��ʾ��Ϣ1
    mov ah,9
    int 21h
	
    lea dx,buf ;����dx,ʹ�ַ����׵�ַ=ds:dx
    mov bx,dx
    mov byte ptr[bx],250	;���û���������
    mov ah,0ah
    int 21h
    
    lea dx,br	;��ӡ����
    mov ah,9
    int 21h
    
    lea dx,msg2	   ;��ʾ��ʾ��Ϣ2
    mov ah,9
    int 21h
    
    mov bl,buf+1
    add bl,48		;��10��������ת��ΪASCII��ʾ
	mov dl,bl
    mov ah,2
    int 21h
exit:
	mov ah,4ch
    int 21h
codes ends
    end start
    
;һ���Ĵ����������ֽ�


