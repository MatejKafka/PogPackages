@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.38.3"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "666cd95bcd2adbea021949b6e12ee80b88396369fbbaa11c5980e8332a0548f9"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}