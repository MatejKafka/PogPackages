@{
    Name = 'WinMTR'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
        Subdirectory = "WinMTR-*"
    }

    Enable = {
        Disable-DisplayScaling "./app/WinMTR_x64/WinMTR.exe"

        Export-Shortcut "WinMTR" "./app/WinMTR_x64/WinMTR.exe"
    }
}