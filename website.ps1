param([string]$uri)
$siteName = "WebSite"
$physicalPath = "C:\inetpub\www\" + $siteName.ToLower()

Import-Module WebAdministration

New-WebAppPool -Name $siteName

New-Item $physicalPath -Type directory
New-Website -Name $siteName -ApplicationPool $siteName -PhysicalPath $physicalPath
Start-Website -Name $siteName

$fileName = Split-Path $uri -leaf
Invoke-WebRequest -Uri $uri -OutFile $fileName

# Update 'setup-iis' to to use this
# https://msdn.microsoft.com/en-us/powershell/wmf/5.1/install-configure
#Expand-Archive -Path $fileName -DestinationPath $physicalPath -Force

Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirecotry((Get-Location).Path + "\" + $fileName, $physicalPath)
