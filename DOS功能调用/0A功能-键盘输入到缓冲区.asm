DATAS SEGMENT
    BUF DB 6 DUP('$')			;����6���ֽڵĿռ�(�����ַ���������'$')
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
INPUT:
    LEA DX,BUF ;����DX,ʹ�ַ����׵�ַ=DS:DX
    MOV BX,DX
    MOV BYTE PTR[BX],5	;���û������ֽ���Ϊ5
    MOV AH,0AH
    INT 21H
    MOV DI,DX	;��ȡ�������׵�ַ������DI��
    MOV BH, [DI]   ;��ȡ���뻺����������ַ���  
    MOV BL, [DI+1] ;��ȡ���뻺������ʵ��������ַ���
    MOV AH,9
    INT 21H
EXIT:
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
;һ���Ĵ����������ֽ�



