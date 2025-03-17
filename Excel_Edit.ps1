#
# EXCEL�������񒊏o
#

# EXCEL


# ***************???******************
# EXCEL FILE PATH
$EXCEL_FILE = "D:\Script\PowerShell_CSV_Control\DATAforTEST.xlsx"

# EXCEL SHEET NAME
$SHEET_NAME = "sheet1"
# *************************************

# MOVE TO SCRIPT LOCATION
$OWN_PATH = $MyInvocation.MyCommand.PATH
$OWN_LOCATION = $OWN_PATH.Substring(0,$OWN_PATH.LastIndexOf('\'))
Set-Location "$OWN_LOCATION"

$LOG = "$OWN_PATH.Substring(0, $OWN_PATH.LastIndexOf('.')).log"

# COM OBJECT
$EXCEL = New-Object -ComObject Excel.Application

# VISICLE SETTING
$EXCEL.Visible = $false

# OPEN FILE
$BOOK = $EXCEL.Workbooks.Open($EXCEL_FILE, 0, $true)

# OPEN SHEET
$SHEET = $BOOK.Workbooks.Item($SHEET_NAME)
#  ERROR:You cannot call a method on a null-valued expression.

# SLECT CELL
$Column1 = $SHEET.Range("A3:A6")
#  ERROR:You cannot call a method on a null-valued expression.
$Column1 | % {$_.Text} > $LOG
# �t�@�C�����A�f�B���N�g�����A�܂��̓{�����[�� ���x���̍\�����Ԉ���Ă��܂��B : 'D:\Script\PowerShell_CSV_Control\Excel_Edit.ps1.Substring(0, D:\Script\PowerShell_CSV_Control\Excel_Edit.ps1.LastIndexOf('.')).log'.
# END
$EXCEL.QUIT()

# Process 
$EXCEL = $Null
[GC]::collect()