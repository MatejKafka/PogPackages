@{
	Name = "meson-build"
	Architecture = "*"
	Version = "0.60.0"

#	Dependencies = @{
#		"ninja-build" = ">=1.10.2" # FIXME: probably needlessly high version requirement
#	}

	Install = @{
		Url = {$V = $this.Version; "https://github.com/mesonbuild/meson/releases/download/$V/meson-$V.tar.gz"}
		Hash = "080D68B685E9A0D9C9BB475457E097B49E1D1A6F750ABC971428A8D2E1B12D47"
	}

	Enable = {
		# TODO: dependency on python, which is currently globally installed
		Export-Command "meson" "./.pog/meson_launcher.cmd"
	}
}
