@ECHO OFF

cd /d %~dp0

powershell -ExecutionPolicy RemoteSigned -File %1

PAUSE

EXIT /b 