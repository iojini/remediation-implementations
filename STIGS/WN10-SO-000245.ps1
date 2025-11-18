<#
.SYNOPSIS
    This PowerShell script enables User Account Control approval mode for the built-in Administrator account.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000245  

.DESCRIPTION
    Security Rationale: User Account Control (UAC) Admin Approval Mode ensures the built-in 
    Administrator account operates with privilege separation instead of unrestricted full privileges. 
    Enabling this prevents malware from automatically executing with admin rights, requires consent 
    for elevated operations through UAC prompts, limits the attack surface by starting applications 
    with standard user tokens, and protects against drive-by downloads and browser exploits that would 
    otherwise gain immediate full system access. 
#>

# Define registry path and setting
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$ValueName = "FilterAdministratorToken"
$ValueData = 1

# Ensure the registry key exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Apply the setting
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Admin Approval Mode for the built-in Administrator account has been enabled."
