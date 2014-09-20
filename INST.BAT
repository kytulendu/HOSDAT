@echo off
rem *****************************
rem program inst.bat            *
rem create : 21 October 1993    *
rem modify : 07 november 1993   *
rem        : 19 august   1994   *
rem        : 16 september 1994  *
rem by Monchai Bhaopichyakul    *
rem    System Analyst           *
rem    Social Security Office   *
rem *****************************
call README.BAT
cls
be beep /R3
be sa white on blue /cls
be window 0 0 14 65 black on green zoom shadow explode
be rowcol 2 10 'Installation  P r o g r a m s.                       '
be beep
be rowcol 3 10 'F r o m       SOCIAL SECURITY OFFICE.                '
be beep
be rowcol 4 10 'I n   T o     HOSPITALS.                             '
be beep
be rowcol 6 10 'Appeared      The Word "Press Any Key To Continue"   '
be beep
be rowcol 7 10 '              On Bottom Line Of Monitor Screen,      '
be beep
be rowcol 8 10 '              Please PRESS ANY KEY.                  ' 
be beep
be rowcol 10 10 'A f t e r     Press Any Key To Continue,             '
be beep
be rowcol 11 10 'P l e a s e   WAIT !.                                '
be beep
be rowcol 12 10 'U n t i l l   Programs Installed.                    '
be beep /R2
be rowcol 23 0
pause
rem :start_install
rem -------------------------------------------
copy START.BAT c:\ >nul
rem -------------------------------------------

rem :install_hosdat
if not exist c:\hosdat\nul md c:\hosdat >nul
pkunzip -o hossys.zip c:\hosdat

if not exist c:\hosdat\hospdb.dbf copy hospdb.dbf c:\hosdat >nul
copy hospital.dbf c:\hosdat >nul
copy ssobch.dbf c:\hosdat >nul

cls
call VTH240
be window 2 0 6 79 white on red zoom shadow
be rowcol 3 2 'หลังจากติดตั้งระบบสอบถามรายชื่อผู้ประกันตนภายใต้สถานพยาบาลเรียบร้อยแล้ว  '
be rowcol 4 2 'เมื่อต้องการใช้ระบบฯ ให้ใช้คำสั่ง START ที่ Dos Prompt' 
be rowcol 5 2 'ใน Root Directory ของ Drive C:'

rem -------------------------------------------
rem :end_install
rem -------------------------------------------
be beep /R3
be window 8 10 12 70 black on white zoom shadow
be rowcol 9 15 '  I n s t a l l a t i o n      Completed ...      '
be rowcol 10 15 '  R e m o v e    Diskette  From  Disk  Drive.     '
be rowcol 11 15 '  then PRESS [Ctrl+Alt]+Del, Reboot Dos Again. '
pause >NUL
call VTH240 /u
off
rem  *** end program install.bat ***
