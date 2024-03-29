@{
	Name = "neovim"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = {"https://github.com/neovim/neovim/releases/download/v$($this.Version)/nvim-win64.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Write-Warning "nvim-qt writes window geometry data to registry (HKCU\Software\nvim-qt)."

		Assert-Directory "./config"
		Assert-Directory "./data"
		
		$Env = @{
			XDG_CONFIG_HOME = Resolve-Path "./config"
			XDG_DATA_HOME = Resolve-Path "./data"
			XDG_STATE_HOME = Resolve-Path "./data"
		}

		Export-Command @("nvim", "vim") "./app/bin/nvim.exe" -Environment $Env
		Export-Shortcut "NeoVim" "./app/bin/nvim-qt.exe" -Environment $Env
	}
}
