 SET EXACT OFF
 CLEAR
 CLOSE ALL
 SELECT 2
 USE hospital
 SELECT 1
 USE hospdb INDEX hssoix, hflnmix, hlnmix, hsspvn
 hos = SPACE(7)
 sso = SPACE(10)
 name1 = SPACE(20)
 name2 = SPACE(40)
 ssopvn = SPACE(4)
 SET COLOR TO N+/B
 SET COLOR TO W+/B
 DO WHILE .T.
    DO CASE
       CASE sel=1
          SET COLOR TO N+/B
          SET COLOR TO BG+/B
          SELECT 2
          @ 1, 29 SAY '�ç��Һ��'+TRIM(hosname)
          STORE hoscode TO hos
          SET COLOR TO G+/B
          @ 1, 65 SAY '��/�ѧ��� = `'
          @ 2, 25 SAY '*****************************'
          @ 3, 25 SAY '* �ͺ��������Ţ���ѵû�Сѹ�ѧ�� *'
          @ 4, 25 SAY '*****************************'
          @ 0, 0 TO 24, 80
          SET COLOR TO N+/W
          @ 9, 21, 11, 59 BOX
          @ 10, 22 SAY '�Ţ���ѵû�Сѹ�ѧ�� : ' GET sso PICTURE '@r 99-9999999-9'
          SET COLOR TO BG+/B
          @ 22, 5 SAY '==> ��س�����Ţ���ѵû�Сѹ�ѧ�� ���ǡ����� <ENTER>'
          @ 23, 5 SAY '    ���� ������ <ESC> ��Ѻ�������'
          READ
          IF READKEY()=12
             EXIT
          ENDIF
          SELECT 1
          SET INDEX TO hssoix
          SEEK TRIM(sso)
          IF EOF()
             SET COLOR TO R+/B
             WAIT SPACE(5)+'!! ��辺�Ţ���ѵû�Сѹ�ѧ��㹰ҹ������...<������� �> !!'
             @ 24, 0
             SET COLOR TO N+/B
             SET COLOR TO BG+/B
             @ 0, 0 TO 24, 79
             sel = 1
             LOOP
          ELSE
             STORE RECNO() TO hptr
             DO hosscr
          ENDIF
       CASE sel=2
          SET COLOR TO N+/B
          SET COLOR TO BG+/B
          SELECT 2
          @ 1, 29 SAY '�ç��Һ��'+TRIM(hosname)
          STORE hoscode TO hos
          SET COLOR TO G+/B
          @ 1, 65 SAY '��/�ѧ��� = `'
          @ 2, 20 SAY '***************************************'
          @ 3, 20 SAY '*       �ͺ������� ���� ����Сѹ��   *'
          @ 4, 20 SAY '***************************************'
          @ 0, 0 TO 24, 79
          SET COLOR TO N+/W
          @ 9, 9 CLEAR TO 11, 70
          @ 9, 9, 11, 70 BOX
          @ 10, 10 SAY '���ͼ���Сѹ��  :'
          @ 10, 45 GET name1 PICTURE '@!'
          SET COLOR TO BG+/B
          @ 22, 5 SAY '==> ��س��ʪ��ͼ���Сѹ�� ���ǡ����� <ENTER>'
          @ 23, 5 SAY '    ���� ������ <ESC> ��Ѻ�������'
          READ
          IF READKEY()=12
             EXIT
          ENDIF
          SELECT 1
          SET INDEX TO hflnmix
          SEEK TRIM(name1)+TRIM(name2)
          IF EOF()
             SET COLOR TO R+/B
             WAIT SPACE(5)+'!! ��辺���ͼ���Сѹ�� 㹰ҹ������...<������� �> !!'
             @ 24, 0 CLEAR
             SET COLOR TO N+/B
             SET COLOR TO BG+/B
             @ 0, 0 TO 24, 79
             sel = 2
             LOOP
          ELSE
             STORE RECNO() TO hptr
             DO hosscr
          ENDIF
       CASE sel=3
          SET COLOR TO N+/B
          SET COLOR TO BG+/B
          SELECT 2
          @ 1, 29 SAY '�ç��Һ��'+TRIM(hosname)
          STORE hoscode TO hos
          SET COLOR TO G+/B
          @ 1, 65 SAY '��/�ѧ��� = `'
          @ 2, 25 SAY '*****************************'
          @ 3, 25 SAY '*      �ͺ������¹��ʡ��    *'
          @ 4, 25 SAY '*****************************'
          @ 0, 0 TO 24, 79
          SET COLOR TO N+/W
          @ 9, 14, 11, 66 BOX
          @ 10, 15 SAY '���ʡ�� : ' GET name2 PICTURE '@!'
          SET COLOR TO BG+/B
          @ 22, 5 SAY '==> ��س������ʡ�� ���ǡ����� <ENTER>'
          @ 23, 5 SAY '    ���� ������ <ESC> ��Ѻ�������'
          READ
          IF READKEY()=12
             EXIT
          ENDIF
          SELECT 1
          SET INDEX TO hlnmix
          SEEK TRIM(name2)
          IF EOF()
             SET COLOR TO R+/B
             WAIT SPACE(5)+'!! ��辺���ʡ��㹰ҹ������...<������� �> !!'
             @ 24, 0 CLEAR
             SET COLOR TO N+/B
             SET COLOR TO BG+/B
             @ 0, 0 TO 24, 79
             sel = 3
             LOOP
          ELSE
             STORE RECNO() TO hptr
             DO hosscr
          ENDIF
       CASE sel=4
          SET COLOR TO N+/B
          SET COLOR TO BG+/B
          SELECT 2
          @ 1, 29 SAY '�ç��Һ��'+TRIM(hosname)
          STORE hoscode TO hos
          SET COLOR TO G+/B
          @ 1, 65 SAY '��/�ѧ��� = `'
          @ 2, 25 SAY '*********************************'
          @ 3, 25 SAY '*      �ͺ������ª���-���ʡ��   *'
          @ 4, 25 SAY '*********************************'
          @ 0, 0 TO 24, 79
          SET COLOR TO N+/W
          @ 9, 9 CLEAR TO 12, 70
          @ 9, 9, 12, 70 BOX
          @ 10, 10 SAY '���ͼ���Сѹ��  : '
          @ 10, COL() GET name1
          @ 11, 10 SAY '���ʡ��          : '
          @ 11, COL() GET name2
          SET COLOR TO BG+/B
          @ 22, 5 SAY '==> ��س��ʪ�����й��ʡ�� ���ǡ����� <ENTER>'
          @ 23, 5 SAY '    ���� ������ <ESC> ��Ѻ�������'
          READ
          IF READKEY()=12
             EXIT
          ENDIF
          SELECT 1
          SET INDEX TO hflnmix
          SEEK TRIM(name1)+TRIM(name2)
          IF EOF()
             SET COLOR TO R+/B
             WAIT SPACE(5)+'!! ��辺����-���ʡ��㹰ҹ������...<������� �> !!'
             @ 24, 0 CLEAR
             SET COLOR TO N+/B
             SET COLOR TO BG+/B
             @ 0, 0 TO 24, 79
             sel = 4
             LOOP
          ELSE
             STORE RECNO() TO hptr
             DO hosscr
          ENDIF
       CASE sel=5
          SET COLOR TO N+/B
          SET COLOR TO BG+/B
          SELECT 2
          @ 1, 29 SAY '�ç��Һ��'+TRIM(hosname)
          STORE hoscode TO hos
          SET COLOR TO G+/B
          @ 1, 65 SAY '��/�ѧ��� = `'
          @ 2, 25 SAY '******************************'
          @ 3, 25 SAY '*     �ͺ����������� ʻ�.    *'
          @ 4, 25 SAY '******************************'
          @ 0, 0 TO 24, 79
          SET COLOR TO N+/W
          @ 9, 25, 11, 56 BOX
          @ 10, 26 SAY '  ���� ʻ�.             :' GET ssopvn PICTURE '9999'
          SET COLOR TO BG+/B
          @ 22, 5 SAY '==> ��س�������ʢͧ ʻ�. ���ǡ����� <ENTER>'
          @ 23, 5 SAY '    ���� ������ <ESC> ��Ѻ�������'
          READ
          IF READKEY()=12
             EXIT
          ENDIF
          SELECT 1
          SET INDEX TO hsspvn
          SEEK ssopvn
          IF EOF()
             SET COLOR TO R+/B
             WAIT SPACE(5)+'!! ��辺���� ʻ�.���㹰ҹ������...<������� �> !!'
             @ 24, 0
             SET COLOR TO N+/B
             SET COLOR TO BG+/B
             @ 0, 0 TO 24, 79
             sel = 5
             LOOP
          ELSE
             STORE RECNO() TO hptr
             DO hosscr
             SET COLOR TO BG+/B
          ENDIF
    ENDCASE
 ENDDO
 CLEAR
 CLOSE ALL
 RETURN
