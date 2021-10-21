@{
	Name = "zig-lang"
	Architecture = "x64"
	Description = "The Zig language. This package is currently broken."

	Version = "0.8.1"

	Install = @{
		Url = {"https://ziglang.org/download/$($this.Version)/zig-windows-x86_64-$($this.Version).zip"}
		Hash = "43573db14cd238f7111d6bdf37492d363f11ecd1eba802567a172f277d003926"
	}

	Enable = {
		# FIXME: ...
		Write-Warning ("'zig cc' and 'zig c++` (and possibly other subcommands) write to LocalAppData\zig, can't seem to make it behave." +`
				"`n`tPossibly related: https://github.com/ziglang/zig/issues/5061")

		Assert-Directory "./cache"

		Export-Command "zig" "$ManifestRoot/zig_wrapper.cmd" -NoSymlink
	}
}
