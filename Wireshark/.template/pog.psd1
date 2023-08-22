@{
	Name = "Wireshark"
	Version = "{{TEMPLATE:Version}}"
	Architecture = "x64"

	# hashes can be found at https://www.wireshark.org/download/SIGNATURES-${V}.txt
	Install = @{
		Url = {"https://www.wireshark.org/download/win64/all-versions/Wireshark-win64-$($this.Version).exe"}
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
