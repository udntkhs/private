@ECHO OFF
cd /d %~dp0
rem ***************************
rem dir結果からファイルパスと容量抽出
rem
rem     CSV出力もしたい
rem ***************************
rem ログファイル
SET LOG="%~dn0.log"

rem ***************************
rem MAIN PROCESS
rem ***************************
ECHO [%Date% %Time%]START > %LOG%
ECHO ------------------------------ >> %LOG%
ECHO. >> %LOG%
ECHO [CURRENT DIRECTORY] >> %LOG%
ECHO %~dp0 >> %LOG%
ECHO ------------------------------ >> %LOG%
ECHO. >> %LOG%

rem ディレクトリ、ファイル名、容量の抽出
FOR /f "usebackq skip=5 tokens=1,3,4" %%n in (`dir *.bat *.txt`) do (
    ECHO %%n %~dp0%%p                      %%o >> TEMP.txt
    ECHO n:%%n p:%~dp0%%p o:%%o
)
ECHO PATH                                                    Volume[byte] >> %LOG%
ECHO --------------------------------------------------      ------------ >> %LOG%
rem 正規表現[0-9]{4}は使えないっぽい
FOR /f "usebackq tokens=1-3" %%a in (`findstr /r "^[0-9][0-9][0-9][0-9]/" TEMP.txt`) do (
    ECHO %%b                        %%c >> %LOG%

)
rem 一時ファイル削除
DEL TEMP.txt

ECHO ------------------------------ >> %LOG%
ECHO. >> %LOG%
ECHO [%Date% %Time%]END >> %LOG%

EXIT /b