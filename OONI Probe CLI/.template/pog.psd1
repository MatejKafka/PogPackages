@{
    Name = 'OONI Probe CLI'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Website = "https://ooni.org/"
    Description = "OONI Probe is free and open source software that you can run to measure internet censorship and other forms of network interference."

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
        NoArchive = $true
        Target = "ooniprobe.exe"
    }

    Enable = {
        New-Directory "./data"

        Export-Command "ooniprobe" "./app/ooniprobe.exe" -Environment @{
            OONI_HOME = "./data"
        }
    }
}