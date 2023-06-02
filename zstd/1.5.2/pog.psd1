@{
	Name = "zstd"
	Architecture = "x64"
	Version = "1.5.2"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/facebook/zstd/releases/download/v${V}/zstd-v${V}-win64.zip"}
		Hash = "68897CD037EE5E44C6D36B4DBBD04F1CC4202F9037415A3251951B953A257A09"
	}
	
	Enable = {
		Export-Command "zstd" "./app/zstd.exe" -Symlink
	}
}
