@{
    ListVersions = {
        Get-GitHubRelease oven-sh/bun -TagPrefix "bun-v" `
            | ? Version -ge "1.1.0" `
            | Get-GitHubAsset "bun-windows-x64.zip", "SHASUMS256.txt"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset[0].Url
            Hash = Get-HashFromChecksumFile $_.Asset[1].Url $_.Asset[0].Name
        }
    }
}