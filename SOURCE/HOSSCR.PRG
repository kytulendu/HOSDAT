 SET STATUS OFF
 SET TALK OFF
 GOTO hptr
 STORE RECNO() TO lrec
 ch = .T.
 key = 0
 ln = 22
 SET COLOR TO N+/B
 @ 0, 0 CLEAR TO 24, 79
 DO WHILE ch
    SELECT 1
    SET COLOR TO N+/B
    r = 2
    IF RECNO()>RECCOUNT()
       GOTO lrec
    ENDIF
    STORE RECNO() TO hosptr
    DO CASE
       CASE sel=1
          DO WHILE r<ln .AND. (TRIM(ssoid)=TRIM(sso)) .AND.  .NOT. EOF()
             p = TRIM(pname)+TRIM(fname)+' '+TRIM(lname)
             SET COLOR TO N+/B
             SET COLOR TO G+/B
             @ 1, 1 SAY '�Ţ�ѵû�Сѹ�'
             @ 1, 20 SAY '����-ʡ��'
             @ 1, 39 SAY '�Ţ�ѵû�ЪҪ�'
             @ 1, 54 SAY 'ʻ�'
             @ 1, 58 SAY '�ѹ�������'
             @ 1, 70 SAY '�ѹ����ش'
             IF r=2
                SET COLOR TO N+/B
                SET COLOR TO W+/RB
                empty = SPACE(95)
                @ r, 15 SAY empty
                @ r, 1 SAY ssoid PICTURE '@r 99-9999999-9'
                @ r, 15 SAY SUBSTR(p, 1, 50)
                @ r, 42 SAY nid
                @ r, 58 SAY hospvn+pvnbran
                @ r, 63 SAY SUBSTR(servdte, 7, 2)+'/'+SUBSTR(servdte, 5, 2)+'/'+SUBSTR(servdte, 3, 2)
                @ r, 72 SAY SUBSTR(servdte1, 7, 2)+'/'+SUBSTR(servdte1, 5, 2)+'/'+SUBSTR(servdte1, 3, 2)
                SET COLOR TO N+/B
             ELSE
                SET COLOR TO GR+/B
                @ r, 1 SAY ssoid PICTURE '@r 99-9999999-9'
                @ r, 15 SAY SUBSTR(p, 1, 50)
                @ r, 42 SAY nid
                @ r, 58 SAY hospvn+pvnbran
                @ r, 63 SAY SUBSTR(servdte, 7, 2)+'/'+SUBSTR(servdte, 5, 2)+'/'+SUBSTR(servdte, 3, 2)
                @ r, 72 SAY SUBSTR(servdte1, 7, 2)+'/'+SUBSTR(servdte1, 5, 2)+'/'+SUBSTR(servdte1, 3, 2)
             ENDIF
             IF  .NOT. EOF()
                r = r+1
                SKIP
             ELSE
                EXIT
             ENDIF
             @ r, 0 CLEAR TO 22, 79
          ENDDO
       CASE sel=4 .OR. sel=2
          DO WHILE r<ln .AND. (TRIM(fname)+TRIM(lname))=(TRIM(name1)+TRIM(name2)) .AND.  .NOT. EOF()
             p = TRIM(pname)+TRIM(fname)+' '+TRIM(lname)
             SET COLOR TO N+/B
             SET COLOR TO G+/B
             @ 1, 1 SAY '�Ţ�ѵû�Сѹ�'
             @ 1, 20 SAY '����-ʡ��'
             @ 1, 39 SAY '�Ţ�ѵû�ЪҪ�'
             @ 1, 54 SAY 'ʻ�'
             @ 1, 58 SAY '�ѹ�������'
             @ 1, 70 SAY '�ѹ����ش'
             IF r=2
                SET COLOR TO N+/B
                SET COLOR TO W+/RB
                empty = SPACE(80)
                @ r, 15 SAY empty
                @ r, 1 SAY ssoid PICTURE '@r 99-9999999-9'
                @ r, 15 SAY SUBSTR(p, 1, 20)
                @ r, 42 SAY nid
                @ r, 58 SAY hospvn+pvnbran
                @ r, 63 SAY SUBSTR(servdte, 7, 2)+'/'+SUBSTR(servdte, 5, 2)+'/'+SUBSTR(servdte, 3, 2)
                @ r, 72 SAY SUBSTR(servdte1, 7, 2)+'/'+SUBSTR(servdte1, 5, 2)+'/'+SUBSTR(servdte1, 3, 2)
                SET COLOR TO N+/B
             ELSE
                SET COLOR TO GR+/B
                @ r, 1 SAY ssoid PICTURE '@r 99-9999999-9'
                @ r, 15 SAY SUBSTR(p, 1, 20)
                @ r, 42 SAY nid
                @ r, 58 SAY hospvn+pvnbran
                @ r, 63 SAY SUBSTR(servdte, 7, 2)+'/'+SUBSTR(servdte, 5, 2)+'/'+SUBSTR(servdte, 3, 2)
                @ r, 72 SAY SUBSTR(servdte1, 7, 2)+'/'+SUBSTR(servdte1, 5, 2)+'/'+SUBSTR(servdte1, 3, 2)
             ENDIF
             IF  .NOT. EOF()
                r = r+1
                SKIP
             ELSE
                EXIT
             ENDIF
             @ r, 0 CLEAR TO 22, 79
          ENDDO
       CASE sel=3
          DO WHILE r<ln .AND. (TRIM(lname)=TRIM(name2)) .AND.  .NOT. EOF()
             p = TRIM(pname)+TRIM(fname)+' '+TRIM(lname)
             SET COLOR TO N+/B
             SET COLOR TO G+/B
             @ 1, 1 SAY '�Ţ�ѵû�Сѹ�'
             @ 1, 20 SAY '����-ʡ��'
             @ 1, 39 SAY '�Ţ�ѵû�ЪҪ�'
             @ 1, 54 SAY 'ʻ�'
             @ 1, 58 SAY '�ѹ�������'
             @ 1, 70 SAY '�ѹ����ش'
             IF r=2
                SET COLOR TO N+/B
                SET COLOR TO W+/RB
                empty = SPACE(80)
                @ r, 15 SAY empty
                @ r, 1 SAY ssoid PICTURE '@r 99-9999999-9'
                @ r, 15 SAY SUBSTR(p, 1, 20)
                @ r, 42 SAY nid
                @ r, 58 SAY hospvn+pvnbran
                @ r, 63 SAY SUBSTR(servdte, 7, 2)+'/'+SUBSTR(servdte, 5, 2)+'/'+SUBSTR(servdte, 3, 2)
                @ r, 72 SAY SUBSTR(servdte1, 7, 2)+'/'+SUBSTR(servdte1, 5, 2)+'/'+SUBSTR(servdte1, 3, 2)
                SET COLOR TO N+/B
             ELSE
                SET COLOR TO GR+/B
                @ r, 1 SAY ssoid PICTURE '@r 99-9999999-9'
                @ r, 15 SAY SUBSTR(p, 1, 20)
                @ r, 42 SAY nid
                @ r, 58 SAY hospvn+pvnbran
                @ r, 63 SAY SUBSTR(servdte, 7, 2)+'/'+SUBSTR(servdte, 5, 2)+'/'+SUBSTR(servdte, 3, 2)
                @ r, 72 SAY SUBSTR(servdte1, 7, 2)+'/'+SUBSTR(servdte1, 5, 2)+'/'+SUBSTR(servdte1, 3, 2)
             ENDIF
             IF  .NOT. EOF()
                r = r+1
                SKIP
             ELSE
                EXIT
             ENDIF
             @ r, 0 CLEAR TO 22, 79
          ENDDO
       CASE sel=5
          DO WHILE r<ln .AND. (hospvn+pvnbran=ssopvn) .AND.  .NOT. EOF()
             p = TRIM(pname)+TRIM(fname)+' '+TRIM(lname)
             SET COLOR TO N+/B
             SET COLOR TO G+/B
             @ 1, 1 SAY '�Ţ�ѵû�Сѹ�'
             @ 1, 20 SAY '����-ʡ��'
             @ 1, 39 SAY '�Ţ�ѵû�ЪҪ�'
             @ 1, 54 SAY 'ʻ�'
             @ 1, 58 SAY '�ѹ�������'
             @ 1, 70 SAY '�ѹ����ش'
             IF r=2
                SET COLOR TO N+/B
                SET COLOR TO W+/RB
                empty = SPACE(80)
                @ r, 15 SAY empty
                @ r, 1 SAY ssoid PICTURE '@r 99-9999999-9'
                @ r, 15 SAY SUBSTR(p, 1, 20)
                @ r, 42 SAY nid
                @ r, 58 SAY hospvn+pvnbran
                @ r, 63 SAY SUBSTR(servdte, 7, 2)+'/'+SUBSTR(servdte, 5, 2)+'/'+SUBSTR(servdte, 3, 2)
                @ r, 72 SAY SUBSTR(servdte1, 7, 2)+'/'+SUBSTR(servdte1, 5, 2)+'/'+SUBSTR(servdte1, 3, 2)
                SET COLOR TO N+/B
             ELSE
                SET COLOR TO GR+/B
                @ r, 1 SAY ssoid PICTURE '@r 99-9999999-9'
                @ r, 15 SAY SUBSTR(p, 1, 20)
                @ r, 42 SAY nid
                @ r, 58 SAY hospvn+pvnbran
                @ r, 63 SAY SUBSTR(servdte, 7, 2)+'/'+SUBSTR(servdte, 5, 2)+'/'+SUBSTR(servdte, 3, 2)
                @ r, 72 SAY SUBSTR(servdte1, 7, 2)+'/'+SUBSTR(servdte1, 5, 2)+'/'+SUBSTR(servdte1, 3, 2)
             ENDIF
             IF  .NOT. EOF()
                r = r+1
                SKIP
             ELSE
                EXIT
             ENDIF
             @ r, 0 CLEAR TO 22, 79
          ENDDO
    ENDCASE
    @ 22, 0 CLEAR
    SET COLOR TO N+/B
    SET COLOR TO BG+/B
    @ 23, 20 SAY '    ������ <ESC> ==> ��Ѻ����'
    @ 24, 15 SAY '���� �������� ���� ���� <ENTER> �����ͺ�������'
    SET COLOR TO
    key = INKEY(0)
    GOTO hosptr
    IF key=5
       SKIP -1
    ELSE
       IF key=24 .AND.  .NOT. EOF()
          SKIP 1
       ELSE
          IF key=27
             SET COLOR TO N+/B
             CLEAR
             SET COLOR TO W+/B
             RETURN
          ELSE
             IF key=18
                SKIP -20
             ELSE
                IF key=3 .AND.  .NOT. EOF()
                   SKIP 20
                ELSE
                   SET COLOR TO N+/B
                   CLEAR
                   SET COLOR TO W+/B, W+/R
                   EXIT
                ENDIF
             ENDIF
          ENDIF
       ENDIF
    ENDIF
 ENDDO
 SET COLOR TO W+/B, W+/R
 RETURN
