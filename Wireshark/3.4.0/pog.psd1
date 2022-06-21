@{
	Name = "Wireshark"
	Architecture = "x64"

	Version = "3.4.0"

	Install = @{
		Url = {"https://2.na.dl.wireshark.org/win64/all-versions/Wireshark-win64-$($this.Version).exe"}
		Hash = "32113E083409DE888468E0BFE74BA98E6D618F9685A56A06F15B0506FDF4E462"
	}

	Enable = {
		Assert-Directory "./data"
		Export-Shortcut "Wireshark" "./.pog/wireshark_launcher.cmd" -Icon "./app/Wireshark.exe"
		Write-Warning "Wireshark updater currently writes to registry (HKCU/Software/Wireshark)."
	}
}
