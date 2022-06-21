@{
	Name = "Inkscape"
	Architecture = "x64"
	Version = "1.1.2"
	
	Install = @{
		Url = "https://inkscape.org/gallery/item/31732/inkscape-1.1.2_2022-02-05_b8e25be833-x64.7z"
		Hash = "0DC5A131EA25C1A642CF39E162E4FF923BFB22552C2D62F1E2C955CED09CEAB1"
	}
	
	Enable = {
		Assert-Directory "./data"
		Assert-Directory "./cache"

		Export-Shortcut "Inkscape" "./.pog/Inkscape-shortcut.cmd" -Icon "./app/bin/inkscape.exe"
	}
}
