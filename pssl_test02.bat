@echo off

md c:\temp

echo Invoke-WebRequest -uri http://fg.v4.download.windowsupdate.com/msdownload/update/software/updt/2012/10/windowsserver2012-kb2607607-x64-jpn_d079f61ac6b2bab923f14cd47c68c4af0835537f.cab -outfile c:\temp\test.cab > c:\temp\dl1.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl1.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_test03 -outfile c:\test.ps1 > c:\temp\dl2.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl2.ps1

powershell -NoProfile -ExecutionPolicy Unrestricted c:\test.ps1

rd /s /q c:\temp
del c:\*.bat
del c:\*.ps1
