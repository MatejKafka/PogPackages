@{
    ListVersions = {
        Get-GithubRelease PolarGoose/BluetoothDevicePairing | Get-GitHubAsset BluetoothDevicePairing.zip
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = if ($_.Asset.Hash) {$_.Asset.Hash} else {Get-UrlHash $_.Asset.Url}
        }
    }
}