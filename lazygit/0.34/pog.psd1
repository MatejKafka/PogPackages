@{
	Name = "lazygit"
	Architecture = "x64"
	Version = "0.34"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/jesseduffield/lazygit/releases/download/v${V}/lazygit_${V}_Windows_x86_64.zip"}
		Hash = "E5595927CB9072E2134D388294A4AE6036AC09DDF0937AB937F9981D78C14C80"
	}

	Enable = {
		Assert-Directory "./config"
		
		Export-Command "lazygit" "./.pog/lazygit_wrapper.cmd" -NoSymlink
	}
}
