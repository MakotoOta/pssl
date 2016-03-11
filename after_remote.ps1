$RemoteNode = "otatest16"

Set-Item WSMan:\localhost\Client\TrustedHosts -Value $RemoteNode -Force

# change Administrator's password and never expire
Invoke-Command -Computername $RemoteNode -ScriptBlock { net user Administrator password0! }
Invoke-Command -Computername $RemoteNode -ScriptBlock { wmic useraccount where "Name='Administrator'" set PasswordExpires=FALSE }

Invoke-Command -Computername $RemoteNode -ScriptBlock { c:\after01.bat }

Start-Sleep -s 600

Invoke-Command -Computername $RemoteNode -ScriptBlock { c:\after02.bat }
