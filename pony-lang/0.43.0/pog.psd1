@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.43.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "00d3bb849f29c77302aa4e143309bf3f6e57ae494379ed743fdc9f602ed994bf"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}