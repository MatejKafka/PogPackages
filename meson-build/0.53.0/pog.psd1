@{
	Name = "meson-build"
	Architecture = "*"
	Version = "0.53.0"

#	Dependencies = @{
#		"ninja-build" = ">=1.10.2" # FIXME: probably needlessly high version requirement
#	}

	Install = @{
		Url = {$V = $this.Version; "https://github.com/mesonbuild/meson/releases/download/$V/meson-$V.tar.gz"}
		Hash = "035E75993AB6FA6C9EBF902B835C64CF397A763EB8E65C9BB6E1CC9730A9D3F6"
	}

	Enable = {
		# TODO: dependency on python, which is currently globally installed
		Export-Command "meson" "./.pog/meson_launcher.cmd" -NoSymlink
	}
}
