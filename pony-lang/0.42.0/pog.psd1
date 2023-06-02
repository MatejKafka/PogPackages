@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.42.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "e3ddd6f061358497f14cd02b0e888642927bbe8f6fbae02ee313b362fba0d979"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}