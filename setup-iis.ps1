Import-Module ServerManager
Add-WindowsFeature Web-Server -includeallsubfeature
Remove-Website -Name "Default Web Site"

Invoke-WebRequest -Uri http://download.microsoft.com/download/C/F/F/CFF3A0B8-99D4-41A2-AE1A-496C08BEB904/WebPlatformInstaller_amd64_en-US.msi -OutFile "WebPlatformInstaller_amd64_en-US.msi"
Start-Process "WebPlatformInstaller_amd64_en-US.msi" -ArgumentList "/qn" -Wait

# NETFramework452
Start-Process "C:\Program Files\Microsoft\Web Platform Installer\WebpiCmd-x64.exe" -ArgumentList "/Install /Products:NETFramework452 /AcceptEULA /ForceReboot" -WindowStyle Hidden -Wait


# https://msdn.microsoft.com/en-us/powershell/wmf/5.1/install-configure
# Windows Management Framework (dependant on NETFramework452)
(New-Object System.Net.WebClient).DownloadFile("http://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/Win8.1AndW2K12R2-KB3191564-x64.msu", (Get-location).Path + "\Win8.1AndW2K12R2-KB3191564-x64.msu")
Start-Process "Win8.1AndW2K12R2-KB3191564-x64.msu" -ArgumentList "/quiet" -Wait