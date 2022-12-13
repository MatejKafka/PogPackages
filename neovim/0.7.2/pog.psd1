@{
	Name = "neovim"
	Architecture = "x64"
	Version = "0.7.2"
	
	Install = @{
		Url = {"https://github.com/neovim/neovim/releases/download/v$($this.Version)/nvim-win64.zip"}
		Hash = "0E969E15C7E4D9B128EC1E06159EAD386D262FDC94616DDBB0C245ABCC798AE8"
	}
	
	Enable = {
		Write-Warning "nvim-qt writes window geometry data to registry (HKCU\Software\nvim-qt)."

		Assert-Directory "./config"
		Assert-Directory "./data"
		
		Export-Command "vim" "./.pog/nvim_wrapper.cmd" -NoSymlink
		Export-Command "nvim" "./.pog/nvim_wrapper.cmd" -NoSymlink
		Export-Shortcut "NeoVim" "./.pog/nvim-qt_wrapper.cmd" -Icon "./app/bin/nvim-qt.exe"
	}
}
