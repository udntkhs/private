@echo off
rem ファイルを1行ずつ読み込む
for /f "tokens=*" %%a in ('type "D:\Document\test1.txt"') do (

  rem 出力する
  echo %%a

  rem 見やすいように区切りを出力する
  echo ---

)
pause