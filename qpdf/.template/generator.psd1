@{
    ListVersions = {
        Get-GitHubRelease qpdf/qpdf | Get-GitHubAsset "qpdf-*-msvc64.zip", "qpdf-*.sha256"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset[0].Url
            Hash = Get-HashFromChecksumFile $_.Asset[1].Url $_.Asset[0].Name
        }
    }
}