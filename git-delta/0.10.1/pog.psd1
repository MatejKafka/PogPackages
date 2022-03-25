@{
	Name = "git-delta"
	Architecture = "x64"
	Version = "0.10.1"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/dandavison/delta/releases/download/${V}/delta-${V}-x86_64-pc-windows-msvc.zip"}
		Hash = "B1E6E282242F87E660D639214478A3134E8E309FA99D2E0D2EE69D1FA0A8F61D"
	}

	Enable = {
		Export-Command "delta" "./app/delta.exe" # symlink
	}
}