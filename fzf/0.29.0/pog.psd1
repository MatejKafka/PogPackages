@{
	Name = "fzf"
	Architecture = "x64"
	Version = "0.29.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/junegunn/fzf/releases/download/${V}/fzf-${V}-windows_amd64.zip"}
		Hash = "F0797CEEE089017108C80B09086C71B8EEC43D4AF11CE939B78B1D5CFD202540"
	}
	
	Enable = {
		Export-Command "fzf" "./app/fzf.exe" -Symlink
	}
}
