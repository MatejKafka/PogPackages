# TODO: https://docs.microsoft.com/en-us/nuget/consume-packages/managing-the-global-packages-and-cache-folders
@{
	Name = "dotnet-sdk"
	Architecture = "x64"

	Version = "7.0.100-preview.2"

	Install = @{
		Url = "https://download.visualstudio.microsoft.com/download/pr/d759acdb-c289-43ad-8698-4a9783d80ef8/11838a24f71dd4c359bc9a02b1e14d5f/dotnet-sdk-7.0.100-preview.2.22153.17-win-x64.zip"
		Hash = "291D07984B80F0462356BD7D458FE7002319158D6D2BFA70A973679F54F3DCD6"
	}

	Enable = {
		# FIXME: ...
		Write-Warning "'dotnet' writes to '%localappdata%\Microsoft\dotnet\optimizationdata\5.0.101\win10-x64\dotnet' (and possibly other dirs)."
		Export-Command "dotnet" "./app/dotnet.exe" -NoSymlink
	}
}
