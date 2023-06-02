@{
	Name = "QtRVSim"
	Architecture = "x64"
	Version = "0.9.4"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/cvut/qtrvsim/releases/download/v${V}/qtrvsim-mingw32-v${V}.zip"}
		Hash = "0721051463F3E2BBC56D1B8CF644B6FD448E34763A1EECC2EEA8487A1E2EDCD9"
	}
	
	Enable = {
		Assert-Directory "./data"

		Export-Shortcut "QtRVSim" "./.pog/qtrvsim_gui.cmd"
		# qtrvsim commands don't access the config, no need to override
		Export-Command "qtrvsim" "./app/qtrvsim_cli.exe"
		Export-Command "qtrvsim_cli" "./app/qtrvsim_cli.exe"
	}
}
