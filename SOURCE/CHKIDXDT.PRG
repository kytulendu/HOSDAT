 SET TALK OFF
 SET ECHO OFF
 SET SAFETY OFF
 SAVE SCREEN TO chkidxscr
 IF FILE('LIDXDTEF.MEM')
    RESTORE FROM LIDXDTEF ADDITIVE
    USE HOSPDB
    IF lidxdate<>LUPDATE()
       SET COLOR TO W+/RB
       @ 1, 10 CLEAR TO 20, 70
       @ 1, 11, 19, 69 BOX
       @ 3, 23 SAY 'กำลัง ทำการจัดเรียงข้อมูลใหม่ กรุณารอสักครู่'
       @ 6, 20, 15, 60 BOX
       lidxdate = LUPDATE()
       SAVE TO lidxdtef ALL LIKE lidxd*
       @ 8, 23 SAY 'FILE HOSPDB.DBF'
       SET COLOR TO W+/B*
       @ 10, 23 SAY 'HOSPDB\HSSOIX.IDX '
       INDEX ON ssoid TO HSSOIX
       SET COLOR TO W/N
       SET COLOR TO W+/B
       @ 11, 23 SAY 'HOSPDB\HFLNMIX.IDX'
       INDEX ON TRIM(fname)+TRIM(lname) TO HFLNMIX
       SET COLOR TO RB/W*
       @ 12, 23 SAY 'HOSPDB\HLNMIX.IDX '
       INDEX ON TRIM(lname) TO HLNMIX
       SET COLOR TO RB+/B
       @ 13, 23 SAY 'HOSPDB\HSSPVN.IDX '
       SET COLOR TO W+/B
       USE HOSPDB
       INDEX ON hospvn+ssoid TO HSSPVN
       RESTORE SCREEN FROM chkidxscr
       @ 8, 23 SAY 'FILE SSOBCH.DBF'
       SET COLOR TO W+/B*
       @ 10, 23 SAY 'SSOBCH\HSPRVIX.IDX '
       USE SSOBCH
       INDEX ON prvcode TO HSPRVIX
    ENDIF
    CLOSE INDEX
    CLOSE DATABASES
    RELEASE ALL LIKE LIDXD*
 ELSE
    SET COLOR TO W+/RB
    @ 1, 10 CLEAR TO 20, 70
    @ 1, 11, 19, 69 BOX
    @ 3, 23 SAY 'กำลังทำการ จัดเรียงข้อมูลใหม่ กรุณารอสักครู่'
    @ 6, 20, 15, 60 BOX
    SAVE SCREEN TO chkidxscr1
    USE HOSPDB
    lidxdate = LUPDATE()
    SAVE TO lidxdtef ALL LIKE lidxd*
    @ 8, 23 SAY 'FILE HOSPDB.DBF'
    SET COLOR TO W+/B*
    @ 10, 23 SAY 'HOSPDB\HSSOIX.IDX '
    INDEX ON ssoid TO HSSOIX
    SET COLOR TO W/N
    SET COLOR TO W+/R
    @ 11, 23 SAY 'HOSPDB\HFLNMIX.IDX'
    INDEX ON TRIM(fname)+TRIM(lname) TO HFLNMIX
    SET COLOR TO RB/W*
    @ 12, 23 SAY 'HOSPDB\HLNMIX.IDX '
    INDEX ON TRIM(lname) TO HLNMIX
    SET COLOR TO RB+/B
    @ 13, 23 SAY 'HOSPDB\HSSPVN.IDX '
    SET COLOR TO W+/B
    INDEX ON hospvn+ssoid TO HSSPVN
    RESTORE SCREEN FROM chkidxscr1
    @ 8, 23 SAY 'FILE SSOBCH.DBF'
    SET COLOR TO W+/B*
    @ 10, 23 SAY 'SSOBCH\HSPRVIX.IDX '
    USE SSOBCH
    INDEX ON prvcode TO HSPRVIX
    RELEASE ALL LIKE LIDXD*
 ENDIF
 CLOSE DATABASES
 CLOSE INDEX
 SET COLOR TO W/B
 RESTORE SCREEN FROM chkidxscr
 RETURN
