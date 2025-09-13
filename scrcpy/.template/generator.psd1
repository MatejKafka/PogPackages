@{
    ListVersions = {
        Get-GitHubRelease Genymobile/scrcpy `
            | ? Version -gt 1.1 `
            | Get-GitHubAsset scrcpy-win64-v*.zip, SHA256SUMS.txt
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset[0].Url
            Hash = Get-HashFromChecksumFile $_.Asset[1].Url $_.Asset[0].Name
        }
    }
}