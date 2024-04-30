@{
	Name = 'Jujutsu'
	Architecture = 'x64'
	Version = '0.8.0'

	Description = "A Git-compatible DVCS that is both simple and powerful"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/martinvonz/jj/releases/download/v${V}/jj-v${V}-x86_64-pc-windows-msvc.zip"}
		Hash = "40EEE4C9CD17201A0CB366D9EAA5EE96FF9C19B9376BB9548AB2CE479E475568"
	}

	Enable = {
		New-File "./config/jjconfig.toml"

		Export-Command "jj" "./app/jj.exe" -Environment @{JJ_CONFIG = "./config/jjconfig.toml"} -VcRedist
	}
}
