@{
    Name = 'git-cinnabar'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Website = "https://github.com/glandium/git-cinnabar"
    Description = "Git remote helper to interact with mercurial repositories."

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        Export-Command "git-cinnabar" "./app/git-cinnabar.exe" -Symlink
        Export-Command "git-remote-hg" "./app/git-remote-hg.exe" -Symlink
    }
}