@{
	Name = "Wireshark"
	Architecture = "x64"

	Version = "3.6.3"

	Install = @{
		Url = {"https://2.na.dl.wireshark.org/win64/all-versions/Wireshark-win64-$($this.Version).exe"}
		Hash = "B87EE22F981C033E6A075193C2A9A4CF699EC1A5BDE7EC4851B9344A27B73EB7"
		NsisInstaller = $true
	}

	Enable = {
		Assert-Directory "./data"
		Export-Shortcut "Wireshark" "./.pog/wireshark_launcher.cmd" -Icon "./app/Wireshark.exe"
		Write-Warning "Wireshark updater currently writes to registry (HKCU/Software/Wireshark)."
	}
}
