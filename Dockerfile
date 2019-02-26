FROM mcr.microsoft.com/windows/servercore
COPY Install-Packages.ps1 Install-WindowsAdminCenterDsc.ps1 WindowsAdminCenter1809.5.msi ./
# Install nuget version 2.8.5.201 or above and install PSDscResources Powershell module (with admin rights)
RUN powershell -noprofile -command "&{ start-process powershell -ArgumentList '-noprofile -file C:\Install-Packages.ps1' -verb RunAs}"
# Install Windows Admin Center by default on port 6516 (with admin rights)
RUN powershell -noprofile -command "&{ start-process powershell -ArgumentList '-noprofile -file C:\Install-WindowsAdminCenterDsc.ps1' -verb RunAs}"