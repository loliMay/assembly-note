DATAS SEGMENT
    BUF DB 'Hello World!',0DH,0AH,24H ; 0DH,0AH �ǻس�����
    ;ע�����õı����������� STR
    BUFF DB 'I am LoliMay.$'
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
    MOV AH,9
    INT 21H
    LEA DX,BUFF ;����DX,ʹ�ַ����׵�ַ=DS:DX
    MOV AH,9
    INT 21H
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START


