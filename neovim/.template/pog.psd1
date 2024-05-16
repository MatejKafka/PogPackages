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

		New-Directory "./config"
		New-Directory "./data"

		$Env = @{
			XDG_CONFIG_HOME = Resolve-Path "./config"
			XDG_DATA_HOME = Resolve-Path "./data"
			XDG_STATE_HOME = Resolve-Path "./data"
		}

		Export-Command @("nvim", "vim") "./app/bin/nvim.exe" -Environment $Env -VcRedist
		if ($this.Version -like "0.?.*") {
			# nvim-qt was removed in 0.10.0 (https://github.com/neovim/neovim/commit/0370e4def0c0328f8cd09f02c1ca82ed491ecb9a)
			Export-Shortcut "NeoVim" "./app/bin/nvim-qt.exe" -Environment $Env -VcRedist
		}
	}
}
