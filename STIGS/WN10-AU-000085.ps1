<#
.SYNOPSIS
    This PowerShell script enables auditing for removable storage failures.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000085

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\STIG-ID-WN10-AU-000085.ps1 
#>

# Assign the subcategory and audit setting
$Subcategory = "Removable Storage"
$AuditSetting = "Failure"

# Set the audit policy for removable storage failures using AuditPol
$auditResult = AuditPol /set /subcategory:"$Subcategory" /failure:enable

# Check if command succeeded
if ($LASTEXITCODE -eq 0) {
    Write-Host "Policy 'Audit Removable Storage' has been configured to log failures successfully."
} else {
    Write-Host "Failed to configure 'Audit Removable Storage' policy. Error code: $LASTEXITCODE"
}

#Force a group policy update
gpupdate /force
