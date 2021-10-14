@{
	Name = "croc"
	Architecture = "x64"

	Version = "9.0.0"
	_Hash = "bba5c1d2ff17bd05c8fdb6f53b98370fa69fa2d603e9b0fa352b48aabdf1938b"

	Install = {
		$Version = $this.Version
		$Url = "https://github.com/schollz/croc/releases/download/v${Version}/croc_${Version}_Windows-64bit.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}

	Enable = {
		Assert-Directory "./config"
		
		Export-Command "croc" "./.manifest/croc_wrapper.cmd" -NoSymlink
	}
}
