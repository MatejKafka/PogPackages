@{
    ListVersions = {
        Get-GitHubRelease Azure/azure-cli -TagPrefix "azure-cli-" `
            | ? Version -ge 2.63.0 <# earlier versions do not have .zip #> `
            | Get-GitHubAsset azure-cli-*-x64.zip
    }

    Generate = {
        $Url = $_.Asset.Url
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = try {
                Get-HashFromChecksumText $_.Release.Body $_.Asset.Name
            } catch {
                Get-UrlHash $Url
            }
        }
    }
}