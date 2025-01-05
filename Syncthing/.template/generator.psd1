@{
    ListVersions = {
        Get-GitHubRelease syncthing/syncthing `
            | ? TagName -notin "v1.23.5-rc.1", "v1.20.0", "v0.14.22" `
            | Get-GitHubAsset "syncthing-windows-amd64-v*.zip", "sha256sum.txt.asc"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset[0].Url
            Hash = Get-HashFromChecksumFile $_.Asset[1].Url $_.Asset[0].Name
        }
    }
}