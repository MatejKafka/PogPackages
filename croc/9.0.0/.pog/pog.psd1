@{
	Name = "croc"
	Architecture = "x64"
	Version = "9.0.0"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/schollz/croc/releases/download/v${V}/croc_${V}_Windows-64bit.zip"}
		Hash = "bba5c1d2ff17bd05c8fdb6f53b98370fa69fa2d603e9b0fa352b48aabdf1938b"
	}

	Enable = {
		Assert-Directory "./config"
		
		Export-Command "croc" "./.pog/croc_wrapper.cmd" -NoSymlink
	}
}
