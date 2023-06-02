@{
	Name = "neovim"
	Architecture = "x64"
	Version = "0.7.0"
	
	Install = @{
		Url = {"https://github.com/neovim/neovim/releases/download/v$($this.Version)/nvim-win64.zip"}
		Hash = "A72A90E2897EA296B777C325A37C981A0B51E2FE0C8B8735E3366B65E958CDDC"
	}
	
	Enable = {
		Write-Warning "nvim-qt writes window geometry data to registry (HKCU\Software\nvim-qt)."

		Assert-Directory "./config"
		Assert-Directory "./data"
		
		Export-Command "vim" "./.pog/nvim_wrapper.cmd"
		Export-Command "nvim" "./.pog/nvim_wrapper.cmd"
		Export-Shortcut "NeoVim" "./.pog/nvim-qt_wrapper.cmd" -Icon "./app/bin/nvim-qt.exe"
	}
}
