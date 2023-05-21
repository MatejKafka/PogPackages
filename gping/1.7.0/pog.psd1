@{
	Name = 'gping'
	Architecture = 'x64'
	Version = '1.7.0'

	Install = @{
		Url = {"https://github.com/orf/gping/releases/download/gping-v$($this.Version)/gping-Windows-x86_64.zip"}
		Hash = "E6B3FC273F880E58C6A0BDFF86AE207C9F5A48D230A052073A2CEAC5B86F2B59"
	}

	Enable = {
		Export-Command gping "./app/gping.exe" -Symlink
	}
}
