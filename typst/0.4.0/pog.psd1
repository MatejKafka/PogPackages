@{
	Name = 'typst'
	Architecture = 'x64'
	Version = '0.4.0'

	Install = @{
		Url = {"https://github.com/typst/typst/releases/download/v$($this.Version)/typst-x86_64-pc-windows-msvc.zip"}
		Hash = "B7C0EECD20B31DD5DA59CE715178A32CD667DE6C71A7A591E8ABB849C264B891"
	}

	Enable = {
		Export-Command typst "./app/typst.exe" -Symlink
	}
}
