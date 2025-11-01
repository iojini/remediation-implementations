<#
.SYNOPSIS
    This PowerShell script sets the required registry value for Windows Telemetry.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000205

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000205.ps1 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$ValueName = "AllowTelemetry"
$ValueData = 1    # set to 0 for "Security", 1 for "Basic", or 2 for limited "Enhanced" as needed

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the AllowTelemetry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Windows Telemetry level has been configured according to policy."
