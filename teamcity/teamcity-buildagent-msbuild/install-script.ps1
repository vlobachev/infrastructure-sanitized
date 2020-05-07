### CONFIGURATION

Invoke-WebRequest "https://aka.ms/vs/16/release/vs_buildtools.exe" -OutFile BuildTools.exe;

## Install 2019 Build Tools
Start-Process BuildTools.exe -Wait -ArgumentList --norestart, --nocache, --all, --quiet, --remove, Microsoft.VisualStudio.Component.Windows10SDK.10240, --remove, Microsoft.VisualStudio.Component.Windows10SDK.10586, --remove, Microsoft.VisualStudio.Component.Windows10SDK.14393, --remove, Microsoft.VisualStudio.Component.Windows81SDK; 
Remove-Item -Force BuildTools.exe;

## Install .Net Core SDK
Invoke-WebRequest "https://download.visualstudio.microsoft.com/download/pr/4a195fc9-7696-4c24-add2-e791b399766c/3a67d698a74505b46db9d9779745e47b/dotnet-sdk-2.2.104-win-x64.exe" -OutFile NetCoreSdk_2.2.exe ; 
Start-Process NetCoreSdk_2.2.exe -Wait -ArgumentList /install, /quiet, /norestart ;

remove-Item -Force NetCoreSdk_2.2.exe

## Install NUGET

$nugetfile = "nuget.exe"
$nuget_exe = "$PSScriptRoot\$nugetfile"
$nuget_url = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe";

if ((Test-Path $nuget_exe) -eq $false) {
	write-host "[NUGET] Downloading nuget"
	write-host "url : $nuget_url"
	$start_time = Get-Date
	$wc = New-Object System.Net.WebClient
	$wc.DownloadFile($nuget_url, $nuget_exe)
	write-Output "$nugetfile downloaded"
	write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
}

$buildToolsDirectory = "C:\agentBuildTools\";

if ((Test-Path $buildToolsDirectory) -eq $false) {
	mkdir "$buildToolsDirectory";
}

#Install SSDT
nuget install Microsoft.Data.Tools.MSBuild -ExcludeVersion -OutputDirectory "$buildToolsDirectory"

$currentEnvPath = [System.Environment]::GetEnvironmentVariable("PATH", "MACHINE");
[System.Environment]::SetEnvironmentVariable("PATH", "$($currentEnvPath);$($buildToolsDirectory)Microsoft.Data.Tools.MsBuild\lib\net46", "MACHINE");
[System.Environment]::SetEnvironmentVariable("SQLDBExtensionRefPath", "$($buildToolsDirectory)Microsoft.Data.Tools.MsBuild\lib\net46", "MACHINE");
[System.Environment]::SetEnvironmentVariable("SSDTPath", "$($buildToolsDirectory)Microsoft.Data.Tools.MsBuild\lib\net46", "MACHINE");

# When Teamcity supports 2019 build tools, this can be removed"
Copy-Item "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\MSBuild\Microsoft\VisualStudio\v16.0\SSDT" "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\Microsoft\VisualStudio\v15.0\"

# nodejs
$version = "10.15.2"
$arch = "x64";
$url = "https://nodejs.org/dist/v$version/node-v$version-$arch.msi"

# npm packages
$gulp_version = ">=1.2.2 <1.3.0"

### download nodejs msi file
# warning : if a node.msi file is already present in the current folder, this script will simply use it
	
write-host "`n----------------------------"
write-host "  nodejs msi file retrieving  "
write-host "----------------------------`n"

$filename = "node.msi"
$node_msi = "$PSScriptRoot\$filename"

$download_node = $TRUE

if (Test-Path $node_msi) {
	$confirmation = read-host "Local $filename file detected. Do you want to use it ? [Y/n]"
	if ($confirmation -eq "n") {
		$download_node = $FALSE
	}
}

if ($download_node) {
	write-host "[NODE] downloading nodejs install"
	write-host "url : $url"
	$start_time = Get-Date
	$wc = New-Object System.Net.WebClient
	$wc.DownloadFile($url, $node_msi)
	write-Output "$filename downloaded"
	write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
} else {
	write-host "using the existing node.msi file"
}

### nodejs install

write-host "`n----------------------------"
write-host " nodejs installation  "
write-host "----------------------------`n"

write-host "[NODE] running $node_msi"
Start-Process $node_msi -Wait

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
   
write-host "Installing gulp-cli"
npm install --global gulp-cli@"$gulp_version"

write-host "Done !"