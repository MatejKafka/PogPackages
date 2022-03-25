@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.45.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "7d63633906c99846ce04d95c6a6f211c27a2afd7c6db9aa6f355ce0f42b902dd"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}