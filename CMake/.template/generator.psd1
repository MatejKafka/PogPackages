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
            Hash = if (-not $_.OptionalAsset) {
                Write-Information "Computing hash locally for CMake version '$($_.VersionStr)'..."
                Get-UrlHash $_.Asset.Url
            } else {
                Get-HashFromChecksumFile $_.OptionalAsset.Url $_.Asset.Name
            }
        }
    }
}