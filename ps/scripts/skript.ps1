<#
.SYNOPSIS
Powershell script

Script:                 install.ps1
Author:                 Gen Lee
Required Dependencies:  PowerShell 7
Version:                0.0.3
Date:                   2020-04-06

.DESCRIPTION
# Powershell script

#>
Set-StrictMode -Version 3

$global:Parameter = ".\ps\scripts\skript.ps1"

if (!($PSVersionTable.PSVersion.Major -gt 6)) {
    Write-Warning "This script requires PowerShell 7. Please update your PowerShell version"
    exit 1
}
if (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You are not running script as an Administrator. Please try again with Administrative privileges."
    exit 1 
}

function Show-Logo() {
    $logo = @"
                 __   __        __  
    |  | | |\ | |  \ /  \ |  | /__`
    |/\| | | \| |__/ \__/ |/\| .__/ 

"@ 	
	Write-Host $logo
}

try {
    Clear-Host
    Show-Logo
    Read-Host -Prompt "Press any key to close"
} catch {
    $e = $_
    Write-Error $e.Exception.Message
    Write-Error "Stack trace:`n$($e.ScriptStackTrace)"
    Write-Host "The above error occurred while running script"
    Write-Host "Parameters:"
    Write-Host "----------------------------------------------------------------------------------"
    Read-Host -Prompt "Press Enter to exit"
}
