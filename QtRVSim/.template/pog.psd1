@{
	Name = "QtRVSim"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Website = "https://github.com/cvut/qtrvsim"
	Description = "RISC-V CPU simulator for education purposes."

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		New-File "./data/qtrvsim_gui.ini"

		# qtrvsim commands don't access the config, no need to override
		Export-Command "qtrvsim" "./app/qtrvsim_cli.exe"
		Export-Command "qtrvsim_cli" "./app/qtrvsim_cli.exe"
		Export-Shortcut "QtRVSim" "./app/qtrvsim_gui.exe" -Environment @{
			QTRVSIM_CONFIG_FILE = "./data/qtrvsim_gui.ini"
		}
	}
}
