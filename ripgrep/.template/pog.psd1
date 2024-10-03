@{
	Name = "ripgrep"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/BurntSushi/ripgrep/releases/download/$V/ripgrep-$V-x86_64-pc-windows-msvc.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Export-Command "ripgrep" "./app/rg.exe" -Symlink
		Export-Command "rg" "./app/rg.exe" -Symlink
	}
}
