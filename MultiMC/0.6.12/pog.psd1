@{
	Name = "MultiMC"
	Architecture = "x86"
	Version = "0.6.12"

	Install = @{
		Url = {"https://github.com/MultiMC/MultiMC5/releases/download/$($this.Version)/mmc-stable-win32.zip"}
		Hash = "309FFFF7D48C6F9EEB4B424B812E03A5AD11785D912FBBB7CA065AB4CDF07688"
	}

	Enable = {
		New-Directory "./data"

		Export-Shortcut "MultiMC" "./app/MultiMC.exe" -Arguments @("--dir", "./data")
	}
}
