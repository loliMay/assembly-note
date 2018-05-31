DATAS SEGMENT
    BUF DB 6 DUP('$')			;开辟6个字节的空间
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    LEA DX,BUF ;设置DX,使字符串首地址=DS:DX
    MOV BX,DX
    MOV BYTE PTR[BX],5	;设置缓冲区字节数为0
    MOV AH,0AH
    INT 21H
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
;一个寄存器有两个字节



