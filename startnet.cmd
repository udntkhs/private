@ECHO OFF

REM *******************************************
REM USB�̃h���C�u���^�[�����Ɛݒ��ʌďo
REM
REM 2025.06.16
REM
REM Windows PE���̉��L�Ɋi�[
REM X:\windows\system32\startnet.cmd
REM �I���W�i���̓R�s�[���ă��l�[�����邱��
REM *******************************************


REM �{�����[�����X�g�擾
REM -------------------------
ECHO list vol | diskpart > X:\VolumeList.txt


REM �{�����[�����X�g�Ǎ�
REM -------------------------
FOR /f "tokens=1,2,3,4" %%a IN (X:\VolumeList.txt) DO (
	CALL :GetVolNum %%c %%d
)


REM �h���C�u���^�[�̐ݒ�
REM ------------------------
SET D_Script=X:\diskpart_script.txt

ECHO select vol %PE_NUM% > %D_Script%
ECHO assign letter P >> %D_Script%
ECHO select vol %DATA_NUM% >> %D_Script%
ECHO assign letter T >> %D_Script%

diskpart /s %D_Script%


REM �ݒ���BAT�ďo
REM -----------------------
CD /d T:\
CALL OPMenu.bat



:*****************
:GetVolNum
:*****************

REM �����̕ϐ��ݒ�
REM ----------------
SET LNAME=%~1
SET LNUM=%~2


REM DATA���x���̎擾
REM ------------------
ECHO %LNAME% | FIND "DATA" > NUL
IF %ERRORLEVEL% equ 0 (
	SET DATA_NUM=%LNUM%
)


REM WINPE���x���̎擾
REM ------------------
ECHO %LNAME% | FIND "WINPE" > NUL
IF %ERRORLEVEL% equ 0 (
	SET PE_NUM=%LNUM%
)

EXIT /b