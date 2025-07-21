@{
    Name = 'mitmproxy'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        New-Directory "./data"

        $CommonArgs = "--set", ("confdir=" + (Resolve-Path "./data"))
        Export-Command "mitmproxy" "./app/mitmproxy.exe" -Arguments $CommonArgs
        Export-Command "mitmdump" "./app/mitmdump.exe" -Arguments $CommonArgs
        Export-Command "mitmweb" "./app/mitmweb.exe" -Arguments $CommonArgs
    }
}