param([string]$uri)
$siteName = "WebSite"
$physicalPath = "C:\inetpub\www\" + $siteName.ToLower()

Import-Module WebAdministration

if (!(Test-Path IIS:\AppPools\$siteName)) {
    New-WebAppPool -Name $siteName
}

if (!(Test-Path $physicalPath)) {
    New-Item $physicalPath -Type directory
}

if (!(Test-Path IIS:\Sites\$siteName)) {
    New-Website -Name $siteName -ApplicationPool $siteName -PhysicalPath $physicalPath
    Start-Website -Name $siteName
}

try {
    $fileName = Split-Path $uri -leaf
    Invoke-WebRequest -Uri $uri -OutFile $fileName
    # Update 'setup-iis' to to use this
    # https://msdn.microsoft.com/en-us/powershell/wmf/5.1/install-configure
    #Expand-Archive -Path $fileName -DestinationPath $physicalPath -Force

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory((Get-Location).Path + "\" + $fileName, $physicalPath)
    Remove-Item $fileName
}
catch {
    Write-Host "Oops..."
    exit
}
finally {
    Restart-WebAppPool -Name $siteName
}
