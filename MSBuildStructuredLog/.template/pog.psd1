@{
    Name = 'MSBuildStructuredLog'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
        Subdirectory = "lib/net472"
    }

    Enable = {
        New-Directory "./data"

        $Env = @{
            MSBUILDSTRUCTUREDLOG_DATA_DIR = "./data"
        }

        Export-Command "StructuredLogViewer" "./app/StructuredLogViewer.exe" -Environment $Env
        Export-Shortcut "MSBuild Structured Log Viewer" "./app/StructuredLogViewer.exe" -Environment $Env
    }
}