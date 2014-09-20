@echo off
rem ******************************
rem *program readme.bat           *
rem *create 08/november 1993      *
rem *modify 19/august 1994        *
rem *       01/november 1994      *
rem *by : Monchai Bhaopichyakul   *
rem *position : System analyst    *
rem *Social Securuty Head Office  *
rem *******************************
call VTH240
cls
echo ========================================================================
echo การติดตั้งโปรแกรมสอบถามรายชื่อผู้ประกันตนภายใต้สถานพยาบาล
echo ========================================================================
echo o จุดประสงค์
echo ----------
echo - เพื่อ ติดตั้งโปรแกรมสอบถามรายชื่อผู้ประกันตน และโครงสร้างแฟ้มฐานข้อมูล 
echo   ให้สถานพยาบาลในโครงการผู้ประกันตนเลือกสถานพยาบาล ของสำนักงานประกันสังคม
echo o หมายเหตุ
echo ---------
echo # โปรแกรมทำงานภายใต้ระบบปฏิบัติการ(DOS) Version 5.00 ขึ้นไป
echo # Hardware Req. 
echo     o PC รุ่น PC/AT,PS/2 หรือ PC IBM COMPATIBLE
echo     o Disk Drive ขนาด 3.5" ความจุ 1.44 Mb.  
echo     o VGA Color Monitor.
echo     o Harddisk Free Spaces ไม่น้อยกว่า 30 Mb.
echo     o Printer รหัสการพิมพ์ภาษาไทยของมหาวิทยาลัยเกษตรศาสตร์
echo # Software Req. 
echo     o Foxbase
echo     o pkunzip.exe Version 2.04 
echo     o Vth240.com ชุดคำสั่งควบคุมการใช้ภาษาไทยรหัส สมอ.
echo ========================================================================
echo ฝ่ายประมวลผล กองทะเบียนและประมวลผล สำนักงานประกันสังคม
echo =======================================================PEACE=&=COMPUTER=
echo กด ENTER เพื่อเริ่มทำการนำข้อมูลลงเครื่องฯ/ กด Ctrl+C เพื่อยกเลิกการทำงาน
pause >nul
call VTH240 /u
rem ****  end program readme.bat   ****
