@{
	Name = "meson-build"
	Architecture = "x64"
	Version = "0.63.3"

	Install = @(
		@{
			Url = {$V = $this.Version; "https://github.com/mesonbuild/meson/releases/download/$V/meson-$V.tar.gz"}
			Hash = "519C0932E1A8B208741F0FDCE90AA5C0B528DD297CF337009BF63539846AC056"
			Target = "meson"
		}
		@{
			# Meson needs python, install the embeddable zip version
			Url = "https://www.python.org/ftp/python/3.11.5/python-3.11.5-embed-amd64.zip"
			Hash = "D82391A2E51C3684987C61F6B7CEDBFF3CE9FBE2E39CD948D32B0DA866544B17"
			Target = "python"
		}
	)

	Enable = {
		Export-Command "meson" "./app/python/python.exe" -Arguments (Resolve-Path "./app/meson/meson.py")
	}
}
