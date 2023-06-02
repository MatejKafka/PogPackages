@{
	Name = "ripgrep"
	Architecture = "x64"
	Version = "13.0.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/BurntSushi/ripgrep/releases/download/$V/ripgrep-$V-x86_64-pc-windows-msvc.zip"}
		Hash = "A47ACE6F654C5FFA236792FC3EE3FEFD9C7E88E026928B44DA801ACB72124AA8"
	}
	
	Enable = {
		Export-Command "ripgrep" "./app/rg.exe" -Symlink
		Export-Command "rg" "./app/rg.exe" -Symlink
	}
}
