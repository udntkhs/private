@ECHO OFF

REM *******************************************
REM USBのドライブレター割当と設定画面呼出
REM
REM 2025.06.16
REM
REM Windows PE内の下記に格納
REM X:\windows\system32\startnet.cmd
REM オリジナルはコピーしてリネームすること
REM *******************************************


REM ボリュームリスト取得
REM -------------------------
ECHO list vol | diskpart > X:\VolumeList.txt


REM ボリュームリスト読込
REM -------------------------
FOR /f "tokens=1,2,3,4" %%a IN (X:\VolumeList.txt) DO (
	CALL :GetVolNum %%c %%d
)


REM ドライブレターの設定
REM ------------------------
SET D_Script=X:\diskpart_script.txt

ECHO select vol %PE_NUM% > %D_Script%
ECHO assign letter P >> %D_Script%
ECHO select vol %DATA_NUM% >> %D_Script%
ECHO assign letter T >> %D_Script%

diskpart /s %D_Script%


REM 設定画面BAT呼出
REM -----------------------
CD /d T:\
CALL OPMenu.bat



:*****************
:GetVolNum
:*****************

REM 引数の変数設定
REM ----------------
SET LNAME=%~1
SET LNUM=%~2


REM DATAラベルの取得
REM ------------------
ECHO %LNAME% | FIND "DATA" > NUL
IF %ERRORLEVEL% equ 0 (
	SET DATA_NUM=%LNUM%
)


REM WINPEラベルの取得
REM ------------------
ECHO %LNAME% | FIND "WINPE" > NUL
IF %ERRORLEVEL% equ 0 (
	SET PE_NUM=%LNUM%
)

EXIT /b