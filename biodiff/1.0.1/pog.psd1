@{
	Name = 'biodiff'
	Architecture = 'x64'
	Version = '1.0.3'
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/8051Enthusiast/biodiff/releases/download/v${V}/biodiff-windows-${V}.zip"}
		Hash = ""
	}
	
	Enable = {
		Write-Warning "Biodiff saves the config file globally when you press the Save button in settings."
		Export-Command "biodiff" "./app/biodiff.exe" # Symlink
		Export-Command "git-biodiff" "./app/git-biodiff.exe" -NoSymlink # this one depends on biodiff.exe
	}
}
