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
          @ 1, 29 SAY 'โรงพยาบาล'+TRIM(hosname)
          STORE hoscode TO hos
          SET COLOR TO G+/B
          @ 1, 65 SAY 'ไทย/อังกฤษ = `'
          @ 2, 25 SAY '*****************************'
          @ 3, 25 SAY '* สอบถามด้วยเลขที่บัตรประกันสังคม *'
          @ 4, 25 SAY '*****************************'
          @ 0, 0 TO 24, 80
          SET COLOR TO N+/W
          @ 9, 21, 11, 59 BOX
          @ 10, 22 SAY 'เลขที่บัตรประกันสังคม : ' GET sso PICTURE '@r 99-9999999-9'
          SET COLOR TO BG+/B
          @ 22, 5 SAY '==> กรุณาใส่เลขที่บัตรประกันสังคม แล้วกดปุ่ม <ENTER>'
          @ 23, 5 SAY '    หรือ กดปุ่ม <ESC> กลับสู่เมนู'
          READ
          IF READKEY()=12
             EXIT
          ENDIF
          SELECT 1
          SET INDEX TO hssoix
          SEEK TRIM(sso)
          IF EOF()
             SET COLOR TO R+/B
             WAIT SPACE(5)+'!! ไม่พบเลขที่บัตรประกันสังคมในฐานข้อมูล...<กดปุ่มใด ๆ> !!'
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
          @ 1, 29 SAY 'โรงพยาบาล'+TRIM(hosname)
          STORE hoscode TO hos
          SET COLOR TO G+/B
          @ 1, 65 SAY 'ไทย/อังกฤษ = `'
          @ 2, 20 SAY '***************************************'
          @ 3, 20 SAY '*       สอบถามด้วย ชื่อ ผู้ประกันตน   *'
          @ 4, 20 SAY '***************************************'
          @ 0, 0 TO 24, 79
          SET COLOR TO N+/W
          @ 9, 9 CLEAR TO 11, 70
          @ 9, 9, 11, 70 BOX
          @ 10, 10 SAY 'ชื่อผู้ประกันตน  :'
          @ 10, 45 GET name1 PICTURE '@!'
          SET COLOR TO BG+/B
          @ 22, 5 SAY '==> กรุณาใสชื่อผู้ประกันตน แล้วกดปุ่ม <ENTER>'
          @ 23, 5 SAY '    หรือ กดปุ่ม <ESC> กลับสู่เมนู'
          READ
          IF READKEY()=12
             EXIT
          ENDIF
          SELECT 1
          SET INDEX TO hflnmix
          SEEK TRIM(name1)+TRIM(name2)
          IF EOF()
             SET COLOR TO R+/B
             WAIT SPACE(5)+'!! ไม่พบชื่อผู้ประกันตน ในฐานข้อมูล...<กดปุ่มใด ๆ> !!'
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
          @ 1, 29 SAY 'โรงพยาบาล'+TRIM(hosname)
          STORE hoscode TO hos
          SET COLOR TO G+/B
          @ 1, 65 SAY 'ไทย/อังกฤษ = `'
          @ 2, 25 SAY '*****************************'
          @ 3, 25 SAY '*      สอบถามด้วยนามสกุล    *'
          @ 4, 25 SAY '*****************************'
          @ 0, 0 TO 24, 79
          SET COLOR TO N+/W
          @ 9, 14, 11, 66 BOX
          @ 10, 15 SAY 'นามสกุล : ' GET name2 PICTURE '@!'
          SET COLOR TO BG+/B
          @ 22, 5 SAY '==> กรุณาใส่นามสกุล แล้วกดปุ่ม <ENTER>'
          @ 23, 5 SAY '    หรือ กดปุ่ม <ESC> กลับสู่เมนู'
          READ
          IF READKEY()=12
             EXIT
          ENDIF
          SELECT 1
          SET INDEX TO hlnmix
          SEEK TRIM(name2)
          IF EOF()
             SET COLOR TO R+/B
             WAIT SPACE(5)+'!! ไม่พบนามสกุลในฐานข้อมูล...<กดปุ่มใด ๆ> !!'
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
          @ 1, 29 SAY 'โรงพยาบาล'+TRIM(hosname)
          STORE hoscode TO hos
          SET COLOR TO G+/B
          @ 1, 65 SAY 'ไทย/อังกฤษ = `'
          @ 2, 25 SAY '*********************************'
          @ 3, 25 SAY '*      สอบถามด้วยชื่อ-นามสกุล   *'
          @ 4, 25 SAY '*********************************'
          @ 0, 0 TO 24, 79
          SET COLOR TO N+/W
          @ 9, 9 CLEAR TO 12, 70
          @ 9, 9, 12, 70 BOX
          @ 10, 10 SAY 'ชื่อผู้ประกันตน  : '
          @ 10, COL() GET name1
          @ 11, 10 SAY 'นามสกุล          : '
          @ 11, COL() GET name2
          SET COLOR TO BG+/B
          @ 22, 5 SAY '==> กรุณาใสชื่อและนามสกุล แล้วกดปุ่ม <ENTER>'
          @ 23, 5 SAY '    หรือ กดปุ่ม <ESC> กลับสู่เมนู'
          READ
          IF READKEY()=12
             EXIT
          ENDIF
          SELECT 1
          SET INDEX TO hflnmix
          SEEK TRIM(name1)+TRIM(name2)
          IF EOF()
             SET COLOR TO R+/B
             WAIT SPACE(5)+'!! ไม่พบชื่อ-นามสกุลในฐานข้อมูล...<กดปุ่มใด ๆ> !!'
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
          @ 1, 29 SAY 'โรงพยาบาล'+TRIM(hosname)
          STORE hoscode TO hos
          SET COLOR TO G+/B
          @ 1, 65 SAY 'ไทย/อังกฤษ = `'
          @ 2, 25 SAY '******************************'
          @ 3, 25 SAY '*     สอบถามด้วยรหัส สปส.    *'
          @ 4, 25 SAY '******************************'
          @ 0, 0 TO 24, 79
          SET COLOR TO N+/W
          @ 9, 25, 11, 56 BOX
          @ 10, 26 SAY '  รหัส สปส.             :' GET ssopvn PICTURE '9999'
          SET COLOR TO BG+/B
          @ 22, 5 SAY '==> กรุณาใส่รหัสของ สปส. แล้วกดปุ่ม <ENTER>'
          @ 23, 5 SAY '    หรือ กดปุ่ม <ESC> กลับสู่เมนู'
          READ
          IF READKEY()=12
             EXIT
          ENDIF
          SELECT 1
          SET INDEX TO hsspvn
          SEEK ssopvn
          IF EOF()
             SET COLOR TO R+/B
             WAIT SPACE(5)+'!! ไม่พบรหัส สปส.นี้ในฐานข้อมูล...<กดปุ่มใด ๆ> !!'
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
