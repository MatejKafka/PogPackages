@{
	Name = "QtRVSim"
	Architecture = "x64"
	Version = "0.9.5"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/cvut/qtrvsim/releases/download/v${V}/qtrvsim-mingw32-v${V}.zip"}
		Hash = "1B0D1B0E32F4449472859DBC79F0BF7C0A7322DA50711A6EA6600268B24F0574"
	}
	
	Enable = {
		Assert-Directory "./data"

		Export-Shortcut "QtRVSim" "./.pog/qtrvsim_gui.cmd" -Icon "./app/qtrvsim_gui.exe"
		# qtrvsim commands don't access the config, no need to override
		Export-Command "qtrvsim" "./app/qtrvsim_cli.exe"
		Export-Command "qtrvsim_cli" "./app/qtrvsim_cli.exe"
	}
}
