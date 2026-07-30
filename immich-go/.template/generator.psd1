@{
    ListVersions = {
        Get-GitHubRelease simulot/immich-go `
            | ? {-not ($_.Version -eq "1.21.3" -and $_.Name -eq "0.21.3")} <# mistagged, actually it's 0.21.3 #> `
            | ? Version -ge "0.23.0-alpha2" <# immich-go got rewritten in 0.23, previous CLI is completely different #> `
            | Get-GitHubAsset "immich-go_Windows_x86_64.zip" -Optional "checksums.txt"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset $_.OptionalAsset
        }
    }
}