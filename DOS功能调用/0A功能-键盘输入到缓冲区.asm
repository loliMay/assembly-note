DATAS SEGMENT
    BUF DB 6 DUP('$')			;����6���ֽڵĿռ�
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
    MOV BX,DX
    MOV BYTE PTR[BX],5	;���û������ֽ���Ϊ0
    MOV AH,0AH
    INT 21H
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
;һ���Ĵ����������ֽ�



