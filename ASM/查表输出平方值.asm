; ͨ���˻��Ի����Ӽ�������һ��10��������(0-9)�������������ֵ�ƽ��ֵ������al�Ĵ����У�
; ����ʾ�йص���ʾ��Ϣ��

datas segment
	br db 0dh,0ah,24h	;�س�����
	msg1 db 'Please input the number you want to query: $'
	msg2 db 'The result is: $'
    table dw 0,1,4,9,16,25,36,49,64,81
datas ends

stacks segment
    ;�˴������ջ�δ���
stacks ends

codes segment
    assume cs:codes,ds:datas,ss:stacks
start:
    mov ax,datas
    mov ds,ax
    
    lea dx,msg1	;9�Ź���,��ʾ��ʾ��Ϣ1
    mov ah,9
    int 21h
    
    mov ah,1	;1�Ź���,����һ���ַ�������,AL=�����ַ�
    int 21h
    xor ah,ah
    sub ax,'0'	;��ASCII��ת����ʮ���ƴ������ڴ���
    push ax
    
    lea dx,br	;9�Ź���,��ӡ�س�����
    mov ah,9
    int 21h
    
    lea dx,msg2	;9�Ź���,��ӡ��ʾ��Ϣ2
    mov ah,9
    int 21h
    
    lea bx,table	;���
    pop ax
    mov cl,2
    mul cl
    mov di,ax
    mov ax,di
    mov ax,[bx+di]
    call printax
    
    mov ah,4ch	;�˳�����,����DOS
    int 21h


;��10�������ax�е��޷�������(0-65536)
printax proc
      mov  bx, 10	;��bx��ֵΪ10
      or   ax, ax	;���ax��ֵΪ0,����ת��_0_
      jz   _0_
loop_p:
      xor  dx, dx	;��dx���
      div  bx		;����Ĭ�ϱ�������ax,ax/10�����������ax��
      mov  cx, ax	;���̸�ֵ��cx
      or   cx, dx	;�ж��̺�����
      jz   _e_		;����̺�������Ϊ0,������ݹ�(�ݹ����)
      push dx		;����dx�е�����
      call loop_p	;�ݹ�
      pop  dx		;��ջ������������dx��
      add  dl, '0'  ;����ASCIIת��
      jmp  _1_		;��ӡ����
_0_:  mov  dl, '0'	;ֱ�Ӵ�ӡ0
_1_:  mov  ah, 2
      int  21h
_e_:  ret
printax endp

;��ӡ�س�����
printbr proc
	mov dl,0dh
	mov ah,2
	int 21h
	mov dl,0ah
	mov ah,2
	int 21h
	ret
printbr endp

;��ȡ�û����룬����10�����޷�����������AX�Ĵ�����
scanf proc
	mov ah,1	;1�Ź���,����һ���ַ�������,AL=�����ַ�
    int 21h
    xor ah,ah
    sub ax,'0'	;��ASCII��ת����ʮ���ƴ������ڴ���
	ret
scanf endp

codes ends
    end start



