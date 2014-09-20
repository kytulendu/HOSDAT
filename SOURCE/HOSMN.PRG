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
    @ 1, 19 SAY '        *** สำนักงานประกันสังคม ***  '
    @ 2, 19 SAY '        [[[    จัดการข้อมูล  ]]]    '
    SET COLOR TO RB+/B
    @ 4, 30 SAY 'โรงพยาบาล'+TRIM(hos_name)
    SET COLOR TO GR+/B
    SET COLOR TO W+/B
    @ 0, 0 TO 24, 79
    SET COLOR TO B+/W
    @ 7, 20, 15, 70 BOX
    SET COLOR TO N+/W, W+/R
    msgmn1 = ' ลบข้อมูลผู้ประกันตนออกจากฐานข้อมูล เพื่อรับข้อมูลเดือนใหม่( ทำ 1 ครั้ง/เดือน)'
    msgmn2 = ' นำข้อมูลผู้ประกันตนภายใต้สถานพยาบาล จาก Diskette ของ สปส. ลงเครื่องฯ'
    msgmn3 = ' นำข้อมูลผู้ประกันตนภายใต้สถานพยาบาล จาก Diskette ของ ON-LINE ลงเครื่องฯ'
    msgmn4 = ' จัดเรียงข้อมูลผู้ประกันตนภายใต้สถานพยาบาล เวลาข้อมูลมีปัญหาในการสอบถาม'
    msgmn5 = ' แสดงรหัส สำนักงานประกันสังคมจังหวัด ออกทางจอภาพ'
    msgmn6 = ' เลิกการทำงาน จัดการข้อมูล กลับเมนูหลัก'
    @ 9, 25 PROMPT '  1)  ลบข้อมูล                      ' MESSAGE msgmn1
    @ 10, 25 PROMPT '  2)  นำข้อมูลลงจากระบบ OFF-LINE    ' MESSAGE msgmn2
    @ 11, 25 PROMPT '  3)  นำข้อมูลลงจากระบบ ON-LINE     ' MESSAGE msgmn3
    @ 12, 25 PROMPT '  4)  จัดเรียงข้อมูล                ' MESSAGE msgmn4
    @ 13, 25 PROMPT '  5)  รหัส สปส. จังหวัด             ' MESSAGE msgmn5
    @ 14, 25 PROMPT '  0)  เลิกงาน                       ' MESSAGE msgmn6
    @ 20, 19 SAY '==> เลือกรายการโดยใช้ '+CHR(24)+' หรือ '+CHR(25)+' แล้วกด ENTER'
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
          @ 9, 20 SAY 'ยืนยันการลบข้อมูล [Y/N]  :' GET choi PICTURE 'Y'
          READ
          IF choi='Y'
             @ 11, 25 SAY 'โปรดรอสักครู่ กำลังลบข้อมูล ENTER'
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
             @ 11, 18 SAY '!! เรียบร้อยแล้ว กด ENTER กลับเมนูจัดการข้อมูล '
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
          @ 9, 20 SAY 'ยืนยันการนำข้อมูลลงเครื่องฯ [Y/N]  :' GET choi PICTURE 'Y'
          READ
          IF choi$'Yy'
             @ 11, 20 SAY 'จาก DRIVE :'
             @ 11, 35 PROMPT 'A:'
             @ 11, 39 SAY 'หรือ '
             @ 11, 45 PROMPT 'B:'
             MENU TO sldrv
             DO CASE
                CASE sldrv=1
                   drv = 'A:'
                CASE sldrv=2
                   drv = 'B:'
             ENDCASE
             @ 11, 20 SAY 'โปรดใส่แผ่นข้อมูลรายชื่อผู้ประกันตน '
             @ 12, 20 SAY 'ใน DRIVE '+drv+' พร้อมแล้วกดปุ่ม ENTER '
             WAIT ''
             @ 11, 20 SAY 'โปรดรอสักครู่ กำลังนำข้อมูลลงเครื่องฯ   '
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
                @ 11, 18 SAY '!! เรียบร้อยแล้ว นำแผ่น DISKETTE ออกจาก DRIVE '+drv
                @ 12, 18 SAY '          กด ENTER กลับเมนูจัดการข้อมูล   '
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
