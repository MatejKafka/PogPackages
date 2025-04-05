@{
	Name = 'WinMerge'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-File "./config/WinMerge.ini"

		Export-Command "WinMergeU" "./app/WinMergeU.exe" -Arguments "/inifile", "./config/WinMerge.ini"
		Export-Shortcut "WinMerge" "./app/WinMergeU.exe" -Arguments "/inifile", "./config/WinMerge.ini"
	}
}