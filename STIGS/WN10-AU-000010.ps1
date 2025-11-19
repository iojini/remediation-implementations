<#
.SYNOPSIS
    This PowerShell script enables auditing of credential validation successes.

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

.DESCRIPTION
    Security Rationale: Credential validation events logged on domain controllers and local systems 
    provide critical visibility into authentication activity. Auditing successful validations detects 
    password spraying attacks through high-volume authentication patterns across multiple accounts, 
    identifies compromised credentials used from anomalous locations or unusual times, reveals lateral 
    movement via pass-the-hash attacks using NTLM authentication, tracks privileged account usage for 
    unauthorized administrative access, exposes account sharing through impossible travel detection, 
    enables complete forensic timeline reconstruction during breach investigations, and provides audit 
    trails required for PCI-DSS HIPAA and SOX compliance to track authentication to systems containing 
    sensitive data. 
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
