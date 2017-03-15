Import-Module WebAdministration

New-Item C:\inetpub\www\cats -Type directory
New-Website -Name "Cats" -PhysicalPath "C:\inetpub\www\cats"
Start-Website -Name "Cats"