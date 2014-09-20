@ECHO OFF
prompt $p$g
cd \hosdat
if exist c:\hosdat\*. del c:\hosdat\*. >nul
if exist c:\hosdat\*.bak del c:\hosdat\*.bak >nul
call VTH240
HOSSYS
call VTH240 /u
cls
cd \
