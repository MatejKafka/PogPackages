@{
    Name = 'fx@antonmedv'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
        NoArchive = $true
        Target = "fx.exe"
    }

    Enable = {
        # https://github.com/antonmedv/fx/blob/758a717200b17f124b1ec4b2a2defbf2cd5dad85/internal/engine/fxrc.go#L10
        New-File "./config/.fxrc.js"

        Export-Command "fx" "./app/fx.exe" -Environment @{
            # fx looks for the rc file in ~
            USERPROFILE = "./config"
            # just point these two to a non-existent directory to disable them
            XDG_CONFIG_HOME = "./config/non-existent"
            XDG_CONFIG_DIRS = "./config/non-existent"
        }
    }
}