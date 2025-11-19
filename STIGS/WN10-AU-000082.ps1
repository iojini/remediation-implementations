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

.DESCRIPTION
    Security Rationale: File share access including administrative shares like C$ and ADMIN$ are 
    primary vectors for lateral movement and data exfiltration. Auditing successful share access 
    detects attackers moving laterally through network using administrative shares, identifies 
    ransomware propagation paths across shared folders, reveals data exfiltration through sequential 
    sensitive share connections, exposes unauthorized access to confidential network shares, enables 
    forensic reconstruction of attack timelines with source IPs and user accounts, supports behavioral 
    analysis detecting abnormal share enumeration patterns, and provides compliance audit trails for 
    HIPAA PCI-DSS and SOX requirements to track access to sensitive data.
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
