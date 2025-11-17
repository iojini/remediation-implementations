<#
.SYNOPSIS
    This PowerShell script configures UAC to automatically deny elevation requests for standard users.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000255  

.DESCRIPTION
    Security Rationale: User Account Control (UAC) prevents privilege escalation by controlling 
    elevation requests. Automatically denying elevation requests for standard users prevents 
    credential theft through fake UAC prompts, stops social engineering attacks that trick users 
    into entering admin passwords, prevents credential exposure in compromised standard user sessions, 
    and enforces separation of duties by requiring administrative tasks to be performed from dedicated 
    admin accounts rather than elevating from standard user sessions. 
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


# Define registry path and value
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$ValueName = "ConsentPromptBehaviorUser"
$ValueData = 0

# Ensure the path exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Apply the setting
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWORD -Force | Out-Null

Write-Host "Standard user elevation requests are now automatically denied (ConsentPromptBehaviorUser = 0)."
