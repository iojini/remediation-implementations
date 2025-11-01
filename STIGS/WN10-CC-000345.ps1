<#
.SYNOPSIS
    This PowerShell script disables Basic authentication for the WinRM service.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000345  

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000345.ps1 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"
$ValueName = "AllowBasic"
$ValueData = 0

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "WinRM service Basic authentication is now disabled."
