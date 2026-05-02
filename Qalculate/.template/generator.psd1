@{
    ListVersions = {
        # x64 zip was added in 3.21.0
        # QALCULATE_USER_DIR was added in 3.20.0
        # versions before 3.1.0 don't support portable data dir at `./app/user`
        Get-GitHubRelease Qalculate/qalculate-gtk `
            | ? Version -ge "3.21.0" `
            <# # some releases also have assets for a patch version, we cannot distinguish them with a pattern #> `
            | % {$_ | Get-GitHubAsset "qalculate-$($_.Version)-x64.zip"}
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}