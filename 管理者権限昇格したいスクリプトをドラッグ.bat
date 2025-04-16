@ECHO OFF
rem ŠÇ—ŽÒŒ ŒÀ¸Ši
WHOAMI /priv | find "SeDebugPrivi;ege" > nul
IF %ERRORLEVEL% neq 0 (
  Powershell Start-Process "%~1" -Verb runas
)
EXIT /b
