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

.USAGE
    PS C:\> .\STIG-ID-WN10-SO-000255.ps1 
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
