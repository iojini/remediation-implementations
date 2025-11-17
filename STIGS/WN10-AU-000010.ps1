<#
.SYNOPSIS
    This PowerShell script enables auditing for credential validation successes.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000010  

.USAGE
    PS C:\> .\STIG-ID-WN10-AU-000010.ps1 
#>

# Ensure the system is configured to use audit subcategories
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "SCENoApplyLegacyAuditPolicy" -Value 1 -Type DWord -Force

# Enable auditing for Credential Validation (Success)
$auditStatus = AuditPol /set /subcategory:"Credential Validation" /success:enable

# Check if the command succeeded
if ($LASTEXITCODE -eq 0) {
    Write-Host "Credential Validation Success auditing has been enabled."
} else {
    Write-Host "Failed to enable Credential Validation Success auditing. Exit code: $LASTEXITCODE"
}
