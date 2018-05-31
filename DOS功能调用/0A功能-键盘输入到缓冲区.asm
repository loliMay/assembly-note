DATAS SEGMENT
    BUF DB 6 DUP('$')			;开辟6个字节的空间(包括字符串结束符'$')
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
INPUT:
    LEA DX,BUF ;设置DX,使字符串首地址=DS:DX
    MOV BX,DX
    MOV BYTE PTR[BX],5	;设置缓冲区字节数为5
    MOV AH,0AH
    INT 21H
    MOV DI,DX	;获取缓冲区首地址，放在DI中
    MOV BH, [DI]   ;获取输入缓冲区的最大字符数  
    MOV BL, [DI+1] ;获取输入缓冲区中实际输入的字符数
    MOV AH,9
    INT 21H
EXIT:
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
;一个寄存器有两个字节



