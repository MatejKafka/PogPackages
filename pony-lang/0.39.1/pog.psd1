@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.39.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "bce9e5403b66fa5642ecb42a07b9e125d40fe1b86b14d2f2946ac9274ecf2138"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}