@{
	Name = "fast-cli@gesquive"
	Architecture = "x64"
	Version = "0.2.10"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/gesquive/fast-cli/releases/download/v${V}/fast-cli-v${V}-windows-amd64.zip"}
		Hash = "DB9ECEDCC5D40D646DBF90BA4CE7A18EF86AEF28A07AC64721174F48B96B1948"
	}
	
	Enable = {
		Export-Command "fast-cli" "./app/fast-cli.exe" -Symlink
	}
}
