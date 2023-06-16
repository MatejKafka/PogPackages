@{
	Name = 'innounp'
	Architecture = 'x64'
	Version = '0.50'

	Install = @{
		Url = {"https://sourceforge.net/projects/innounp/files/innounp/innounp%20$($this.Version)/innounp$($this.Version.Replace('.', '')).rar/download"}
		Hash = "1D8837540CCC15D98245A1C73FD08F404B2A7BDFE7DC9BED2FDECE818FF6DF67"
	}

	Enable = {
		Export-Command "innounp" "./app/innounp.exe" -Symlink
	}
}
