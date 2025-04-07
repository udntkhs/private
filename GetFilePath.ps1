#
# Powershellのファイルパス取得
#

#
# ERROR HANDLING
#

# 自身のあるディレクトリパス
$OWN_PATH = Split-Path $MyInvocation.MyCommand.Path -Parent
ECHO "OWN_DIRECTRY:$OWN_PATH"

#フルパス
$FileName = $MyInvocation.MyCommand.Path
ECHO "FULL PATH:$FileName"

#Drive Letter
$DRIVE_LETTER = $FileName.Substring(0, $FileName.LastIndexOf(':')+1)
ECHO "DRIVE_LETTER:$DRIVE_LETTER"

#こっちでもカレントディレクトリ取れない？
$OWN_PATH2 = $FileName.Substring(0, $FileName.LastIndexOf('\'))
ECHO "OWN_DIRECTRY=$OWN_PATH2"

# 拡張子抜き
$NO_EXTENSION = $FileName.Substring(0, $FileName.LastIndexOf('.'))

#ログのパス
$LOG = "${NO_EXTENSION}.log"
ECHO "LOG PATH: $LOG"

EXIT