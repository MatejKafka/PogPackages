@{
	Name = 'Waratah@Microsoft'
	Architecture = 'x64'
	Version = '1.1.0'

	Install = @{
		Url = {"https://github.com/microsoft/hidtools/releases/download/Waratah-v$($this.Version)/Waratah-Published.zip"}
		Hash = "49C2D897B4011EF4187F0C76A29E4A35F971224B7968FC50F6505C10E46E31EB"
	}

	Enable = {
		Export-Command "WaratahCmd" "./app/WaratahCmd.exe" -Symlink
	}
}
