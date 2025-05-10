@{
    ListVersions = {
        Get-GitHubRelease Kitware/CMake `
            | ? Version -ge "3.20.0" `
            | Get-GitHubAsset "cmake-*-windows-x86_64.zip" -Optional "cmake-*-SHA-256.txt"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset $_.OptionalAsset
        }
    }
}