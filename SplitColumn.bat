@ECHO OFF
cd /d %~dp0

rem ****************************
rem TXT�t�@�C���̗񕪊�
rem ****************************
rem ------------�ϐ��ݒ�-------------

rem �����������t�@�C��
SET INPUT_FILE=AbstractDIR.log
rem ���O�o�͐�
SET LOG="%~dn0.log"
rem �����������t�@�C���̗�
SET /P ROW_MAX=�����������t�@�C���̗�:

rem ----�����܂Ł@�K�X�ҏW����-----------

SET COUNT=0
:LOOP
SET /a COUNT+=1
ECHO ----%COUNT%���------ >> %LOG%
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