@{
	Name = "neovim"
	Architecture = "x64"

	Version = "0.5.0"
	_Hash = "0064bd9f6b270158212ec0a55c1e7255562d4813ad3316592b1f74df041d3c06"
	
	Install = {
		$Url = "https://github.com/neovim/neovim/releases/download/v$($this.Version)/nvim-win64.zip"
		Install-Fromurl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./data"
		
		Export-Command "vim" "./.manifest/nvim_wrapper.cmd" -NoSymlink
		Export-Command "nvim" "./.manifest/nvim_wrapper.cmd" -NoSymlink
		Export-Shortcut "NeoVim" "./.manifest/nvim-qt_wrapper.cmd" -Icon "./app/bin/nvim-qt.exe"
	}
}
