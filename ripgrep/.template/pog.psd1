@{
	Name = "ripgrep"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Website = "https://github.com/BurntSushi/ripgrep"
	Description = "ripgrep recursively searches directories for a regex pattern while respecting your gitignore."

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		Export-Command "ripgrep" "./app/rg.exe" -Symlink
		Export-Command "rg" "./app/rg.exe" -Symlink
	}
}
