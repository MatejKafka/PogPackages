@{
    ListVersions = {
        Invoke-RestMethod "https://downloads.mitmproxy.org/list?delimiter=/&prefix=" `
            | % {$_.ListBucketResult.CommonPrefixes.Prefix} `
            | ? {$_ -ne "branches/"} `
            | % {[Pog.PackageVersion]$_.Substring(0, $_.Length - 1)} `
            | ? {$_ -ge "4.0.1"} # older versions have a different config dir handling
    }

    Generate = {
        $Suffix = if ($_ -gt "10.1.5") {"-x86_64"}
        $Url = "https://downloads.mitmproxy.org/$_/mitmproxy-$_-windows$Suffix.zip"
        return [ordered]@{
            Version = $_
            Url = $Url
            Hash = Get-UrlHash $Url
        }
    }
}