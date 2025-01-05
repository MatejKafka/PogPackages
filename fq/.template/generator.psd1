@{
    ListVersions = {
        Get-GitHubRelease wader/fq | Get-GitHubAsset "fq_*_windows_amd64.zip", "checksums.txt"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset[0].Url
            Hash = Get-HashFromChecksumFile $_.Asset[1].Url $_.Asset[0].Name
        }
    }
}