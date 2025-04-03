# **************************
# ���W�X�g���̒l���ċA�擾
#
# ���W�X�g���p�X�̓R���s���[�^�[\�ȍ~�����
# **************************

# -------------
# �ϐ��ݒ�
# -------------

# �o�̓t�@�C����
$OutputFileName = "$env:UserProfile\Desktop\RegList.csv"


# -------------
# ����
# -------------

# �X�N���v�g���g�̏ꏊ�Ɉړ�
$OwnPath = $MyInvocation.MyCommand.Path
Split-Path -Parent $OwnPath

# �����擾���������W�X�g������͂�����
$RegPath = Read-Host "���ׂ������W�X�g���̃p�X�����"

# ���W�X�g���̃��X�g
$RegList = @()

# ���W�X�g�����擾
$RegInfo = Get-ChildItem -Path Registry::$RegPath -Recurse

# �T�u�L�[�̏��擾
# �ċA�őS�L�[���擾���Ă���͂��Ȃ̂Ŋe$RegInfo.Name�ɑ΂��Ēl���擾���Ă���
foreach ($RegKey in $RegInfo.Name){

	# KeyPath�̎擾
		$KeyPath = $RegKey

	# �l�̎擾
		$SubRegKey = Get-Item -Path Registry::$RegKey

	# SubRegKey.Name:�z���̃L�[�ASubRegKey.Property:�l�̖��O
	# �l�̖��O�ɑ΂��ă��\�b�h�Ŏ�ނƒl���擾
	foreach ($Value in $SubRegKey.Property){

		# ���
			$ValueType = $SubRegKey.GetValueKind($Value)
		# �l
			$ValueData = $SubRegKey.GetValue($Value)

		# RegListItem�͖��x���������K�v
			$RegListItem = New-Object psobject | Select-Object KeyPath,ValueName,Type,Data	

		# �擾�����l��z��ɃZ�b�g
			$RegListItem.KeyPath = $KeyPath
			$RegListItem.ValueName = $Value
			$RegListItem.Type = $ValueType
			$RegListItem.Data = $ValueData
		
		# �J�X�^���I�u�W�F�N�g�ɗv�f��ǉ�
			$RegList += $RegListItem


	}
}

# ���X�g�o��
$RegList | Export-Csv $OutputFileName -Encoding Default 

# �I��
EXIT