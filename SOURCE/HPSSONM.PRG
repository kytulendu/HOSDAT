 SET EXACT OFF
 CLOSE DATABASES
 CLOSE INDEX
 PRIVATE page, prvno
 USE hospital
 hosnm = TRIM(hosname)
 USE
 SELECT 1
 USE ssobch ALIAS aprv INDEX hsprvix
 SELECT 2
 USE hospdb ALIAS ahos INDEX hflnmix
 DO WHILE .T.
    empseq = 0
    SET COLOR TO N+/B
    @ 7, 1 CLEAR TO 23, 78
    SET COLOR TO W+/B
    SET COLOR TO W+/R
    @ 10, 19 CLEAR TO 16, 59
    @ 11, 29 SAY '�ô����� PRINTER'
    @ 12, 29 SAY '����������д���������'
    @ 13, 29 SAY '��д�ɵ�����ͧ ��Ҵ 9"x11"'
    @ 14, 29 SAY '��������ǡ� <ENTER>'
    @ 15, 29 SAY '*** ¡��ԡ�� <ESC> ***'
    SET COLOR TO
    y = INKEY(0)
    DO WHILE y<>13 .AND. y<>27
       y = INKEY(0)
    ENDDO
    IF y=27 .OR. RECCOUNT()=0
       SET COLOR TO W/B
       CLEAR
       EXIT
    ENDIF
    SET COLOR TO N+/B
    @ 7, 1 CLEAR TO 23, 78
    SET COLOR TO W+/B
    SET COLOR TO W+/R
    @ 12, 10 CLEAR TO 14, 70
    @ 13, 20 SAY '��й����ѧ�������§ҹ����Сѹ�������ʶҹ��Һ��'
    SET DEVICE TO PRINTER
    SET PRINTER ON
    page = 0
    empseq = 0
    row = 99
    SELECT 2
    GOTO TOP
    DO WHILE  .NOT. EOF()
       IF row>=32
          page = page+1
          @ 0, 0 SAY CHR(27)+'E'+'HPSSONM'
          @ PROW(), 50 SAY '*** �ӹѡ�ҹ��Сѹ�ѧ�� ***'
          @ PROW()+1, 38 SAY '*** ��§ҹ����Сѹ�������ʶҹ��Һ�� '+'�ç��Һ��'+hosnm+' ***'
          @ PROW()+1, 0 SAY '�ѹ��� '
          @ PROW(), PCOL() SAY DATE() PICTURE '@E'
          @ PROW(), 95 SAY '˹��'
          @ PROW(), 100 SAY page PICTURE '###'
          @ PROW()+1, 0 SAY CHR(27)+'E'+REPLICATE('-', 113)
          @ PROW()+1, 0 SAY CHR(27)+'E'+'�ӴѺ���'
          @ PROW(), PCOL()+1 SAY '�Ţ����Сѹ��'
          @ PROW(), PCOL()+5 SAY '����-ʡ��'
          @ PROW(), 58 SAY '�Ţ�ѵû�ЪҪ�'
          @ PROW(), 75 SAY '�ѹ�����������ԡ��'
          @ PROW(), 89 SAY '�ѹ����ش������ԡ��'
          @ PROW(), 107 SAY '���� ʻ�.'
          @ PROW()+1, 0 SAY CHR(27)+'E'+REPLICATE('-', 113)
          @ PROW(), PCOL() SAY CHR(27)+'F'
          row = 0
       ENDIF
       empseq = empseq+1
       row = row+1
       @ PROW()+1, 0 SAY empseq PICTURE '#####'
       IF SUBSTR(ssoid, 1, 2)$'99'
          c_ssoid = SPACE(10)
          @ PROW(), PCOL()+1 SAY c_ssoid
       ELSE
          @ PROW(), PCOL()+1 SAY ssoid PICTURE '@r 99-9999999-9'
       ENDIF
       @ PROW(), 21 SAY TRIM(pname)
       @ PROW(), PCOL() SAY TRIM(fname)
       @ PROW(), 40 SAY TRIM(lname)
       @ PROW(), 56 SAY nid
       @ PROW(), 76 SAY SUBSTR(servdte, 7, 2)+'/'+SUBSTR(servdte, 5, 2)+'/'+SUBSTR(servdte, 3, 2)
       @ PROW(), 92 SAY SUBSTR(servdte1, 7, 2)+'/'+SUBSTR(servdte1, 5, 2)+'/'+SUBSTR(servdte1, 3, 2)
       @ PROW(), 109 SAY hospvn+pvnbran
       SELECT 2
       SKIP
    ENDDO
    @ PROW()+1, 0 SAY CHR(27)+'E'+REPLICATE('-', 113)
    @ PROW()+1, 0 SAY '����ӹǹ����Сѹ��'
    @ PROW(), PCOL()+4 SAY empseq PICTURE '#,###,###'
    @ PROW(), PCOL()+2 SAY '��'
    @ PROW()+1, 0 SAY CHR(27)+'E'+REPLICATE('=', 113)
    @ PROW(), PCOL() SAY CHR(27)+'F'
    @ PROW()+1, 0 SAY ' '
    EJECT
    SET DEVICE TO SCREEN
    SET PRINTER OFF
    EXIT
 ENDDO
 SET COLOR TO N+/B
 CLOSE ALL
 RETURN
