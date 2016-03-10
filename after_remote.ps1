$RemoteNode = "xxxx"

Invoke-Command -Computername $RemoteNode -ScriptBlock { c:\after01.bat }

Start-Sleep -s 600

Invoke-Command -Computername $RemoteNode -ScriptBlock { c:\after02.bat }
