datas segment
    buf db 7 dup('$')	;����6���ֽڵĿռ�(����Enter�����ַ���������'$')
datas ends

stacks segment
    ;�˴������ջ�δ���
stacks ends

codes segment
    assume cs:codes,ds:datas,ss:stacks
start:
    mov ax,datas
    mov ds,ax
input:
    lea dx,buf ;����dx,ʹ�ַ����׵�ַ=ds:dx
    mov bx,dx
    mov byte ptr[bx],6	;���û������ֽ���Ϊ5(�������س�)
    mov ah,0ah
    int 21h
exit:
    mov ah,4ch
    int 21h
codes ends
    end start
    
;һ���Ĵ����������ֽ�


