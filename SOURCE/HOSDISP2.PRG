 SET EXACT OFF
 CLEAR
 CLOSE ALL
 SELECT 2
 USE hospital
 SELECT 1
 USE hospdb
 chkpvn = SPACE(4)
 totpvn = 0
 SET COLOR TO N+/B
 SET COLOR TO W+/B
 SET COLOR TO N+/B
 SET COLOR TO BG+/B
 SELECT 2
 @ 1, 29 SAY 'โรงพยาบาล'+TRIM(hosname)
 SET COLOR TO G+/B
 @ 1, 65 SAY 'ไทย/อังกฤษ = `'
 @ 2, 21 SAY '*****************************************'
 @ 3, 21 SAY '* สอบถามยอดผู้ประกันตนตามรหัส สปส. ที่รับผิดชอบ *'
 @ 4, 21 SAY '*****************************************'
 SET COLOR TO N+/W
 @ 6, 10 CLEAR TO 10, 70
 @ 6, 10, 10, 70 BOX
 SET COLOR TO N+/W
 @ 8, 15 SAY 'รหัส สปส.ที่ต้องการสอบถาม       :'
 SET COLOR TO BG+/B
 @ 22, 5 SAY '==>กรุณาใส่รหัส สปส. แล้วกดปุ่ม <ENTER>'
 @ 23, 5 SAY '   หรือ กดปุ่ม <ESC> กลับสู่เมนู'
 SET COLOR TO N+/W
 @ 8, 57 GET chkpvn PICTURE '9999'
 READ
 IF READKEY()=12 .OR. chkpvn=SPACE(2)
    CLOSE DATABASES
    CLOSE INDEX
    SET COLOR TO BG+/B
    RETURN
 ENDIF
 SET COLOR TO R+/B
 @ 23, 23 SAY '!! ขณะนี้กำลังรวมยอดผู้ประกันตน กรุณารอสักครู่ !!'
 SET COLOR TO BG+/B
 SET COLOR TO N+/W
 @ 11, 10 CLEAR TO 15, 70
 @ 11, 10, 15, 70 BOX
 @ 13, 15 SAY 'จำนวนผู้ประกันตนที่ รับผิดชอบ   :'
 @ 13, 55 SAY totpvn PICTURE '###,###'
 @ 13, 65 SAY 'คน'
 SELECT 1
 SET FILTER TO hospvn+pvnbran=chkpvn
 GOTO TOP
 DO WHILE  .NOT. EOF()
    totpvn = totpvn+1
    @ 13, 55 SAY totpvn PICTURE '###,###'
    SKIP
 ENDDO
 SET FILTER TO
 SET COLOR TO BG+/B
 @ 22, 1 CLEAR TO 23, 79
 @ 23, 18 SAY '   กด <ESC> หรือ ปุ่มใด ๆ เมื่อต้องการกลับเมนู      '
 WAIT ''
 CLOSE DATABASES
 CLOSE INDEX
 RETURN
