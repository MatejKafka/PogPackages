@{
	Name = 'biodiff'
	Architecture = 'x64'
	Version = '1.0.1'
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/8051Enthusiast/biodiff/releases/download/v${V}/biodiff-windows-${V}.zip"}
		Hash = "4CA8DA8E178A18354CED33718E2E3BFB8C4CF848DA26D4E6E7E3708ED0A2F73D"
	}
	
	Enable = {
		Write-Warning "Biodiff saves the config file globally when you press the Save button in settings."
		Export-Command "biodiff" "./app/biodiff.exe" # Symlink
		Export-Command "git-biodiff" "./app/git-biodiff.exe" -NoSymlink # this one depends on biodiff.exe
	}
}
