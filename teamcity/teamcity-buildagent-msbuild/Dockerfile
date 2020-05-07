FROM jetbrains/teamcity-agent:2018.2.3-windowsservercore-1809

SHELL ["powershell"]

# Install Windows features to enable ASP.NET building
RUN Install-WindowsFeature NET-Framework-45-ASPNET ; \
Install-WindowsFeature Web-Asp-Net45

ADD install-script.ps1 /windows/temp/install-script.ps1
RUN powershell.exe -executionpolicy bypass c:\windows\temp\install-script.ps1