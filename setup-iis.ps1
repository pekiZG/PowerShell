Import-Module ServerManager
Add-WindowsFeature Web-Server -includeallsubfeature
Remove-Website -Name "Default Web Site"

Invoke-WebRequest -Uri http://download.microsoft.com/download/C/F/F/CFF3A0B8-99D4-41A2-AE1A-496C08BEB904/WebPlatformInstaller_amd64_en-US.msi -OutFile "WebPlatformInstaller_amd64_en-US.msi"
Start-Process "WebPlatformInstaller_amd64_en-US.msi" /qn -Wait

# NETFramework452
Start-Process "C:\Program Files\Microsoft\Web Platform Installer\WebpiCmd-x64.exe" -ArgumentList "/Install /Products:NETFramework452 /AcceptEULA /ForceReboot" -WindowStyle Hidden -Wait

# TODO: Install Windows Management Framework (dependant on NETFramework452)
# https://msdn.microsoft.com/en-us/powershell/wmf/5.1/install-configure
