 SAVE SCREEN TO scr_dspl
 USE ssobch ALIAS aprv INDEX hsprvix
 tt_prv = RECCOUNT()
 dspch = tt_prv+2
 DIMENSION c( 4)
 i = 1
 r = 3
 c( 1) = 1
 c( 2) = 20
 c( 3) = 41
 c( 4) = 60
 @ 3, 1 CLEAR TO 23, 78
 DO WHILE  .NOT. EOF()
    IF r=3 .AND. i=3
       @ r, c(i)+1 PROMPT prvcode+' = '+TRIM(prvname)
    ELSE
       IF r=4 .AND. i=4
          @ r, c(i)+2 PROMPT prvcode+' = '+TRIM(prvname)
       ELSE
          @ r, c(i) PROMPT prvcode+' = '+TRIM(prvname)
       ENDIF
    ENDIF
    IF i=4
       i = 1
       r = r+1
    ELSE
       i = i+1
    ENDIF
    SKIP
 ENDDO
 @ r, c(i) PROMPT '<<    ��Ѻ����  >>'
 @ r, c(i+1) PROMPT '<< ����������´ >>'
 SAVE SCREEN TO dspscr
 dspchi = dspch-1
 MENU TO dspchi
 DO CASE
    CASE dspchi=dspch
       prvnum = SPACE(2)
       SET COLOR TO W+/GR
       @ 5, 20 CLEAR TO 21, 75
       @ 5, 20, 21, 75 BOX
       @ 6, 22 SAY '��س�������� ʻ�.  : ' GET prvnum PICTURE '99'
       @ 7, 22 SAY '���ǡ����� <ENTER>'
       @ 20, 40 SAY '������ <ESC> ��Ѻ����'
       READ
       GOTO TOP
       SEEK prvnum
       IF FOUND()
          row = 10
          @ 7, 21 SAY '                               '
          IF SUBSTR(prvcode, 1, 1)='0'
             @ 8, 22 SAY '�ӹѡ�ҹ��Сѹ�ѧ��ࢵ��鹷��'+TRIM(prvname)
          ELSE
             @ 8, 22 SAY '�ӹѡ�ҹ��Сѹ�ѧ���ѧ��Ѵ'+TRIM(prvname)
          ENDIF
          IF LEN(TRIM(add1))<>0
             @ row, 22 SAY '�������   :' GET add1
          ENDIF
          IF LEN(TRIM(add2))<>0
             @ ROW()+1, 22 SAY '          :' GET add2
          ENDIF
          IF LEN(TRIM(add3))<>0
             @ ROW()+1, 22 SAY '          :' GET add3
          ENDIF
          IF LEN(TRIM(add4))<>0
             @ ROW()+1, 22 SAY '          :' GET add4
          ENDIF
          IF SUBSTR(prvcode, 1, 1)='0'
             @ ROW()+1, 22 SAY '          :'+' ��ا෾�'
          ELSE
             @ ROW()+1, 22 SAY '          :'+' �ѧ��Ѵ'+TRIM(prvname)
          ENDIF
          IF LEN(TRIM(zip))<>0
             @ ROW()+1, 22 SAY '          : '+zip
          ENDIF
          @ 17, 22 SAY '���Ѿ��  :' GET tel
          @ 18, 22 SAY '          :' GET tel1
          READ
          @ 20, 40 SAY '������ <ENTER> ��Ѻ����'
          WAIT ''
          SET COLOR TO W+/B
       ENDIF
    OTHERWISE
       CLOSE DATABASES
       CLOSE INDEX
 ENDCASE
 RESTORE SCREEN FROM dspscr
 SET COLOR TO W+/B
 RETURN
