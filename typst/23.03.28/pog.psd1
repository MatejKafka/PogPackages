@{
	Name = 'typst'
	Architecture = 'x64'
	Version = '23.03.28'

	Install = @{
		Url = {"https://github.com/typst/typst/releases/download/v$($this.Version.Replace(".", "-"))/typst-x86_64-pc-windows-msvc.zip"}
		Hash = "591E8357F3D06A09BB8865643C33E4A7C7EFA6E44C06E6FE494E3684A6BC813E"
	}

	Enable = {
		Export-Command typst "./app/typst.exe" -Symlink
	}
}
