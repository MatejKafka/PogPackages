@{
	Name = 'UPX'
	Architecture = 'x64'
	Version = '4.2.3'

	Description = "UPX - the Ultimate Packer for eXecutables"
	Website = "https://upx.github.io/"

	Install = @{
		Url = {"https://github.com/upx/upx/releases/download/v$($this.Version)/upx-$($this.Version)-win64.zip"}
		Hash = "5F0458EB44EF2A9F8A3D02946E2D1382B1DAC3E4A95D4DACF662EDE567ABFC59"
	}

	Enable = {
		Export-Command "upx" "./app/upx.exe" -Symlink
	}
}