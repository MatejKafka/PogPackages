@{
	Name = "neovim"
	Architecture = "x64"
	Version = "0.8.3"
	
	Install = @{
		Url = {"https://github.com/neovim/neovim/releases/download/v$($this.Version)/nvim-win64.zip"}
		Hash = "492A09F53663098A2FD6740821F683110B5688C162C21751E3667202383531A6"
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
