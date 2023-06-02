@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.52.2"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "b539de01ea58b170a878c70db88b47aa91db2b308f3fba21c45419bb33801beb"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}