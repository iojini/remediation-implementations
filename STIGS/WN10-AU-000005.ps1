<#
.SYNOPSIS
    This PowerShell script disables camera access from the lock screen.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000005

.USAGE
    PS C:\> .\STIG-ID-WN10-AU-000005.ps1 
#>

$Subcategory = "Credential Validation"
$auditResult = AuditPol /set /subcategory:"$Subcategory" /failure:enable

if ($LASTEXITCODE -eq 0) {
    Write-Host "Audit Credential Validation (Failure) has been configured successfully."
} else {
    Write-Host "Failed to configure Audit Credential Validation policy. Error code: $LASTEXITCODE"
}
gpupdate /force
