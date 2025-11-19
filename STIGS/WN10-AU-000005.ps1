<#
.SYNOPSIS
    This PowerShell script configures an audit of account logon credential validation failures.

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

.DESCRIPTION
    Security Rationale: Failed authentication attempts are primary indicators of active attacks often 
    occurring before successful breaches. Auditing credential validation failures detects brute force 
    attacks through repeated password attempts against single accounts, identifies password spraying 
    campaigns testing common passwords across multiple accounts, reveals credential stuffing using 
    leaked password databases, exposes account enumeration reconnaissance, distinguishes automated 
    attacks from legitimate user typos through timing and pattern analysis, provides early warning to 
    stop attacks before success, detects insider threats attempting privilege escalation, and enables 
    rapid response while attacks are still failing rather than after successful compromise.
#>

$Subcategory = "Credential Validation"
$auditResult = AuditPol /set /subcategory:"$Subcategory" /failure:enable

if ($LASTEXITCODE -eq 0) {
    Write-Host "Audit Credential Validation (Failure) has been configured successfully."
} else {
    Write-Host "Failed to configure Audit Credential Validation policy. Error code: $LASTEXITCODE"
}
gpupdate /force
