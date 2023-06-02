@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.52.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "62dea260593aa191555604441de9a4cae11b8d2e9dfb911d55a0f1aa49f12a56"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}