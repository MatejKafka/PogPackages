@{
    ListVersions = {
        Get-NugetRelease asmspy
    }

    Generate = {
        [ordered]@{
            Version = $_.Version
            Url = $_.Url
            Hash = Get-UrlHash $_.Url
        }
    }
}