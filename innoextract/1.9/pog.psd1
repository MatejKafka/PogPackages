@{
	Name = 'innoextract'
	Architecture = 'x64'
	Version = '1.9'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/dscharrer/innoextract/releases/download/${V}/innoextract-${V}-windows.zip"}
		Hash = "6989342C9B026A00A72A38F23B62A8E6A22CC5DE69805CF47D68AC2FEC993065"
	}

	Enable = {
		Export-Command "innoextract" "./app/innoextract.exe" -Symlink
	}
}
