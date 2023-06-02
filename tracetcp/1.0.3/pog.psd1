@{
	Name = "tracetcp"
	Architecture = "x86"
	Version = "1.0.3"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/0xcafed00d/tracetcp/releases/download/v$V/tracetcp_v$V.zip"}
		Hash = "413C7ACB5171A32AEE2D32115E6A4B10B956C3390921AA6C35F75BE1E47433E4"
	}
	
	Enable = {
		Export-Command "tracetcp" "./app/tracetcp.exe" -Symlink
	}
}
