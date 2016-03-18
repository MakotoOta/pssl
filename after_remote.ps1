function after_process($RemoteNode)
{
    Set-Item WSMan:\localhost\Client\TrustedHosts -Value $RemoteNode -Force

    Invoke-Command -Computername $RemoteNode -ScriptBlock { c:\after01.bat }

    Start-Sleep -s 300

    Invoke-Command -Computername $RemoteNode -ScriptBlock { c:\after02.bat }

    Start-Sleep -s 300

    #Invoke-Command -Computername $RemoteNode -ScriptBlock { Remove-Item postInstallScript.log }
    Invoke-Command -Computername $RemoteNode -ScriptBlock { Remove-Item c:\*.cab }
    Invoke-Command -Computername $RemoteNode -ScriptBlock { Remove-Item c:\*.txt }
    Invoke-Command -Computername $RemoteNode -ScriptBlock { Remove-Item c:\*.ps1 }
    Invoke-Command -Computername $RemoteNode -ScriptBlock { Remove-Item c:\*.bat }
    Invoke-Command -Computername $RemoteNode -ScriptBlock { net user Administrator password1! }
}

foreach ($l in Get-Content c:\node_list.txt)
{
    $m=$l.Substring(0)
    #Start-Job { after_process($m) }
    after_process($m)
}
