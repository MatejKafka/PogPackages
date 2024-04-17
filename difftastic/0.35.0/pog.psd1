@{
	Name = 'difftastic'
	Architecture = 'x64'
	Version = '0.35.0'
	
	Install = @{
		Url = {"https://github.com/Wilfred/difftastic/releases/download/$($this.Version)/difft-x86_64-pc-windows-msvc.zip"}
		Hash = "0E580CCB840893B5D4C39C805613304BEEEB35E8B2F8BDFB2A37A8D7A1D7EE87"
	}
	
	Enable = {
		Export-Command "difft" "./app/difft.exe" -VcRedist
	}
}
