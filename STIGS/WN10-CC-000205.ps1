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

.DESCRIPTION
    Security Rationale: Full telemetry collects complete memory dumps and detailed system state 
    information that can contain sensitive data including passwords, encryption keys, classified 
    information, healthcare records, and intellectual property. Limiting telemetry to Basic level 
    prevents sensitive data exposure through memory dumps, stops compliance violations for GDPR HIPAA 
    and export control regulations, protects intellectual property from transmission outside the 
    enterprise, ensures data sovereignty requirements are met, and maintains control over potentially 
    classified or confidential information in system memory. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$ValueName = "AllowTelemetry"
$ValueData = 1    

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the AllowTelemetry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Windows Telemetry level has been configured according to policy."
