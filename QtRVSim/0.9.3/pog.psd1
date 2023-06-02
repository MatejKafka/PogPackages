@{
	Name = "QtRVSim"
	Architecture = "x64"
	Version = "0.9.3"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/cvut/qtrvsim/releases/download/v${V}/qtrvsim-mingw32-v${V}.zip"}
		Hash = "0E463717AB3087EB2DF10398AD232DCE8B1CDA74FDA0F954F020D23872BB4B47"
	}
	
	Enable = {
		Assert-Directory "./data"

		Export-Shortcut "QtRVSim" "./.pog/qtrvsim_gui.cmd"
		# qtrvsim commands don't access the config, no need to override
		Export-Command "qtrvsim" "./app/qtrvsim_cli.exe"
		Export-Command "qtrvsim_cli" "./app/qtrvsim_cli.exe"
	}
}
