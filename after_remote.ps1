$RemoteNode = "otatest16"

Set-Item WSMan:\localhost\Client\TrustedHosts -Value $RemoteNode -Force

Invoke-Command -Computername $RemoteNode -ScriptBlock { c:\after01.bat }

Start-Sleep -s 300

Invoke-Command -Computername $RemoteNode -ScriptBlock { c:\after02.bat }

Start-Sleep -s 300

#Invoke-Command -Computername $RemoteNode -ScriptBlock { del /Q postInstallScript.log }
Invoke-Command -Computername $RemoteNode -ScriptBlock { del /Q c:\*.cab }
Invoke-Command -Computername $RemoteNode -ScriptBlock { del /Q c:\*.ps1 }
Invoke-Command -Computername $RemoteNode -ScriptBlock { del /Q c:\*.bat }
Invoke-Command -Computername $RemoteNode -ScriptBlock { net user Administrator password1! }
