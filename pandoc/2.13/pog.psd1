@{
	Name = "pandoc"
	Architecture = "x64"
	Version = "2.13"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/jgm/pandoc/releases/download/${V}/pandoc-${V}-windows-x86_64.zip"}
		Hash = "C7A0523464AEE871EE8CEB387E87DD50AC8BF61974F50EC45946DF34BC7F7DC6"
	}
	
	Enable = {
		Export-Command "pandoc" "./app/pandoc.exe" -Symlink
	}
}
