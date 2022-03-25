@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.44.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "80e07d03179ecc5dbf78a2f4b6f98bd512799d1bf5bd9a643e3dc1aa96a7c8a5"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}