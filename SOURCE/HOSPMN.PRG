 CLEAR
 SET TALK OFF
 SET SAFETY OFF
 SET COLOR TO N+/B
 SET COLOR TO W+/B
 hospmnch = 1
 DO WHILE .T.
    CLEAR
    SET COLOR TO N+/B
    SET COLOR TO RB+/B
    SET COLOR TO BG+/B
    @ 1, 19 SAY '        *** �ӹѡ�ҹ��Сѹ�ѧ�� ***  '
    @ 2, 19 SAY '   [ �������ª��ͼ���Сѹ�������ʶҹ��Һ�� ]'
    SET COLOR TO RB+/B
    @ 4, 30 SAY '�ç��Һ��'+TRIM(hos_name)
    SET COLOR TO GR+/B
    SET COLOR TO W+/B
    @ 0, 0 TO 24, 79
    SET COLOR TO B+/W
    @ 7, 15, 15, 65 BOX
    SET COLOR TO N+/W, W+/R
    msgmnp1 = ' �������ª��ͼ���Сѹ�������ʶҹ��Һ�� ������� ʻ�.'
    msgmnp2 = ' �������ª��ͼ���Сѹ�������ʶҹ��Һ�ŷ����� ���§������� ʻ�.'
    msgmnp3 = ' �������ª��ͼ���Сѹ�������ʶҹ��Һ�ŷ����� ���§����Ţ��Сѹ�ѧ��'
    msgmnp4 = ' �������ª��ͼ���Сѹ�������ʶҹ��Һ�ŷ����� ���§�������-ʡ�� ����Сѹ��'
    msgmnp5 = ' ��ԡ��÷ӧҹ �������ª��ͼ���Сѹ�������ʶҹ��Һ�� ��Ѻ������ѡ'
    @ 9, 22 PROMPT '  1)  �к����� ʻ�.                  ' MESSAGE msgmnp1
    @ 10, 22 PROMPT '  2)  ���§������� ʻ�.              ' MESSAGE msgmnp2
    @ 11, 22 PROMPT '  3)  ���§����Ţ��Сѹ�ѧ��         ' MESSAGE msgmnp3
    @ 12, 22 PROMPT '  4)  ���§�������-ʡ�� ����Сѹ��  ' MESSAGE msgmnp4
    @ 13, 22 PROMPT '  0)  ��ԡ�ҹ                        ' MESSAGE msgmnp5
    @ 20, 19 SAY '==> ���͡��¡������ '+CHR(24)+' ���� '+CHR(25)+' ���ǡ� ENTER'
    MENU TO hospmnch
    SAVE SCREEN TO shospmn
    SET COLOR TO W+/B
    DO CASE
       CASE hospmnch=1
          DO hpssoprv
       CASE hospmnch=2
          DO hpssobch
       CASE hospmnch=3
          DO hpssoid
       CASE hospmnch=4
          DO hpssonm
       CASE hospmnch=5
          EXIT
    ENDCASE
 ENDDO
 CLOSE DATABASES
 CLOSE INDEX
 RETURN
