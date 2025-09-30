@{
    ListVersions = {
        Get-GitHubRelease MatejKafka/SpawnCamper | Get-GitHubAsset "SpawnCamper-x64.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = $_.Asset.Hash
        }
    }
}