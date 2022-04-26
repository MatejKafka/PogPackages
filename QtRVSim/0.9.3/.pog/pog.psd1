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

		Export-Shortcut "QtRVSim" "$ManifestRoot/qtrvsim_gui.cmd"
		Export-Command "qtrvsim" "./app/qtrvsim_cli.exe" -NoSymlink
		Export-Command "qtrvsim_cli" "./app/qtrvsim_cli.exe" -NoSymlink
	}
}
