@{
	Name = "zig-lang"
	Architecture = "x64"
	Description = "The Zig language. https://ziglang.org/"
	Version = "0.8.0"

	Install = @{
		Url = {"https://ziglang.org/download/$($this.Version)/zig-windows-x86_64-$($this.Version).zip"}
		Hash = "8580FBBF3AFB72E9B495C7F8AEAC752A03475AE0BBCF5D787F3775C7E1F4F807"
	}

	Enable = {
		Assert-Directory "./cache"

		Export-Command "zig" "./.pog/zig_wrapper.cmd" -NoSymlink
	}
}
