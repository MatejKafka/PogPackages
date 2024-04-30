@{
	Name = "QtRVSim"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/cvut/qtrvsim/releases/download/v${V}/qtrvsim-mingw32-v${V}.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		New-Directory "./data"

		# qtrvsim commands don't access the config, no need to override
		Export-Command "qtrvsim" "./app/qtrvsim_cli.exe"
		Export-Command "qtrvsim_cli" "./app/qtrvsim_cli.exe"
		Export-Shortcut "QtRVSim" "./app/qtrvsim_gui.exe" -Environment @{
			QTRVSIM_CONFIG_FILE = "./data/qtrvsim_gui.ini"
		}
	}
}
