@{
	Name = "Atom"
	Architecture = "x64"
	Version = "1.56.0"
	
	Install = @{
		Url = {"https://github.com/atom/atom/releases/download/v$($this.Version)/atom-x64-windows.zip"}
		Hash = "1EA8BBC5485F0EAE496D03C473D32F95B45E49AA7C526CB030BBE1B54C9FFA05"
		# Atom writes its data to ../.atom directory; I don't want to have an extra .atom directory in the package root,
		# so Target is used instead to place the data directory at ./app/.atom, where it can be symlinked
		Target = "Atom"
	}
	
	Enable = {
		# https://flight-manual.atom.io/getting-started/sections/installing-atom/#portable-mode
		# if .atom at same level as app directory exists, it is used for data
		Set-SymlinkedPath "./app/.atom" "./data" Directory
		# this makes Atom also store electron data locally
		Assert-Directory "./data/electronUserData"

		Export-Shortcut "Atom" "./app/Atom/atom.exe"
	}
}
