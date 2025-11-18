<#
.SYNOPSIS
    This PowerShell script configures UAC to prompt administrators for consent on the secure desktop.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000250  

.DESCRIPTION
    Security Rationale: User Account Control (UAC) limits privilege escalation by requiring 
    acknowledgment for elevated tasks. Prompting administrators for consent on the secure desktop 
    prevents silent privilege escalation by malware, blocks malicious software from spoofing or 
    manipulating UAC prompts, creates an audit trail of elevated actions, and ensures administrators 
    consciously approve privilege changes in an isolated environment that malware cannot interact with. 
#>

# Define registry path and target value
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$ValueName = "ConsentPromptBehaviorAdmin"
$ValueData = 2

# Create key if not present
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Apply the required value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "UAC behavior for administrators is now set to 'Prompt for consent on the secure desktop'."
