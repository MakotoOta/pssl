@echo off

md c:\temp

echo Invoke-WebRequest -uri http://fg.v4.download.windowsupdate.com/msdownload/update/software/updt/2012/10/windowsserver2012-kb2607607-x64-jpn_d079f61ac6b2bab923f14cd47c68c4af0835537f.cab -outfile c:\after.cab > c:\temp\dl1.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl1.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_init_win2012_01 -outfile c:\temp\test.ps1 > c:\temp\dl2.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl2.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_init_win2012_02_1 -outfile c:\after01.ps1 > c:\temp\dl3.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl3.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_init_win2012_02_2 -outfile c:\after01.bat > c:\temp\dl4.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl4.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_init_win2012_03_1 -outfile c:\after02.ps1 > c:\temp\dl5.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl5.ps1

echo Invoke-WebRequest -uri https://raw.githubusercontent.com/MakotoOta/pssl/master/pssl_init_win2012_03_2 -outfile c:\after02.bat > c:\temp\dl6.ps1
powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\dl6.ps1

powershell -NoProfile -ExecutionPolicy Unrestricted c:\temp\test.ps1

rd /s /q c:\temp
