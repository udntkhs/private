@echo off

rem 特定のパッケージ名を変数に格納


SET /P WORD="検索したい単語を入力:"
FOR /f "usebackq tokens=3*" %%a IN (`DISM /Online  /Get-Packages ^| FIND /i "%WORD%"`) DO (
  ECHO %%b
)
PAUSE
EXIT /b