DATAS SEGMENT
    BUF DB 'Hello World!',0DH,0AH,24H ; 0DH,0AH 是回车换行
    ;注意设置的变量名不能是 STR
    BUFF DB 'I am LoliMay.$'
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
    MOV AH,9
    INT 21H
    LEA DX,BUFF ;设置DX,使字符串首地址=DS:DX
    MOV AH,9
    INT 21H
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START


