@{
	Name = "Wireshark"
	Architecture = "x64"

	Version = "4.0.2"

	Install = @{
		Url = {"https://2.na.dl.wireshark.org/win64/all-versions/Wireshark-win64-$($this.Version).exe"}
		Hash = "BAFC2B00CE557CC531DFBB0E87CDA6277C052A32411E10DA8005C4001438D8FC"
		NsisInstaller = $true
	}

	Enable = {
		Assert-Directory "./data"
		Export-Shortcut "Wireshark" "./.pog/wireshark_launcher.cmd" -Icon "./app/Wireshark.exe"
		Write-Warning "Wireshark updater currently writes to registry (HKCU/Software/Wireshark)."
	}
}
