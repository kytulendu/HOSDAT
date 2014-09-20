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
    @ 1, 19 SAY '        *** สำนักงานประกันสังคม ***  '
    @ 2, 19 SAY ' [ เมนูสอบถามผู้ประกันตนที่ใช้บริการของสถานพยาบาล ]'
    SET COLOR TO RB+/B
    @ 4, 32 SAY 'โรงพยาบาล'+TRIM(hos_name)
    SET COLOR TO GR+/B
    @ 5, 17 SAY '            ****    เมนูหลัก  ****'
    SET COLOR TO W+/B
    @ 0, 0 TO 24, 79
    SET COLOR TO B+/W
    @ 7, 9, 19, 70 BOX
    SET COLOR TO N+/W, W+/R
    msgsys1 = '  สอบถามการใช้บริการสถานพยาบาลของผู้ประกันตน ด้วยเลขที่บัตรประกันสังคม'
    msgsys2 = '  สอบถามการใช้บริการสถานพยาบาลของผู้ประกันตน ด้วยชื่อผู้ประกันตน'
    msgsys3 = '  สอบถามการใช้บริการสถานพยาบาลของผู้ประกันตน ด้วยนามสกุลผู้ประกันตน'
    msgsys4 = '  สอบถามการใช้บริการสถานพยาบาลของผู้ประกันตน ด้วยชื่อ-นามสกุลผู้ประกันตน'
    msgsys5 = '  สอบถามการใช้บริการสถานพยาบาลของผู้ประกันตน ตามรหัส สปส. ที่รับผิดชอบ'
    msgsys6 = '  สอบถามจำนวนผู้ประกันตนที่ใช้บริการของสถานพยาบาล ตามรหัส สปส. ที่รับผิดชอบ'
    msgsys7 = '  ระบุรหัส สปส./เรียงตาม(รหัส สปส./เลขประกันสังคม/ชื่อ-สกุล ผู้ประกันตน)'
    msgsys8 = '  ลบข้อมูล/นำข้อมูลลง/จัดเรียงข้อมูล/รหัส สปส.จังหวัด'
    msgsys9 = '  เลิกการทำงาน สอบถามข้อมูลผู้ประกันตนที่ใช้บริการของสถานพยาบาล'
    @ 9, 12 PROMPT '  1)  สอบถามด้วยเลขที่บัตรประกันสังคม                  ' MESSAGE msgsys1
    @ 10, 12 PROMPT '  2)  สอบถามด้วย ชื่อ ผู้ประกันตน                      ' MESSAGE msgsys2
    @ 11, 12 PROMPT '  3)  สอบถามด้วย นามสกุล ผู้ประกันตน                   ' MESSAGE msgsys3
    @ 12, 12 PROMPT '  4)  สอบถามด้วย ชื่อ-นามสกุล ผู้ประกันตน              ' MESSAGE msgsys4
    @ 13, 12 PROMPT '  5)  สอบถามตามรหัส สปส. ที่รับผิดชอบ                  ' MESSAGE msgsys5
    @ 14, 12 PROMPT '  6)  สอบถามยอดผู้ประกันตนตามรหัส สปส. ที่รับผิดชอบ    ' MESSAGE msgsys6
    @ 15, 12 PROMPT '  7)  พิมพ์รายชื่อผู้ประกันตนภายใต้สถานพยาบาล          ' MESSAGE msgsys7
    @ 16, 12 PROMPT '  8)  จัดการข้อมูล                                     ' MESSAGE msgsys8
    @ 17, 12 PROMPT '  0)  เลิกงาน                                          ' MESSAGE msgsys9
    @ 20, 19 SAY '==> เลือกรายการโดยใช้ '+CHR(24)+' หรือ '+CHR(25)+' แล้วกด ENTER'
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
 @ 3, 11 SAY 'เลิกการทำงาน ระบบสอบถามรายชื่อผู้ประกันตนภายใต้สถานพยาบาล '
 SET COLOR TO N/GR
 @ 6, 10 CLEAR TO 8, 77
 @ 6, 10, 8, 77 BOX
 @ 7, 11 SAY 'ระบบสอบถามรายชื่อผู้ประกันตนภายใต้สถานพยาบาล สำนักงานประกันสังคม'
 SET COLOR TO N/W
 @ 16, 17 SAY 'VERSION 2.00'
 @ 17, 17 SAY '25 MARCH 1995'
 @ 22, 8 SAY 'peace'
 @ 22, 68 SAY 'computer'
 SET COLOR TO W/B
 @ 10, 10 CLEAR TO 12, 50
 @ 10, 10, 12, 50 BOX
 @ 11, 11 SAY 'พัฒนาระบบโดย :'
 SET COLOR TO W+/R
 @ 8, 35 CLEAR TO 20, 75
 @ 8, 35, 20, 75 BOX
 @ 9, 37 SAY 'กองทะเบียนและประมวลผล'
 @ 10, 40 SAY 'โทร : 5857043'
 @ 11, 40 SAY '    : 9110895-6'
 @ 12, 40 SAY ' (02) 5859600-3 ต่อ  4801-6'
 @ 13, 40 SAY '      5859605-7'
 @ 14, 37 SAY 'กองประสานการแพทย์และฟื้นฟูสมรรถภาพ'
 @ 15, 40 SAY 'โทร : 5857017'
 @ 16, 40 SAY '      5857041'
 @ 17, 40 SAY ' (02) 5859600-3 ต่อ  4708'
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
