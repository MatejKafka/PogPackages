@{
	Name = "zig-lang"
	Architecture = "x64"
	Description = "The Zig language. https://ziglang.org/"
	Version = "0.10.0"

	Install = @{
		Url = {"https://ziglang.org/download/$($this.Version)/zig-windows-x86_64-$($this.Version).zip"}
		Hash = "A66E2FF555C6E48781DE1BCB0662EF28EE4B88AF3AF2A577F7B1950E430897EE"
	}

	Enable = {
		Assert-Directory "./cache"

		Export-Command "zig" "./.pog/zig_wrapper.cmd" -NoSymlink
	}
}
