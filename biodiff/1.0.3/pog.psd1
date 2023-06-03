@{
	Name = 'biodiff'
	Architecture = 'x64'
	Version = '1.0.3'
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/8051Enthusiast/biodiff/releases/download/v${V}/biodiff-windows-${V}.zip"}
		Hash = "F6D56EE920E235C32BFAD0154E5FE75EC31F42EEE7A5CBFC7D5614893C12EAF2"
	}
	
	Enable = {
		Assert-Directory "./config"

		$CmdEnv = @{BIODIFF_CONFIG_DIR = "./config"}
		Export-Command "biodiff" "./app/biodiff.exe" -Environment $CmdEnv
		Export-Command "git-biodiff" "./app/git-biodiff.exe" -Environment $CmdEnv
	}
}
