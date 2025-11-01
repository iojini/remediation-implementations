<#
.SYNOPSIS
    This PowerShell script sets the registry value to prevent users from ignoring Windows Defender SmartScreen filter warnings in Microsoft Edge.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000235

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000235.ps1 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter"
$ValueName = "PreventOverrideAppRepUnknown"
$ValueData = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "SmartScreen override for unverified files in Microsoft Edge is now disabled."
