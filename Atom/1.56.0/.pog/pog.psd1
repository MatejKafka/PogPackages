@{
	Name = "Atom"
	Architecture = "x64"
	
	Version = "1.56.0"
	_Hash = "1EA8BBC5485F0EAE496D03C473D32F95B45E49AA7C526CB030BBE1B54C9FFA05"
	
	Install = {
		$Url = "https://github.com/atom/atom/releases/download/v$($this.Version)/atom-x64-windows.zip"
		# the -Subdirectory "." is a bit of a hack, as we need to put .atom at the same level as app directory
		# this extracts Atom to "./app/Atom x64/"
		Install-FromUrl $Url -ExpectedHash $this._Hash -Subdirectory "."
	}
	
	Enable = {
		# https://flight-manual.atom.io/getting-started/sections/installing-atom/#portable-mode
		# if .atom at same level as app directory exists, it is used for data
		Set-SymlinkedPath "./app/.atom" "./data" Directory
		# this makes Atom also store electron data locally
		Assert-Directory "./data/electronUserData"

		Export-Shortcut "Atom" "./app/Atom x64/atom.exe"
	}
}