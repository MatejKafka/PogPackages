@{
	Name = 'ShellCheck'
	Architecture = 'x64'
	Version = '0.8.0'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/koalaman/shellcheck/releases/download/v${V}/shellcheck-v${V}.zip"}
		Hash = "2A616CBB5B15AEC8238F22C0D62DEDE1B6D155798ADC45FF4D0206395A8A5833"
	}

	Enable = {
		Export-Command "shellcheck" "./app/shellcheck.exe" -Symlink
	}
}
