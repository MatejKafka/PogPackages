@{
	Name = 'Windows Terminal'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		# when WT sees this marker file, it switches to a portable mode
		# https://learn.microsoft.com/en-us/windows/terminal/distributions#windows-terminal-portable
		# https://github.com/microsoft/terminal/blob/394b942a565378fb1aeee227763fae07efdca9e6/src/cascadia/TerminalSettingsModel/FileUtils.cpp#L25
		Assert-File "./app/.portable"
		Set-SymlinkedPath "./app/settings" "./config" Directory

		Export-Command "wt" "./app/wt.exe"
		Export-Shortcut "Terminal" "./app/WindowsTerminal.exe"
	}
}