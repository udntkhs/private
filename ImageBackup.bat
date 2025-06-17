@ECHO OFF

CD /d %~dp0
REM ************************
REM イメージバックアップ
REM
REM 2025/6/17
REM
REM ************************
SET TODAY=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%
REM イメージバックアップ用パーティションを選択
REM コマンドをechoしてdiskpartにパイプ or diskpartscript作成

REM バックアップ用フォルダの作成
mkdir Q:\%TODAY%

REM イメージバックアップ
Dism /Capture-Image /ImageFile:Q:\%TODAY%\%ComputerName%_C.wim /CaptureDir:C:\ /Name:”My Windows partition”
