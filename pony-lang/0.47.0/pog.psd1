@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.47.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "be1cd8467da81af1ece92c1d3a54c2942646a8f190feb008745f011d08145d13"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}