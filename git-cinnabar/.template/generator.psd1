@{
    ListVersions = {
        Get-GithubRelease glandium/git-cinnabar `
            | Get-GithubAsset -Regex 'git-cinnabar(-helper)?\.windows\.(x86_64|amd64|64-bits)\.zip'
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}