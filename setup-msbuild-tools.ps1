# Web Platform Installer
(New-Object System.Net.WebClient).DownloadFile("http://download.microsoft.com/download/C/F/F/CFF3A0B8-99D4-41A2-AE1A-496C08BEB904/WebPlatformInstaller_amd64_en-US.msi", (Get-location).Path + "\WebPlatformInstaller_amd64_en-US.msi")
Start-Process "WebPlatformInstaller_amd64_en-US.msi" -ArgumentList "/qn" -Wait
Write-Host "Web Platform Installer Installed"

# NETFramework452
Start-Process "C:\Program Files\Microsoft\Web Platform Installer\WebpiCmd-x64.exe" -ArgumentList "/Install /Products:NETFramework452 /AcceptEULA /SuppressReboot" -WindowStyle Hidden -Wait
Write-Host "NETFramework452 Installed"

# https://msdn.microsoft.com/en-us/powershell/wmf/5.1/install-configure
# Windows Management Framework (dependant on NETFramework452)
(New-Object System.Net.WebClient).DownloadFile("http://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/Win8.1AndW2K12R2-KB3191564-x64.msu", (Get-location).Path + "\Win8.1AndW2K12R2-KB3191564-x64.msu")
Start-Process "Win8.1AndW2K12R2-KB3191564-x64.msu" -ArgumentList "/quiet /norestart" -Wait
Write-Host "Windows Management Framework 5.1 Installed"

# Git for Windows
Start-Process "C:\Program Files\Microsoft\Web Platform Installer\WebpiCmd-x64.exe" -ArgumentList "/Install /Products:msysgitVS /AcceptEULA /SuppressReboot" -WindowStyle Hidden -Wait
Write-Host "Git for Windows Installed"

# NuGet
if (!(Test-Path $physicalPath)) {
    New-Item "C:\NuGet\" -Type Directory
}
(New-Object System.Net.WebClient).DownloadFile("https://dist.nuget.org/win-x86-commandline/v4.0.0/nuget.exe", "C:\NuGet\nuget.exe")
Write-Host "Nuget 4.0 Installed"
 
# http://getdotnet.azurewebsites.net/target-dotnet-platforms.html
(New-Object System.Net.WebClient).DownloadFile("https://download.microsoft.com/download/4/3/B/43B61315-B2CE-4F5B-9E32-34CCA07B2F0E/NDP452-KB2901951-x86-x64-DevPack.exe", (Get-location).Path + "\NDP452-KB2901951-x86-x64-DevPack.exe")
Start-Process "NDP452-KB2901951-x86-x64-DevPack.exe" -Wait
Write-Host "DevPack 4.5.2 Installed"

# Visual Studio 2017 Build Tools
(New-Object System.Net.WebClient).DownloadFile("https://download.microsoft.com/download/5/A/8/5A8B8314-CA70-4225-9AF0-9E957C9771F7/vs_BuildTools.exe", (Get-location).Path + "\vs_BuildTools.exe")
#Start-Process "vs_buildtools.exe" -ArgumentList "--add Microsoft.VisualStudio.Workload.MSBuildTools -–add Microsoft.VisualStudio.Web.BuildTools.ComponentGroup --quiet" -Wait
# Install vs_BuildTools.exe to "C:\VS\2017\BuildTools"
Write-Host "Manualy install .\vs_BuildTools.exe"

# vs_BuildTools.exe when invoked via Powershell script gives error in event viewer
# The program or feature "\??\C:\Users\Administrator\Documents\vs_buildtools.exe" cannot start or run due to incompatibity with 64-bit versions of Windows. Please contact the software vendor to ask if a 64-bit Windows compatible version is available.