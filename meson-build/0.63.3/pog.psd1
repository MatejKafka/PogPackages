@{
	Name = "meson-build"
	Architecture = "*"
	Version = "0.63.3"

#	Dependencies = @{
#		"ninja-build" = ">=1.10.2" # FIXME: probably needlessly high version requirement
#	}

	Install = @{
		Url = {$V = $this.Version; "https://github.com/mesonbuild/meson/releases/download/$V/meson-$V.tar.gz"}
		Hash = "519C0932E1A8B208741F0FDCE90AA5C0B528DD297CF337009BF63539846AC056"
	}

	Enable = {
		# TODO: dependency on python, which is currently globally installed
		Export-Command "meson" "./.pog/meson_launcher.cmd"
	}
}
