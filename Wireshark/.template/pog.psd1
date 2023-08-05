@{
	Name = "Wireshark"
	Version = "{{TEMPLATE:Version}}"
	Architecture = "x64"

	Install = @{
		Url = {"https://2.na.dl.wireshark.org/win64/all-versions/Wireshark-win64-$($this.Version).exe"}
		Hash = "{{TEMPLATE:Hash}}"
		NsisInstaller = $true
	}

	Enable = {
		Write-Warning "Wireshark updater currently writes to registry (HKCU/Software/Wireshark)."

		Assert-Directory "./data"

		Export-Shortcut "Wireshark" "./app/Wireshark.exe" `
			-Arguments @("-o", "gui.update.enabled:FALSE") `
			-Environment @{WIRESHARK_CONFIG_DIR = "./data"}
	}
}
