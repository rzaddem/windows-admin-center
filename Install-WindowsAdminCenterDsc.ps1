. .\WindowsAdminCenterDscConfiguration.ps1
WindowsAdminCenter
Start-DscConfiguration -Path .\WindowsAdminCenter\ -ComputerName localhost -Wait -Verbose
