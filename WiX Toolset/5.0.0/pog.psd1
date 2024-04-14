@{
	Name = 'WiX Toolset'
	Architecture = 'x64'
	Version = '5.0.0'

	Install = @{
		Url = {"https://www.nuget.org/api/v2/package/wix/$($this.Version)"}
		Hash = "E8243606C71FA5BC2E0EB14D6005F42F1282B61540FB224B0004DE563A81F74D"
		Subdirectory = "tools/*/any"
	}

	Enable = {
		Export-Command "wix" "./app/wix.exe"
	}
}