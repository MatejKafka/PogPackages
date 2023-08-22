@{
	Name = 'Emacs'
	Architecture = 'x64'
	Version = '29.1_2'

	Install = @{
		Url = {$V = $this.Version; $M = ($V -split "\.")[0]; "https://ftpmirror.gnu.org/gnu/emacs/windows/emacs-${M}/emacs-${V}.zip"}
		Hash = "7CE2CF03822053CA182A1E38CCC08399167533F556F9F4F64E755EBAFD4286FA"
	}

	Enable = {
		Assert-Directory "./config"

		Export-Command "emacs" "./app/bin/emacs.exe" -Environment @{HOME = "./config"}
		Export-Shortcut "Emacs" "./app/bin/runemacs.exe" -Environment @{HOME = "./config"}
	}
}