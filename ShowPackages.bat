@echo off

rem ����̃p�b�P�[�W����ϐ��Ɋi�[


SET /P WORD="�����������P������:"
FOR /f "usebackq tokens=3*" %%a IN (`DISM /Online  /Get-Packages ^| FIND /i "%WORD%"`) DO (
  ECHO %%b
)
PAUSE
EXIT /b