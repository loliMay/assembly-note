DATAS SEGMENT
    BUF DB 10 DUP($)			;����10���ֽڵĿռ�
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    LEA DX,BUF ;����DX,ʹ�ַ����׵�ַ=DS:DX
    MOV AH,0A
    INT 21H
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
;һ���Ĵ����������ֽ�
