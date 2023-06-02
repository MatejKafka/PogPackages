@{
	Name = "zig-lang"
	Architecture = "x64"
	Description = "The Zig language. https://ziglang.org/"
	Version = "0.9.0"

	Install = @{
		Url = {"https://ziglang.org/download/$($this.Version)/zig-windows-x86_64-$($this.Version).zip"}
		Hash = "084EA2646850AAF068234B0F1A92B914ED629BE47075E835F8A67D55C21D880E"
	}

	Enable = {
		Assert-Directory "./cache"

		Export-Command "zig" "./.pog/zig_wrapper.cmd"
	}
}
