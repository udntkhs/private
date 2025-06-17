@ECHO OFF

CD /d %~dp0
REM ************************
REM イメージバックアップ
REM
REM 2025/6/17
REM
REM ************************

REM イメージバックアップ用パーティションを選択
REM コマンドをechoしてdiskpartにパイプ or diskpartscript作成


REM イメージバックアップ
Dism /Capture-Image /ImageFile:C:\my-windows-partition.wim /CaptureDir:C:\ /Name:”My Windows partition”