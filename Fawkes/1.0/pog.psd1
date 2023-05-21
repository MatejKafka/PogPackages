@{
	Name = 'Fawkes'
	Architecture = 'x64'
	Version = '1.0'

	Install = @{
		Url = "https://mirror.cs.uchicago.edu/fawkes/files/1.0/Fawkes-1.0.exe"
		Hash = "C972BF9D46037BBF34C6E08495DD52B1D9729999984789886A0C15DB04A603B2"
		NoArchive = $true
	}

	Enable = {
		Export-Shortcut Fawkes "./app/Fawkes-1.0.exe"
	}
}
