 SET TALK OFF
 SET ESCAPE OFF
 SET SCOREBOARD OFF
 SET STATUS OFF
 SET SAFETY OFF
 SET MESSAGE TO 24
 SET COLOR TO N+/B
 SET COLOR TO W+/B
 CLEAR
 PUBLIC sel, hptr, sso, hos, name1, name2
 USE hospital
 hos_name = TRIM(hosname)
 USE
 DO chkidxdt
 sel = 1
 DO WHILE .T.
    CLEAR
    SET COLOR TO N+/B
    SET COLOR TO RB+/B
    SET COLOR TO BG+/B
    @ 1, 19 SAY '        *** �ӹѡ�ҹ��Сѹ�ѧ�� ***  '
    @ 2, 19 SAY ' [ �����ͺ�������Сѹ��������ԡ�âͧʶҹ��Һ�� ]'
    SET COLOR TO RB+/B
    @ 4, 32 SAY '�ç��Һ��'+TRIM(hos_name)
    SET COLOR TO GR+/B
    @ 5, 17 SAY '            ****    ������ѡ  ****'
    SET COLOR TO W+/B
    @ 0, 0 TO 24, 79
    SET COLOR TO B+/W
    @ 7, 9, 19, 70 BOX
    SET COLOR TO N+/W, W+/R
    msgsys1 = '  �ͺ���������ԡ��ʶҹ��Һ�Ţͧ����Сѹ�� �����Ţ���ѵû�Сѹ�ѧ��'
    msgsys2 = '  �ͺ���������ԡ��ʶҹ��Һ�Ţͧ����Сѹ�� ���ª��ͼ���Сѹ��'
    msgsys3 = '  �ͺ���������ԡ��ʶҹ��Һ�Ţͧ����Сѹ�� ���¹��ʡ�ż���Сѹ��'
    msgsys4 = '  �ͺ���������ԡ��ʶҹ��Һ�Ţͧ����Сѹ�� ���ª���-���ʡ�ż���Сѹ��'
    msgsys5 = '  �ͺ���������ԡ��ʶҹ��Һ�Ţͧ����Сѹ�� ������� ʻ�. ����Ѻ�Դ�ͺ'
    msgsys6 = '  �ͺ����ӹǹ����Сѹ��������ԡ�âͧʶҹ��Һ�� ������� ʻ�. ����Ѻ�Դ�ͺ'
    msgsys7 = '  �к����� ʻ�./���§���(���� ʻ�./�Ţ��Сѹ�ѧ��/����-ʡ�� ����Сѹ��)'
    msgsys8 = '  ź������/�Ӣ�����ŧ/�Ѵ���§������/���� ʻ�.�ѧ��Ѵ'
    msgsys9 = '  ��ԡ��÷ӧҹ �ͺ��������ż���Сѹ��������ԡ�âͧʶҹ��Һ��'
    @ 9, 12 PROMPT '  1)  �ͺ��������Ţ���ѵû�Сѹ�ѧ��                  ' MESSAGE msgsys1
    @ 10, 12 PROMPT '  2)  �ͺ������� ���� ����Сѹ��                      ' MESSAGE msgsys2
    @ 11, 12 PROMPT '  3)  �ͺ������� ���ʡ�� ����Сѹ��                   ' MESSAGE msgsys3
    @ 12, 12 PROMPT '  4)  �ͺ������� ����-���ʡ�� ����Сѹ��              ' MESSAGE msgsys4
    @ 13, 12 PROMPT '  5)  �ͺ���������� ʻ�. ����Ѻ�Դ�ͺ                  ' MESSAGE msgsys5
    @ 14, 12 PROMPT '  6)  �ͺ����ʹ����Сѹ��������� ʻ�. ����Ѻ�Դ�ͺ    ' MESSAGE msgsys6
    @ 15, 12 PROMPT '  7)  �������ª��ͼ���Сѹ�������ʶҹ��Һ��          ' MESSAGE msgsys7
    @ 16, 12 PROMPT '  8)  �Ѵ��â�����                                     ' MESSAGE msgsys8
    @ 17, 12 PROMPT '  0)  ��ԡ�ҹ                                          ' MESSAGE msgsys9
    @ 20, 19 SAY '==> ���͡��¡������ '+CHR(24)+' ���� '+CHR(25)+' ���ǡ� ENTER'
    SET COLOR TO N+/W, W+/R
    MENU TO sel
    SAVE SCREEN TO hscr
    SET COLOR TO W+/B
    DO CASE
       CASE sel=1
          DO hosdisp
       CASE sel=2
          DO hosdisp
       CASE sel=3
          DO hosdisp
       CASE sel=4
          DO hosdisp
       CASE sel=5
          DO hosdisp
       CASE sel=6
          DO hosdisp2
       CASE sel=7
          DO hospmn
       CASE sel=8
          DO hosmn
       CASE sel=9
          EXIT
    ENDCASE
 ENDDO
 SET COLOR TO N/W
 @ 1, 5 CLEAR TO 22, 78
 @ 1, 5, 22, 78 BOX
 SET COLOR TO N/G
 @ 2, 10 CLEAR TO 4, 77
 @ 2, 10, 4, 77 BOX
 @ 3, 11 SAY '��ԡ��÷ӧҹ �к��ͺ�����ª��ͼ���Сѹ�������ʶҹ��Һ�� '
 SET COLOR TO N/GR
 @ 6, 10 CLEAR TO 8, 77
 @ 6, 10, 8, 77 BOX
 @ 7, 11 SAY '�к��ͺ�����ª��ͼ���Сѹ�������ʶҹ��Һ�� �ӹѡ�ҹ��Сѹ�ѧ��'
 SET COLOR TO N/W
 @ 16, 17 SAY 'VERSION 2.00'
 @ 17, 17 SAY '25 MARCH 1995'
 @ 22, 8 SAY 'peace'
 @ 22, 68 SAY 'computer'
 SET COLOR TO W/B
 @ 10, 10 CLEAR TO 12, 50
 @ 10, 10, 12, 50 BOX
 @ 11, 11 SAY '�Ѳ���к��� :'
 SET COLOR TO W+/R
 @ 8, 35 CLEAR TO 20, 75
 @ 8, 35, 20, 75 BOX
 @ 9, 37 SAY '�ͧ����¹��л����ż�'
 @ 10, 40 SAY '�� : 5857043'
 @ 11, 40 SAY '    : 9110895-6'
 @ 12, 40 SAY ' (02) 5859600-3 ���  4801-6'
 @ 13, 40 SAY '      5859605-7'
 @ 14, 37 SAY '�ͧ����ҹ���ᾷ����п�鹿����ö�Ҿ'
 @ 15, 40 SAY '�� : 5857017'
 @ 16, 40 SAY '      5857041'
 @ 17, 40 SAY ' (02) 5859600-3 ���  4708'
 @ 18, 40 SAY '      5859605-7      4808-9'
 @ 19, 40 SAY '                     4910'
 WAIT ''
 SET COLOR TO
 CLOSE ALL
 CLEAR
 SET SCOREBOARD ON
 SET STATUS ON
 SET ESCAPE ON
 QUIT
 SET TALK ON
 RETURN
