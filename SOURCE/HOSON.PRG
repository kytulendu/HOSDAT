 SET TALK OFF
 SET BELL OFF
 SET ESCAPE OFF
 SET STATUS ON
 SET SAFETY OFF
 SET ECHO OFF
 CLEAR
 SET COLOR TO N+/B
 SET COLOR TO W+/B
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
 @ 7, 20, 15, 58 BOX
 SET COLOR TO N+/W, W+/R
 SAVE SCREEN TO shosmn
 SET COLOR TO W+/B
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
    @ 11, 20 SAY 'โปรดรอสักครู่ กำลังนำข้อมูลลงเครื่องฯ   '
    @ 12, 20 SAY '=============================           '
    CLOSE DATABASES
    CLOSE INDEX
    IF FILE('hospdbon.zip')
       RUN pkunzip hospdbon.zip  -o >nul
    ENDIF
    if file('&drv\backup.001')
       !restore &drv c: /s >nul
    ENDIF
    IF FILE('&drv\hospdbon.zip')
       RUN pkunzip -o &drv\hospdbon.zip
    ENDIF
    IF FILE('&drv\hospdbon.txt')
       ! COPY &drv\hospdbon.txt c:\hosdat /y >nul
    ENDIF
    IF FILE('hospdbon.txt')
       USE hostemp
       ZAP
       APPEND FROM hospdbon.txt SDF
       IF FILE('hospdbon.zip')
          RUN del hospdbon.zip >nul
       ENDIF
       DO chhos
       @ 5, 10, 20, 70 BOX
       SET COLOR TO W+/R, N/W
       @ 6, 14 CLEAR TO 19, 66
       @ 6, 14, 19, 66 BOX
       SET COLOR TO W+/R
       @ 11, 18 SAY '!! เรียบร้อยแล้ว นำแผ่น DISKETTE ออกจาก DRIVE '+drv
       @ 12, 18 SAY '          กด ENTER กลับเมนูจัดการข้อมูล   '
       SET COLOR TO W+/B
    ELSE
    ENDIF
 ENDIF
 SET COLOR TO W+/B
 DO reinidx
 CLOSE DATABASES
 CLOSE INDEX
 RUN del hospdbon.txt
 SET STATUS OFF
 RETURN
*
PROCEDURE chhos
 CLEAR
 CLOSE ALL
 SELECT 2
 USE hospdb ALIAS hos
 SELECT 1
 USE hostemp
 DO WHILE  .NOT. EOF()
    wssonum = SPACE(13)
    wssoid = SPACE(10)
    wnid = SPACE(13)
    wpname = SPACE(15)
    wfname = SPACE(20)
    wlname = SPACE(38)
    whospvn = SPACE(02)
    wssobran = SPACE(02)
    whosid = SPACE(02)
    wstrdte = SPACE(08)
    wexpdte = SPACE(08)
    wssonum = ssoid
    wnid = nid
    wpname = pname
    wfname = fname
    wlname = lname
    whospvn = hospvn
    wssobran = ssobran
    whosid = hosid
    wstrdte = strdte
    wexpdte = expdte
    wssonum = ssoid
    wssoid = SUBSTR(wssonum, 4, 13)
    SELECT 2
    APPEND BLANK
    REPLACE hos.ssoid WITH wssoid
    REPLACE hos.pname WITH wpname
    REPLACE hos.fname WITH wfname
    REPLACE hos.lname WITH wlname
    REPLACE hos.nid WITH wnid
    REPLACE hos.hospvn WITH whospvn
    REPLACE hos.pvnbran WITH wssobran
    REPLACE hos.hosid WITH whosid
    REPLACE hos.servdte1 WITH wexpdte
    REPLACE hos.servdte WITH wstrdte
    SELECT 1
    SKIP
 ENDDO
 CLOSE ALL
 RETURN
