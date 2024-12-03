@{
	Name = "Alacritty"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Website = "https://alacritty.org/"
	Description = @"
Alacritty is a modern terminal emulator that comes with sensible defaults, but allows for extensive configuration.
By integrating with other applications, rather than reimplementing their functionality, it manages to provide
a flexible set of features with high performance. The supported platforms currently consist of BSD, Linux, macOS and Windows.

Note that Alacritty typically does not work in virtual machines, due to missing OpenGL hardware support.
"@

	Install = @(
		@{
			Url = "{{TEMPLATE:Url}}"
			Hash = "{{TEMPLATE:Hash}}"
			NoArchive = $true
			Target = "Alacritty.exe"
		}
	)

	Enable = {
		$ConfigExtension = & $this._GetConfigFileExtension
		$ConfigPath = "./config/alacritty.$ConfigExtension"

		New-File $ConfigPath

		Export-Shortcut "Alacritty" "./app/Alacritty.exe" `
			-Arguments @("--config-file", $ConfigPath) `
			-VcRedist

		Export-Command "alacritty" "./app/Alacritty.exe" `
			-Arguments @("--config-file", $ConfigPath) `
			-VcRedist
	}

	# Alacritty 0.13.0 switched to a TOML config file and provides a migration subcommand, which is a royal pain to handle
	_GetConfigFileExtension = {
		$ConfigExtension = if ([Pog.PackageVersion]$this.Version -ge "0.13.0-rc1") {"toml"} else {"yml"}

		$YmlPath = "./config/alacritty.yml"
		$TomlPath = "./config/alacritty.toml"

		if ($ConfigExtension -eq "yml" -and (Test-Path $TomlPath)) {
			Write-Warning ("Alacritty config directory contains a TOML config file, likely from a newer Alacritty version, " +`
				"which is not supported by the currently installed version and will be ignored.")
		}

		if ($ConfigExtension -eq "toml" -and (Test-Path $YmlPath)) {
			if ((gi $YmlPath).Length -eq 0) {
				# config file is empty (created by default), silently remove it
				rm $YmlPath
			} elseif (Test-Path $TomlPath) {
				Write-Warning ("Alacritty config directory ('$(Resolve-Path "./config")') contains both a YAML and a TOML config file, " +`
					"likely due to an automatic migration. The YAML file will be ignored.")
			} else {
				# I'm not entirely really happy with this, but don't see any better easy-to-implement option
				Write-Warning ("Alacritty moved to a TOML config file format since v0.13.0. The existing YAML " +`
					"config file at '$(Resolve-Path $YmlPath)' will continue to work for now. To migrate to the " +`
					"new format and re-configure the package to use it, run the following two commands:`n" +`
					"  > alacritty migrate --config-file `"$(Resolve-Path $YmlPath)`" | Out-String`n" +`
					"  > Enable-Pog `"$(Split-Path -Leaf $PWD)`"")
				$ConfigExtension = "yml"
			}
		}

		return $ConfigExtension
	}
}