@{
	Name = "spicetify-cli"
	Architecture = "x64"
	Version = "2.10.1"

	Install = @{
		Url = {"https://github.com/khanhas/spicetify-cli/releases/download/v$($this.Version)/spicetify-$($this.Version)-windows-x64.zip"}
		Hash = "5765E644A1EA5F890DC7301B46E74AE9CF94A67BFF1AD8CC0F239D656E14FDAA"
	}

	Enable = {
		Assert-Directory "./config"

		Export-Command "spicetify" "./app/spicetify.exe" -Environment @{
			SPICETIFY_CONFIG = "./config"
		}
	}
}
