 CLEAR
 SET TALK OFF
 SET SAFETY OFF
 SET COLOR TO N+/B
 SET COLOR TO W+/B
 hosmnch = 1
 DO WHILE .T.
    CLEAR
    SET COLOR TO N+/B
    SET COLOR TO RB+/B
    SET COLOR TO BG+/B
    @ 1, 19 SAY '        *** �ӹѡ�ҹ��Сѹ�ѧ�� ***  '
    @ 2, 19 SAY '        [[[    �Ѵ��â�����  ]]]    '
    SET COLOR TO RB+/B
    @ 4, 30 SAY '�ç��Һ��'+TRIM(hos_name)
    SET COLOR TO GR+/B
    SET COLOR TO W+/B
    @ 0, 0 TO 24, 79
    SET COLOR TO B+/W
    @ 7, 20, 15, 70 BOX
    SET COLOR TO N+/W, W+/R
    msgmn1 = ' ź�����ż���Сѹ���͡�ҡ�ҹ������ �����Ѻ��������͹����( �� 1 ����/��͹)'
    msgmn2 = ' �Ӣ����ż���Сѹ�������ʶҹ��Һ�� �ҡ Diskette �ͧ ʻ�. ŧ����ͧ�'
    msgmn3 = ' �Ӣ����ż���Сѹ�������ʶҹ��Һ�� �ҡ Diskette �ͧ ON-LINE ŧ����ͧ�'
    msgmn4 = ' �Ѵ���§�����ż���Сѹ�������ʶҹ��Һ�� ���Ң������ջѭ��㹡���ͺ���'
    msgmn5 = ' �ʴ����� �ӹѡ�ҹ��Сѹ�ѧ���ѧ��Ѵ �͡�ҧ���Ҿ'
    msgmn6 = ' ��ԡ��÷ӧҹ �Ѵ��â����� ��Ѻ������ѡ'
    @ 9, 25 PROMPT '  1)  ź������                      ' MESSAGE msgmn1
    @ 10, 25 PROMPT '  2)  �Ӣ�����ŧ�ҡ�к� OFF-LINE    ' MESSAGE msgmn2
    @ 11, 25 PROMPT '  3)  �Ӣ�����ŧ�ҡ�к� ON-LINE     ' MESSAGE msgmn3
    @ 12, 25 PROMPT '  4)  �Ѵ���§������                ' MESSAGE msgmn4
    @ 13, 25 PROMPT '  5)  ���� ʻ�. �ѧ��Ѵ             ' MESSAGE msgmn5
    @ 14, 25 PROMPT '  0)  ��ԡ�ҹ                       ' MESSAGE msgmn6
    @ 20, 19 SAY '==> ���͡��¡������ '+CHR(24)+' ���� '+CHR(25)+' ���ǡ� ENTER'
    MENU TO hosmnch
    SAVE SCREEN TO shosmn
    SET COLOR TO W+/B
    DO CASE
       CASE hosmnch=1
          SET COLOR TO W+/B
          @ 5, 10, 20, 70 BOX
          SET COLOR TO W+/R
          @ 6, 14 CLEAR TO 19, 72
          @ 6, 14, 19, 72 BOX
          SAVE SCREEN TO hmnscr
          choi = ' '
          @ 9, 20 SAY '�׹�ѹ���ź������ [Y/N]  :' GET choi PICTURE 'Y'
          READ
          IF choi='Y'
             @ 11, 25 SAY '�ô���ѡ���� ���ѧź������ ENTER'
             @ 12, 25 SAY '==========================='
             CLOSE DATABASES
             CLOSE INDEX
             USE hospdb
             ZAP
             USE HOSTEMP
             ZAP
             RUN del *.IDX >NUL
             DO reinidx
             SET COLOR TO W+/R
             @ 11, 18 SAY '!! ���º�������� �� ENTER ��Ѻ���٨Ѵ��â����� '
             @ 12, 18 SAY '                                       '
             SET COLOR TO W+/B
          ENDIF
          SET COLOR TO W+/B
       CASE hosmnch=2
          SET COLOR TO W+/B
          @ 5, 10, 20, 70 BOX
          SET COLOR TO W+/R, N/W
          @ 6, 14 CLEAR TO 19, 66
          @ 6, 14, 19, 66 BOX
          SAVE SCREEN TO hmnscr
          choi = ' '
          sldrv = 1
          drv = ' '
          @ 9, 20 SAY '�׹�ѹ��ùӢ�����ŧ����ͧ� [Y/N]  :' GET choi PICTURE 'Y'
          READ
          IF choi$'Yy'
             @ 11, 20 SAY '�ҡ DRIVE :'
             @ 11, 35 PROMPT 'A:'
             @ 11, 39 SAY '���� '
             @ 11, 45 PROMPT 'B:'
             MENU TO sldrv
             DO CASE
                CASE sldrv=1
                   drv = 'A:'
                CASE sldrv=2
                   drv = 'B:'
             ENDCASE
             @ 11, 20 SAY '�ô����蹢�������ª��ͼ���Сѹ�� '
             @ 12, 20 SAY '� DRIVE '+drv+' ��������ǡ����� ENTER '
             WAIT ''
             @ 11, 20 SAY '�ô���ѡ���� ���ѧ�Ӣ�����ŧ����ͧ�   '
             @ 12, 20 SAY '=============================           '
             CLOSE DATABASES
             CLOSE INDEX
             IF FILE('hospdb.zip')
                RUN pkunzip hospdb.zip c:\hosdat -o >nul
             ENDIF
             IF file('&drv\backup.001')
                !restore &drv c: /s >nul
             ENDIF
             IF file('&drv\hospdb.zip')
                !pkunzip &drv\hospdb.zip c:\hosdat -o -d >nul
             ENDIF
             IF file('&drv\hospdb.txt')
                !copy &drv\hospdb.txt c:\hosdat /y >nul
             ENDIF
             IF FILE('hospdb.txt')
                USE hospdb
                APPEND FROM hospdb.txt TYPE SDF
                CLOSE DATABASES
                RUN del *.idx >nul
                RUN del hospdb.txt >nul
                IF FILE('hospdb.zip')
                   RUN del hospdb.zip >nul
                ENDIF
                DO reinidx
                @ 5, 10, 20, 70 BOX
                SET COLOR TO W+/R, N/W
                @ 6, 14 CLEAR TO 19, 66
                @ 6, 14, 19, 66 BOX
                SET COLOR TO W+/R
                @ 11, 18 SAY '!! ���º�������� ���� DISKETTE �͡�ҡ DRIVE '+drv
                @ 12, 18 SAY '          �� ENTER ��Ѻ���٨Ѵ��â�����   '
                SET COLOR TO W+/B
                WAIT ' '
             ELSE
             ENDIF
          ENDIF
          SET COLOR TO W+/B
       CASE hosmnch=3
          DO hoson
       CASE hosmnch=4
          DO reinidx
       CASE hosmnch=5
          DO hssodspl
       CASE hosmnch=6
          EXIT
    ENDCASE
 ENDDO
 CLOSE DATABASES
 CLOSE INDEX
 RETURN
