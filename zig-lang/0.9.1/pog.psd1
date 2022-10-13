@{
	Name = "zig-lang"
	Architecture = "x64"
	Description = "The Zig language. https://ziglang.org/"
	Version = "0.9.1"

	Install = @{
		Url = {"https://ziglang.org/download/$($this.Version)/zig-windows-x86_64-$($this.Version).zip"}
		Hash = "443DA53387D6AE8BA6BAC4B3B90E9FEF4ECBE545E1C5FA3A89485C36F5C0E3A2"
	}

	Enable = {
		Assert-Directory "./cache"

		Export-Command "zig" "./.pog/zig_wrapper.cmd" -NoSymlink
	}
}
