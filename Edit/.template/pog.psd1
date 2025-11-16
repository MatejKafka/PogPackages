@{
    Name = 'Edit'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Website = "https://github.com/microsoft/edit"
    Description = @"
A simple editor for simple needs.
This editor pays homage to the classic MS-DOS Editor, but with a modern interface and input controls similar to VS Code.
The goal is to provide an accessible editor that even users largely unfamiliar with terminals can easily use.
"@

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        Export-Command "edit" "./app/edit.exe" -Symlink
    }
}