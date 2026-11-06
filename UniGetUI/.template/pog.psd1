@{
    Name = 'UniGetUI'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        New-Symlink "./app/Settings" "./data" Directory
        # disable auto-update
        New-File "./data/Configuration/DisableAutoUpdateWingetUI"

        Export-Command uniget "./app/uniget.exe"
        Export-Command pinget "./app/pinget.exe"
        Export-Shortcut UniGetUI "./app/UniGetUI.exe"
    }
}