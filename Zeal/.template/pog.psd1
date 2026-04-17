@{
	Name = 'Zeal'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	NonPortablePaths = @(
		# seems that Qt writes here before the path override used by Zeal takes effect
		"~/AppData/Local/Zeal"
	)

	Enable = {
		New-Symlink "./app/zeal.ini" "./data/zeal.ini" File
		New-Symlink "./app/docsets" "./data/docsets" Directory
		New-Symlink "./app/cache" "./cache" Directory

		# need to override working dir due to https://github.com/zealdocs/zeal/issues/1768,
		#  since shortcuts launched through the Start Menu default to System32 working dir
		Export-Shortcut Zeal "./app/zeal.exe" -VcRedist -WorkingDirectory "./app"
	}
}
