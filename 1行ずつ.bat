@echo off
rem �t�@�C����1�s���ǂݍ���
for /f "tokens=*" %%a in ('type "D:\Document\test1.txt"') do (

  rem �o�͂���
  echo %%a

  rem ���₷���悤�ɋ�؂���o�͂���
  echo ---

)
pause