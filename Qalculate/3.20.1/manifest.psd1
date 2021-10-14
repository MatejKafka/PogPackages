@{
	Name = "Qalculate"
	Architecture = "x86"
	
	Version = "3.20.1"
	_Hash = "E82CF15D322C496970752559DD45AFFB7D636B812E95A2DCDE711F8573E12EA9"
	
	Install = {
		$Url = "https://github.com/Qalculate/qalculate-gtk/releases/download/v$($this.Version)/qalculate-$($this.Version)-i386.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Set-SymlinkedPath "./app/user" "./data" Directory
		
		Export-Command qalc "./app/qalc.exe" -NoSymlink
		Export-Shortcut Qalculate "./app/qalculate.exe"
		Export-Shortcut Qalculate-Qt "./app/qalculate-qt.exe"
	}
}