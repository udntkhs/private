@ECHO OFF

CD /d %~dp0
REM ************************
REM PE�N�����̃X�^�[�g���
REM
REM 2025/6/16
REM
REM ************************

:OPView
CLS
ECHO.
ECHO **************************
ECHO	�@���s���e��I��
ECHO **************************
ECHO [1]�o�b�N�A�b�v�쐬
ECHO [2]�C���[�W�K�p
ECHO [3]cmd
ECHO [9]�V���b�g�_�E��


SET /p SELECT_NUM="�ԍ������>"

IF "%SELECT_NUM%" equ "9" (
	GOTO :PE_END
)

IF "%SELECT_NUM%" equ "3" (
	cmd.exe
)



:PE_END
SET /p Y_or_N="�V���b�g�_�E�������s���܂�(y[Y]/n[N])"
IF /i %Y_or_N% neq "y" (
	GOTO :OPView
)

WPEUTIL shutdown
PAUSE


