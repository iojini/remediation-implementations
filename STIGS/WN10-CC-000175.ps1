<#
.SYNOPSIS
    This PowerShell script sets the registry value to ensure Group Policy objects are reprocessed even if they haven't changed.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000175

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000175.ps1 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat"
$ValueName = "DisableInventory"
$ValueData = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Application Compatibility Program Inventory collection and reporting to Microsoft has been disabled."
