<#
.SYNOPSIS
    This PowerShell script enables audit policy using subcategories.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030  

.DESCRIPTION
    Security Rationale: Audit policy subcategories provide granular control over security logging 
    instead of broad legacy categories. Enabling subcategories allows precise auditing of specific 
    security events, reduces log volume without losing critical data, enables faster forensic analysis 
    and incident response, improves SIEM accuracy by eliminating noise, and ensures compliance 
    requirements are met with targeted audit trails rather than overwhelming logs filled with 
    irrelevant events. 
#>


$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$ValueName = "SCENoApplyLegacyAuditPolicy"
$ValueData = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Audit policy using subcategories is now enabled."
