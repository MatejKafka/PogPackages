@{
	Name = "jPDF Tweak"
	Architecture = "x64"
	Version = "1.1"
	
	Install = @{
		Url = "https://sourceforge.net/projects/jpdftweak/files/jpdftweak/jpdftweak-1.1/jpdftweak-windows-x64-1.1.zip/download"
		Hash = "965153FB5A76B4545B77E57A6216C4F0B239E310A18132640E8A0A42A0A2B96D"
		UserAgent = "Wget"
	}
	
	Enable = {
		Export-Shortcut "jPDF Tweak" "$ManifestRoot/jPDF Tweak.cmd" -Icon "./app/icon.ico"
	}
}
