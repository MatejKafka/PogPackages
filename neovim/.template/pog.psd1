@{
	Name = "neovim"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Website = "https://neovim.io"
	Description = "Neovim is a modern, fast and feature-rich editor that is fully compatible with Vim. It supports plugins, GUIs, LSP, Lua, and more."

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		Write-Warning "nvim-qt writes window geometry data to registry (HKCU\Software\nvim-qt)."

		New-Directory "./config"
		New-Directory "./data"

		if (-not (Test-Path "./config/nvim/init.lua")) {
			New-File "./config/nvim/init.vim"
		}

		$Env = @{
			XDG_CONFIG_HOME = "./config"
			XDG_DATA_HOME = "./data"
			XDG_STATE_HOME = "./data"
		}

		Export-Command @("nvim", "vim") "./app/bin/nvim.exe" -Environment $Env -VcRedist
		if ($this.Version -like "0.?.*") {
			# nvim-qt was removed in 0.10.0 (https://github.com/neovim/neovim/commit/0370e4def0c0328f8cd09f02c1ca82ed491ecb9a)
			Export-Shortcut "NeoVim" "./app/bin/nvim-qt.exe" -Environment $Env -VcRedist
		}
	}
}
