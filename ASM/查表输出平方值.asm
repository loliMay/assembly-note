; 通过人机对话，从键盘输入一个10进制数字(0-9)，查表求键入数字的平方值，存入al寄存器中，
; 并显示有关的提示信息。

datas segment
	br db 0dh,0ah,24h	;回车换行
	msg1 db 'Please input the number you want to query: $'
	msg2 db 'The result is: $'
    table dw 0,1,4,9,16,25,36,49,64,81
datas ends

stacks segment
    ;此处输入堆栈段代码
stacks ends

codes segment
    assume cs:codes,ds:datas,ss:stacks
start:
    mov ax,datas
    mov ds,ax
    
    lea dx,msg1	;9号功能,显示提示信息1
    mov ah,9
    int 21h
    
    mov ah,1	;1号功能,键入一个字符并回显,AL=输入字符
    int 21h
    xor ah,ah
    sub ax,'0'	;将ASCII码转换成十进制储存在内存中
    push ax
    
    lea dx,br	;9号功能,打印回车换行
    mov ah,9
    int 21h
    
    lea dx,msg2	;9号功能,打印提示信息2
    mov ah,9
    int 21h
    
    lea bx,table	;查表
    pop ax
    mov cl,2
    mul cl
    mov di,ax
    mov ax,di
    mov ax,[bx+di]
    call printax
    
    mov ah,4ch	;退出程序,返回DOS
    int 21h


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

;获取用户输入，并以10进制无符号整数存入AX寄存器中
scanf proc
	mov ah,1	;1号功能,键入一个字符并回显,AL=输入字符
    int 21h
    xor ah,ah
    sub ax,'0'	;将ASCII码转换成十进制储存在内存中
	ret
scanf endp

codes ends
    end start



