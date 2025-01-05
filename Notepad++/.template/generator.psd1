@{
    ListVersions = {
        Get-GitHubRelease notepad-plus-plus/notepad-plus-plus `
            | ? Version -ge "7.9" `
            | Get-GitHubAsset "npp.*.portable.x64.7z"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-HashFromChecksumText $_.Release.Body $_.Asset.Name
        }
    }
}