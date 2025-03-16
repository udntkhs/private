@ECHO OFF
cd /d %~dp0

rem ****************************
rem TXTファイルの列分割
rem ****************************
rem ------------変数設定-------------

rem 分割したいファイル
SET INPUT_FILE=AbstractDIR.log
rem ログ出力先
SET LOG="%~dn0.log"
rem 分割したいファイルの列数
SET /P ROW_MAX=分割したいファイルの列数:

rem ----ここまで　適宜編集する-----------

SET COUNT=0
:LOOP
SET /a COUNT+=1
ECHO ----%COUNT%列目------ >> %LOG%
FOR /f "skip=2 tokens=%COUNT%" %%a in (%INPUT_FILE%) do (
    CALL :GET_CONTENTS %%a
)
IF %COUNT% equ %ROW_MAX% (
    GOTO END
)
GOTO LOOP

:END
EXIT /b

:GET_CONTENTS
SET ROW_CONTENTS=%~1
ECHO %ROW_CONTENTS% >> %LOG% 
EXIT /b