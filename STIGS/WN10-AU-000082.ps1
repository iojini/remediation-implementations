<#
.SYNOPSIS
    This PowerShell script enables auditing of file share access successes.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000082  

.USAGE
    PS C:\> .\STIG-ID-WN10-AU-000082.ps1 
#>

# Ensure the system uses subcategory audit policy settings
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "SCENoApplyLegacyAuditPolicy" -Value 1 -Type DWord -Force

# Enable auditing for File Share successes
$auditResult = AuditPol /set /subcategory:"File Share" /success:enable

# Check if the command was successful
if ($LASTEXITCODE -eq 0) {
    Write-Host "Audit File Share - Success has been enabled."
} else {
    Write-Host "Failed to enable Audit File Share - Success. Exit code: $LASTEXITCODE"
}
