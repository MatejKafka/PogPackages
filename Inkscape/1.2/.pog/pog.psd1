@{
	Name = "Inkscape"
	Architecture = "x64"
	Version = "1.2"
	
	Install = @{
		Url = "https://inkscape.org/gallery/item/33465/inkscape-1.2_2022-05-15_dc2aedaf03-x64_XVsf0Ph.7z"
		Hash = "4CF628A335CE76384633084ADDA3655D576A0EB073517548E64218ED07ABFBD2"
	}
	
	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./cache"

		Export-Shortcut "Inkscape" "$ManifestRoot/Inkscape-shortcut.cmd" -Icon "./app/bin/inkscape.exe"
	}
}
