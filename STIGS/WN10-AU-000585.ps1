<#
.SYNOPSIS
    This PowerShell script enables failure auditing for Process Creation events.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000585  

.DESCRIPTION
    Security Rationale: Failed process creation attempts are critical attack indicators often more 
    valuable than successful executions. Auditing failures detects malware execution blocked by 
    antivirus, reveals privilege escalation and reconnaissance probing before attacks succeed, exposes 
    application whitelisting bypass attempts, identifies credential theft tool usage, captures complete 
    attack timelines including blocked attempts, enables behavioral analysis distinguishing attacks from 
    legitimate failures, and allows pattern recognition of systematic probing that indicates compromise 
    even when individual attempts fail.
#>

# Ensure subcategory auditing is enabled
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "SCENoApplyLegacyAuditPolicy" -Value 1 -Type DWord -Force

# Enable audit failure events for Process Creation
AuditPol /set /subcategory:"Process Creation" /failure:enable

# Check if the command succeeded
if ($LASTEXITCODE -eq 0) {
    Write-Host "Audit Process Creation for failures has been enabled."
} else {
    Write-Host "Failed to enable Audit Process Creation (Failure). Exit code: $LASTEXITCODE"
}
