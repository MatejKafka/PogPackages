@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.37.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "dacfafef5fc286abd3e2e71eb17b8b30d2f6e8c906f21c5063a45e8179555a84"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}