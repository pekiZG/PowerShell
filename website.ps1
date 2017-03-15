param([string]$artifactUri)
$siteName = "WebSite"
$physicalPath = "C:\inetpub\www\" + $siteName.ToLower()

Import-Module WebAdministration

New-WebAppPool -Name $siteName

New-Item $physicalPath -Type directory
New-Website -Name $siteName -ApplicationPool $siteName -PhysicalPath $physicalPath
Start-Website -Name $siteName

$artifactFileName = Split-Path $artifactUri -leaf
Invoke-WebRequest -Uri $artifactUri -OutFile $artifactFileName

Expand-Archive -Path $artifactFileName -DestinationPath $physicalPath -Force