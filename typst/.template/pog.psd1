@{
	Name = 'typst'
	Architecture = 'x64'
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		Export-Command typst "./app/typst.exe" -VcRedist
	}
}
