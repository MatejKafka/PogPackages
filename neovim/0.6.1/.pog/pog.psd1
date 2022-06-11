@{
	Name = "neovim"
	Architecture = "x64"

	Version = "0.6.1"
	_Hash = "0c1fa8e95882836baec568ad547fe558241f2b26ff738a28e42fafae8c32bcf4"
	
	Install = {
		$Url = "https://github.com/neovim/neovim/releases/download/v$($this.Version)/nvim-win64.zip"
		Install-Fromurl $Url -ExpectedHash $this._Hash
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
