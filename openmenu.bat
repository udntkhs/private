@ECHO OFF

CD /d %~dp0
REM ************************
REM PE起動時のスタート画面
REM
REM 2025/6/16
REM
REM ************************

:OPView
CLS
ECHO.
ECHO **************************
ECHO	　実行内容を選択
ECHO **************************
ECHO [1]バックアップ作成
ECHO [2]イメージ適用
ECHO [3]cmd
ECHO [9]シャットダウン


SET /p SELECT_NUM="番号を入力>"

IF "%SELECT_NUM%" equ "9" (
	GOTO :PE_END
)

IF "%SELECT_NUM%" equ "3" (
	cmd.exe
)



:PE_END
SET /p Y_or_N="シャットダウンを実行します(y[Y]/n[N])"
IF /i %Y_or_N% neq "y" (
	GOTO :OPView
)

WPEUTIL shutdown
PAUSE


