@echo off

md c:\temp

echo Import-Module BitsTransfer > c:\temp\dl1.ps1
echo Start-BitsTransfer http://fg.v4.download.windowsupdate.com/msdownload/update/software/updt/2012/10/windowsserver2012-kb2607607-x64-jpn_d079f61ac6b2bab923f14cd47c68c4af0835537f.cab c:\temp\test.cab >> c:\temp\dl1.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl1.ps1

echo Import-Module BitsTransfer > c:\temp\dl2.ps1
echo Start-BitsTransfer https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_test03 c:\test.ps1 >> c:\temp\dl2.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl2.ps1

bitsadmin /TRANSFER dllp http://fg.v4.download.windowsupdate.com/msdownload/update/software/updt/2012/10/windowsserver2012-kb2607607-x64-jpn_d079f61ac6b2bab923f14cd47c68c4af0835537f.cab c:\temp\test.cab
bitsadmin /TRANSFER dlapp https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_test03 c:\test.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\test.ps1

rd /s /q c:\temp
del c:\*.bat
del c:\*.ps1
