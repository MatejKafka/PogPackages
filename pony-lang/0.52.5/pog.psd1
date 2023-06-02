@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.52.5"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "1419cd5956bac4175c0ff376b3597e4fa8baa11ae4dc9745aee544f6baeeff65"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}