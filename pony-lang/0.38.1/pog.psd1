@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.38.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "46a2d21b723bc84e90c073c7a354b30ee0dd32acb35f96c8189ea2665e4d34bc"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}