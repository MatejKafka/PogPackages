@{
	Name = "Alacritty"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Description = @"
Alacritty is a modern terminal emulator that comes with sensible defaults, but allows for extensive configuration.
By integrating with other applications, rather than reimplementing their functionality, it manages to provide
a flexible set of features with high performance. The supported platforms currently consist of BSD, Linux, macOS and Windows.

Note that Alacritty typically does not work in virtual machines, due to missing OpenGL hardware support.
"@

	Install = @(
		@{
			Url = "{{TEMPLATE:ExeUrl}}"
			Hash = "{{TEMPLATE:ExeHash}}"
			NoArchive = $true
			Target = "Alacritty.exe"
		}
		@{
			Url = "{{TEMPLATE:ConfigUrl}}"
			Hash = "{{TEMPLATE:ConfigHash}}"
			NoArchive = $true
			Target = "alacritty-default.yml"
		}
	)

	Enable = {
		# if config file does not exist, use the default one
		New-File "./config/alacritty.yml" "./app/alacritty-default.yml"

		Export-Shortcut "Alacritty" "./app/Alacritty.exe" `
			-Arguments @("--config-file", "./config/alacritty.yml") `
			-VcRedist
	}
}