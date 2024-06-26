@{
	Name = "Qalculate"
	Architecture = "x86"
	Version = "3.20.1"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/Qalculate/qalculate-gtk/releases/download/v${V}/qalculate-${V}-i386.zip"}
		Hash = "E82CF15D322C496970752559DD45AFFB7D636B812E95A2DCDE711F8573E12EA9"
	}

	Enable = {
		New-Symlink "./app/user" "./data" Directory

		Export-Command qalc "./app/qalc.exe"
		Export-Shortcut "Qalculate (Basic)" "./app/qalculate.exe"
		Export-Shortcut "Qalculate (Console)" "./app/qalculate-qt.exe"
	}
}
