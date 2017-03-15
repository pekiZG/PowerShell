Import-Module WebAdministration

Stop-Website -Name "Default Web Site"

New-Item C:\inetpub\www\cats -Type directory

New-Website -Name "Cats" -PhysicalPath "C:\inetpub\www\cats"

Start-Website -Name "Cats"