echo "" >> C:\Windows\System32\Drivers\etc\hosts
echo 10.36.169.7 otatest01 otatest01.test02.test >> C:\Windows\System32\Drivers\etc\hosts

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

echo Set-Item WSMan:\localhost\Client\TrustedHosts -Value otatest01 -Force > c:\temp\dl6.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl6.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_nwdisable_win2012_ps1 -outfile c:\nwdisable.ps1 > c:\temp\dl7.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl7.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\nwdisable.ps1

rem change Administrator's password and never expire
net user Administrator password0!
wmic useraccount where "Name='Administrator'" set PasswordExpires=FALSE

rem add user testadmin as a administrator
rem net user testadmin password0! /add /active:yes /expires:never /fullname:"Test Admin" /passwordchg:yes /workstations:*
rem net localgroup "Administrators" "testadmin" /add

rem change Timezone
tzutil /s "Tokyo Standard Time"

rd /s /q c:\temp
