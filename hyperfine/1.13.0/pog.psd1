@{
	Name = "hyperfine"
	Architecture = "x64"
	Version = "1.13.0"
	
	Install = @{
		Url = "https://github.com/sharkdp/hyperfine/releases/download/v1.13.0/hyperfine-v1.13.0-x86_64-pc-windows-msvc.zip"
		Hash = "555AF098497AFE86E8284DA95CEC50768F865C83B8A26AB204C61088FF8898FE"
	}
	
	Enable = {
		Export-Command "hyperfine" "./app/hyperfine.exe" -VcRedist
	}
}
