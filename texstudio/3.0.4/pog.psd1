@{
	Name = "texstudio"
	Architecture = "x64"
	Version = "3.0.4"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/texstudio-org/texstudio/releases/download/${V}/texstudio-${V}-win-portable-qt5.zip"}
		Hash = "6F025170503EEC51FDCF5A5422430FD4B191CAE498A9111D1C541CEE31E4BDC2"
	}

	Enable = {
		New-Symlink "./app/config" "./config" -Type Directory

		Export-Command "TeXstudio" "./app/texstudio.exe"
		Export-Shortcut "TeXstudio" "./app/texstudio.exe"
	}
}
