$RemoteNode = "otatest16"

Set-Item WSMan:\localhost\Client\TrustedHosts -Value $RemoteNode -Force

Invoke-Command -Computername $RemoteNode -ScriptBlock { c:\after01.bat }

Start-Sleep -s 600

Invoke-Command -Computername $RemoteNode -ScriptBlock { c:\after02.bat }

Invoke-Command -Computername $RemoteNode -ScriptBlock { net user Administrator password1! }
