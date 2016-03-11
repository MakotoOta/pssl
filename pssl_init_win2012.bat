echo "" >> C:\Windows\System32\Drivers\etc\hosts
echo 184.172.32.30 otatest13 otatest13.test01.test >> C:\Windows\System32\Drivers\etc\hosts

md c:\temp

echo Invoke-WebRequest -uri http://fg.v4.download.windowsupdate.com/msdownload/update/software/updt/2012/10/windowsserver2012-kb2607607-x64-jpn_d079f61ac6b2bab923f14cd47c68c4af0835537f.cab -outfile c:\after.cab > c:\temp\dl1.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl1.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_init_win2012_01_ps1 -outfile c:\after01.ps1 > c:\temp\dl2.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl2.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_init_win2012_01_bat -outfile c:\after01.bat > c:\temp\dl3.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl3.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_init_win2012_02_ps1 -outfile c:\after02.ps1 > c:\temp\dl4.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl4.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_init_win2012_02_bat -outfile c:\after02.bat > c:\temp\dl5.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl5.ps1

echo Set-Item WSMan:\localhost\Client\TrustedHosts -Value otatest13 -Force > c:\temp\dl6.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl6.ps1

rem add user testadmin as a administrator
rem net user testadmin password0! /add /active:yes /expires:never /fullname:"Test Admin" /passwordchg:yes /workstations:*
rem net localgroup "Administrators" "testadmin" /add

rem change Timezone
tzutil /s "Tokyo Standard Time"
time.service.networklayer.com

rem Windows Firewall setting
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v "PortNumber" /t REG_DWORD /d 13579 /f
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all dir=in protocol=tcp localport=3389
netsh advfirewall firewall add rule name="ChangedRDP" dir=in action=allow protocol=tcp localport=13579 remoteip=184.172.32.30
netsh advfirewall firewall delete rule name=all dir=in protocol=tcp localport=80
netsh advfirewall firewall add rule name="PSMgmt" dir=in action=allow protocol=tcp localport=80 remoteip=184.172.32.30

rd /s /q c:\temp
