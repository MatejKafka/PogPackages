@{
	Name = "lazygit"
	Architecture = "x64"
	Version = "0.31.4"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/jesseduffield/lazygit/releases/download/v${V}/lazygit_${V}_Windows_x86_64.zip"}
		Hash = "FB3E8B456BFCB53750AA6FE80453F2AB0C040B9F1317E050CB2B14B094CF95E4"
	}

	Enable = {
		New-Directory "./config"

		Export-Command "lazygit" "./app/lazygit.exe" -Environment @{CONFIG_DIR = "./config"}
	}
}
