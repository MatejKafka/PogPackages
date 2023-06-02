@{
	Name = "dotnet-sdk"
	Architecture = "x64"
	Version = "5.0.101"

	Install = @{
		Url = {$V = $this.Version; "https://dotnetcli.azureedge.net/dotnet/Sdk/${V}/dotnet-sdk-${V}-win-x64.zip"}
		Hash = "00AAB5CD687B59EE889B6E22856E21890EB2DBA94AA15AED31A6B6E08F21DD59"
	}

	Enable = {
		# FIXME: ...
		Write-Warning "'dotnet' writes to '%localappdata%\Microsoft\dotnet\optimizationdata\5.0.101\win10-x64\dotnet' (and possibly other dirs)."
		Export-Command "dotnet" "./app/dotnet.exe"
	}
}
