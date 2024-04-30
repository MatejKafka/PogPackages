@{
	Name = 'gdb@ssbssa'
	Architecture = 'x64'
	Version = '13.2.90.20230528'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/ssbssa/gdb/releases/download/gdb-${V}/gdb-${V}-x86_64-python.7z"}
		Hash = "A7B44DFD1156A5644257AB761C79125C48CA78345FF145EB77B0BC438D47A590"
	}

	Enable = {
		param(
			# If passed, do not override well-known environment variables (XDG_CONFIG_HOME and INPUTRC),
			# which could change the behavior of the debugged program.
			[switch]$NoEnvModifications
		)

		$Env = $null
		if (-not $NoEnvModifications) {
			New-File "./config/gdb/gdbearlyinit"
			New-File "./config/gdb/gdbinit"
			New-File "./config/.inputrc"
			$Env = @{
				XDG_CONFIG_HOME = "./config"
				INPUTRC = "./config/.inputrc"
			}
		}

		Export-Command gdbserver "./app/bin/gdbserver.exe" -Symlink
		Export-Command gdb "./app/bin/gdb.exe" -Environment $Env
	}
}