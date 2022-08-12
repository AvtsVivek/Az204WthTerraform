
Install-WindowsFeature -name Web-Server -IncludeManagementTools;Install-WindowsFeature -Name Web-Mgmt-Service -IncludeAllSubFeature;

Set-ItemProperty -Path 'HKLM:\\Software\\Microsoft\\WebManagement\\Server' -Name EnableRemoteManagement -Value 1


Set-Service -name WMSVC  -StartupType Automatic

Start-service WMSVC

# First download the hosting bundle and the web deploy. Then install them.

#
# Reference: https://download.visualstudio.microsoft.com/download/pr/7de08ae2-75e6-49b8-b04a-31526204fa7b/c1cee44a509495e4bb0bba49f52c719a/dotnet-hosting-6.0.7-win.exe

# Quick way to download the Windows Hosting Bundle and Web Deploy installers which may
# then be executed on the VM ...
#

#
# Set path where installer files will be downloaded ...
#

$temp_path = "c:\azuredata\"

if( ![System.IO.Directory]::Exists( $temp_path ) )
{

   Write-Output "Path not found ($temp_path), create the directory and try again"

   Break

}


#
# Download the Windows Hosting Bundle Installer for ASP.NET Core 3.1 Runtime (v3.1.0)
#
# The installer URL was obtained from:
# https://dotnet.microsoft.com/download/dotnet-core/thank-you/runtime-aspnetcore-3.1.0-windows-hosting-bundle-installer
#
# $whb_installer_url ="https://download.visualstudio.microsoft.com/download/pr/7de08ae2-75e6-49b8-b04a-31526204fa7b/c1cee44a509495e4bb0bba49f52c719a/dotnet-hosting-6.0.7-win.exe"
$whb_installer_url ="https://download.visualstudio.microsoft.com/download/pr/c5e0609f-1db5-4741-add0-a37e8371a714/1ad9c59b8a92aeb5d09782e686264537/dotnet-hosting-6.0.8-win.exe"

$whb_installer_file = $temp_path + [System.IO.Path]::GetFileName( $whb_installer_url )

Try
{

   Invoke-WebRequest -Uri $whb_installer_url -OutFile $whb_installer_file

   Write-Output ""
   Write-Output "Windows Hosting Bundle Installer downloaded"
   Write-Output "- Execute the $whb_installer_file to install the ASP.Net Core Runtime"
   Write-Output ""

}
Catch
{

   Write-Output ( $_.Exception.ToString() )

   Break

}

#
# Download Web Deploy v3.6
#
# The installer URL was obtained from:
# https://www.iis.net/downloads/microsoft/web-deploy
# x86 installer: https://download.microsoft.com/download/0/1/D/01DC28EA-638C-4A22-A57B-4CEF97755C6C/WebDeploy_x86_en-US.msi
# x64 installer: https://download.microsoft.com/download/0/1/D/01DC28EA-638C-4A22-A57B-4CEF97755C6C/WebDeploy_amd64_en-US.msi
#

$wd_installer_url = "https://download.microsoft.com/download/0/1/D/01DC28EA-638C-4A22-A57B-4CEF97755C6C/WebDeploy_amd64_en-US.msi"

$wd_installer_file = $temp_path + [System.IO.Path]::GetFileName( $wd_installer_url )

Try
{

   Invoke-WebRequest -Uri $wd_installer_url -OutFile $wd_installer_file

   Write-Output "Web Deploy installer downloaded"
   Write-Output "- Execute $wd_installer_file and choose the [Complete] option to install all components"
   Write-Output ""

}
Catch
{

   Write-Output ( $_.Exception.ToString() )

   Break

}

Start-Process -FilePath $whb_installer_file -Wait -ArgumentList /passive
net stop was /y
net start w3svc

$DataStamp = get-date -Format yyyyMMddTHHmmss
$logFile = '{0}-{1}.log' -f $wd_installer_file,$DataStamp
$MSIArguments = @(
    "/i"
    ('"{0}"' -f $wd_installer_file)
    "/qn"
    "/norestart"
    "ADDLOCAL=ALL"
    "/L*v"
    $logFile
)
Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow

net stop was /y
net start w3svc
