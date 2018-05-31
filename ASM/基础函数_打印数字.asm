DATAS SEGMENT
    num dw 145,45,50,51		;数组
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

;以10进制输出ax中的无符号整数(0-65536)
printax proc
      mov  bx, 10	;将bx赋值为10
      or   ax, ax	;如果ax的值为0,则跳转至_0_
      jz   _0_
loop_p:
      xor  dx, dx	;将dx清空
      div  bx		;除法默认被除数是ax,ax/10并将结果存在ax中
      mov  cx, ax	;将商赋值给cx
      or   cx, dx	;判断商和余数
      jz   _e_		;如果商和余数都为0,则结束递归(递归出口)
      push dx		;保存dx中的余数
      call loop_p	;递归
      pop  dx		;将栈中余数弹出到dx中
      add  dl, '0'  ;进行ASCII转码
      jmp  _1_		;打印余数
_0_:  mov  dl, '0'	;直接打印0
_1_:  mov  ah, 2
      int  21h
_e_:  ret
printax endp

;打印回车换行
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


