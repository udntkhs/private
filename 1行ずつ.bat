@echo off

set FILE1=D:\Document\test1.txt
set FILE2=D:\Document\test2.txt
rem �t�@�C����1�s���ǂݍ���
for /f "tokens=*" %%a in ('type "%FILE1%"') do (
 echo %FILE1%
  echo %%a
  rem ���₷���悤�ɋ�؂���o�͂���
  echo ---

for /f "tokens=*" %%o in ('type "%FILE2%"') do (
 echo %FILE2%
  echo %%o
  rem ���₷���悤�ɋ�؂���o�͂���
  echo ---

)


)
pause