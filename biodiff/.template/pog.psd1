@{
	Name = 'biodiff'
	Architecture = 'x64'
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/8051Enthusiast/biodiff/releases/download/v${V}/biodiff-windows-${V}.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		New-Directory "./config"

		$CmdEnv = @{BIODIFF_CONFIG_DIR = "./config"}
		Export-Command "biodiff" "./app/biodiff.exe" -VcRedist -Environment $CmdEnv
		Export-Command "git-biodiff" "./app/git-biodiff.exe" -VcRedist -Environment $CmdEnv
	}
}
