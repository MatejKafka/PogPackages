@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.52.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "9613953e23f86c14035dfa76ee8c6a44d2503522987eca8c516c0f00f4bff34e"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}