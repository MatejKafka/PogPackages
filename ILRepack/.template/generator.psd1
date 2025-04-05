@{
    ListVersions = {
        Get-NugetRelease ILRepack
    }

    Generate = {
        [ordered]@{
            Version = $_.Version
            Url = $_.Url
            Hash = Get-UrlHash $_.Url
        }
    }
}