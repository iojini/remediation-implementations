<#
.SYNOPSIS
    This PowerShell script sets the required registry values for BitLocker startup PIN enforcement.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031  

.USAGE
    PS C:\> .\STIG-ID-WN10-00-000031.ps1 
#>


$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Ensure the registry path exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set required BitLocker PIN values for pre-boot authentication
New-ItemProperty -Path $RegPath -Name "UseAdvancedStartup" -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $RegPath -Name "UseTPMPIN" -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $RegPath -Name "UseTPMKeyPIN" -Value 1 -PropertyType DWord -Force | Out-Null

Write-Host "BitLocker PIN pre-boot authentication settings have been remediated for compliance."
