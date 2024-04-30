@{
	Name = "ngrok"
	Version = "2.3.40"
	Architecture = "x64"

	# https://dl.equinox.io/ngrok/ngrok/stable/archive
	Install = @{
		Url = "https://bin.equinox.io/a/8exBtGpBr59/ngrok-2.3.40-windows-amd64.zip"
		Hash = "778cbe4d5f1c868a5687a97206bf39b017a76fc44eaead95a11cf8a415c2e505"
	}

	Enable = {
		New-Directory "./config"
		New-File "./config/ngrok.yml"

		Export-Command "ngrok" "./.pog/ngrok_wrapper.cmd"
	}
}
