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
		Write-Warning "jPDF Tweak uses an external Java installation."

		# FIXME: the javaw lookup is not nice
		Export-Shortcut "jPDF Tweak" (Get-Command javaw).Path -Icon "./app/icon.ico" `
			-Arguments @("-jar", "./app/jpdftweak.jar") `
			-Environment @{
				# the app dir must be added to PATH, otherwise the program won't find the jmupdf64.dll library
				PATH = "./app", "%PATH%"
			}
	}
}
