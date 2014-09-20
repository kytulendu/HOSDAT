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
    @ 1, 19 SAY '        *** สำนักงานประกันสังคม ***  '
    @ 2, 19 SAY '   [ พิมพ์รายชื่อผู้ประกันตนภายใต้สถานพยาบาล ]'
    SET COLOR TO RB+/B
    @ 4, 30 SAY 'โรงพยาบาล'+TRIM(hos_name)
    SET COLOR TO GR+/B
    SET COLOR TO W+/B
    @ 0, 0 TO 24, 79
    SET COLOR TO B+/W
    @ 7, 15, 15, 65 BOX
    SET COLOR TO N+/W, W+/R
    msgmnp1 = ' พิมพ์รายชื่อผู้ประกันตนภายใต้สถานพยาบาล ตามรหัส สปส.'
    msgmnp2 = ' พิมพ์รายชื่อผู้ประกันตนภายใต้สถานพยาบาลทั้งหมด เรียงตามรหัส สปส.'
    msgmnp3 = ' พิมพ์รายชื่อผู้ประกันตนภายใต้สถานพยาบาลทั้งหมด เรียงตามเลขประกันสังคม'
    msgmnp4 = ' พิมพ์รายชื่อผู้ประกันตนภายใต้สถานพยาบาลทั้งหมด เรียงตามชื่อ-สกุล ผู้ประกันตน'
    msgmnp5 = ' เลิกการทำงาน พิมพ์รายชื่อผู้ประกันตนภายใต้สถานพยาบาล กลับเมนูหลัก'
    @ 9, 22 PROMPT '  1)  ระบุรหัส สปส.                  ' MESSAGE msgmnp1
    @ 10, 22 PROMPT '  2)  เรียงตามรหัส สปส.              ' MESSAGE msgmnp2
    @ 11, 22 PROMPT '  3)  เรียงตามเลขประกันสังคม         ' MESSAGE msgmnp3
    @ 12, 22 PROMPT '  4)  เรียงตามชื่อ-สกุล ผู้ประกันตน  ' MESSAGE msgmnp4
    @ 13, 22 PROMPT '  0)  เลิกงาน                        ' MESSAGE msgmnp5
    @ 20, 19 SAY '==> เลือกรายการโดยใช้ '+CHR(24)+' หรือ '+CHR(25)+' แล้วกด ENTER'
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
