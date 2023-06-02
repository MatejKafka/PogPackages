@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.51.2"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "a71a0838b54eaaa14e756c58fd89dda03e93184ae3797ac95e0ddc870902006a"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}