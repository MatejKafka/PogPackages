@{
    ListVersions = {
        Invoke-WebRequest https://ziglang.org/download/index.json `
            | ConvertFrom-Json -AsHashtable `
            | % GetEnumerator `
            | ? Key -ne master `
            | % {
                [ordered]@{
                    Version = [Pog.PackageVersion]$_.Key
                    Url = $_.Value.'x86_64-windows'.tarball
                    Hash = $_.Value.'x86_64-windows'.shasum.ToUpperInvariant()
                }
            } `
            | ? Version -ge "0.8.0"
    }
}