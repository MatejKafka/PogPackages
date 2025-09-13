@{
    Name = 'ast-grep'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
        Subdirectory = "ast-grep.exe"
    }

    Enable = {
        Export-Command "sg", "ast-grep" "./app/ast-grep.exe" -Symlink
    }
}