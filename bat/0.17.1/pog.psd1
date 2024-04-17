@{
	Name = "bat"
	Architecture = "x64"
	Version = "0.17.1"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/sharkdp/bat/releases/download/v${V}/bat-v${V}-x86_64-pc-windows-msvc.zip"}
		Hash = "699769A0F05D989C50BB53FA614C47130FC8BA2D68381F6922FF7C1500588325"
	}

	Enable = {
		Export-Command "bat" "./app/bat.exe" -VcRedist
	}
}
