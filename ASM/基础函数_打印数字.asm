DATAS SEGMENT
    num dw 145,45,50,51		;����
DATAS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS
START:
    MOV AX,DATAS
    MOV DS,AX
    lea bx,num		  
    mov ax,[bx+2]
    call printax
    
    MOV ah,4CH
    INT 21H

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

CODES ENDS
    END START


