@echo off

set FILE1=D:\Document\test1.txt
set FILE2=D:\Document\test2.txt
rem ファイルを1行ずつ読み込む
for /f "tokens=*" %%a in ('type "%FILE1%"') do (
 echo %FILE1%
  echo %%a
  rem 見やすいように区切りを出力する
  echo ---

for /f "tokens=*" %%o in ('type "%FILE2%"') do (
 echo %FILE2%
  echo %%o
  rem 見やすいように区切りを出力する
  echo ---

)


)
pause