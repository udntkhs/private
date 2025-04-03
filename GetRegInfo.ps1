# **************************
# レジストリの値を再帰取得
#
# レジストリパスはコンピューター\以降を入力
# **************************

# -------------
# 変数設定
# -------------

# 出力ファイル名
$OutputFileName = "$env:UserProfile\Desktop\RegList.csv"


# -------------
# 処理
# -------------

# スクリプト自身の場所に移動
$OwnPath = $MyInvocation.MyCommand.Path
Split-Path -Parent $OwnPath

# 情報を取得したいレジストリを入力させる
$RegPath = Read-Host "調べたいレジストリのパスを入力"

# レジストリのリスト
$RegList = @()

# レジストリ情報取得
$RegInfo = Get-ChildItem -Path Registry::$RegPath -Recurse

# サブキーの情報取得
# 再帰で全キーを取得しているはずなので各$RegInfo.Nameに対して値を取得していく
foreach ($RegKey in $RegInfo.Name){

	# KeyPathの取得
		$KeyPath = $RegKey

	# 値の取得
		$SubRegKey = Get-Item -Path Registry::$RegKey

	# SubRegKey.Name:配下のキー、SubRegKey.Property:値の名前
	# 値の名前に対してメソッドで種類と値を取得
	foreach ($Value in $SubRegKey.Property){

		# 種類
			$ValueType = $SubRegKey.GetValueKind($Value)
		# 値
			$ValueData = $SubRegKey.GetValue($Value)

		# RegListItemは毎度初期化が必要
			$RegListItem = New-Object psobject | Select-Object KeyPath,ValueName,Type,Data	

		# 取得した値を配列にセット
			$RegListItem.KeyPath = $KeyPath
			$RegListItem.ValueName = $Value
			$RegListItem.Type = $ValueType
			$RegListItem.Data = $ValueData
		
		# カスタムオブジェクトに要素を追加
			$RegList += $RegListItem


	}
}

# リスト出力
$RegList | Export-Csv $OutputFileName -Encoding Default 

# 終了
EXIT