@{
	Name = 'typst'
	Architecture = 'x64'
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = {"https://github.com/typst/typst/releases/download/v$($this.Version)/typst-x86_64-pc-windows-msvc.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		Export-Command typst "./app/typst.exe" -Symlink
	}
}
