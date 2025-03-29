@{
    ListVersions = {
        Get-GitHubRelease ankitects/anki `
            | ? Version -ge "2.1.50" `
            | Get-GitHubAsset "anki-*-windows-qt6.exe", "anki-*-checksums.txt"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset[0].Url
            Hash = Get-HashFromChecksumFile $_.Asset[1].Url $_.Asset[0].Name
        }
    }
}