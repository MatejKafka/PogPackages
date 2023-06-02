@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.54.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "940ea39b4499e8002cf9cfbbaf56e1ab63e6db051156a685a81b1b74514157cd"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}