@ECHO OFF
cd /d %~dp0
rem ***************************
rem PowerShellのdir結果からファイルパスと容量抽出
rem ***************************
rem ログファイル
SET LOG="%~dn0.log"

rem 分割したいファイル
SET SPLIT_FILE=outputPS.txt
rem ***************************
rem MAIN PROCESS
rem ***************************
rem ディレクトリ、ファイル名、容量の抽出
FOR /f "skip=5 tokens=2,5,4" %%n in (%SPLIT_FILE%) do (
    ECHO %%n %~dp0%%p %%o >> TEMP.txt
)
ECHO PATH Volume[byte] > %LOG%
ECHO ---- ------- >> %LOG%
rem 正規表現[0-9]{4}は使えないっぽい
FOR /f "usebackq tokens=1-3" %%a in (`findstr /r "^[0-9][0-9][0-9][0-9]/" TEMP.txt`) do (
    ECHO %%b, %%c >> %LOG%

)
rem 一時ファイル削除
DEL TEMP.txt

rem *************************
rem txtファイル列分割

rem EXCELに貼り付けるときなどに
rem *************************
rem 分割したいファイル
SET INPUT_FILE=%LOG%
rem 最終アウトプット先
SET OUTPUT_FILE=split.txt
rem 分割したいファイルの列数
SET COLUMN_NUM=2

rem ----ここまで　適宜編集する-----------

SET COUNT=0
:LOOP
SET /a COUNT+=1
ECHO ----%COUNT%列目------ >> %OUTPUT_FILE%
FOR /f "usebackq skip=2 tokens=%COUNT% delims=," %%a in (`TYPE %INPUT_FILE%`) do (
    ECHO a:%%a
    ECHO %%a >> %OUTPUT_FILE%
)
IF %COUNT% equ %COLUMN_NUM% (
    GOTO END
)
GOTO LOOP

:END
PAUSE
EXIT /b