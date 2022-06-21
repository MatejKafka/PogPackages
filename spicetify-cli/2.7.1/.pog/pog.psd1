@{
	Name = "spicetify-cli"
	Architecture = "x64"
	Version = "2.7.1"

	Install = @{
		Url = {"https://github.com/khanhas/spicetify-cli/releases/download/v$($this.Version)/spicetify-$($this.Version)-windows-x64.zip"}
		Hash = "28DB9BC1D7BBAD757C45898EB353847EA9AB872E61B98AB8296C716591CEBE0B"
	}

	Enable = {
		Assert-Directory "./config"
		Export-Command "spicetify" "./.pog/spicetify.cmd" -NoSymlink
	}
}
