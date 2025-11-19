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
    STIG-ID         : WN10-CC-000005

.DESCRIPTION
    Security Rationale: Lock screen camera access allows anyone with physical proximity to use the 
    device camera without authentication, completely bypassing access controls. Disabling this prevents 
    unauthorized photography of confidential documents and workspace materials, stops capture of security 
    badges and credentials for cloning or impersonation, eliminates facility reconnaissance through 
    photographing security equipment and layouts, prevents privacy violations from unauthorized personnel 
    photography, ensures camera usage requires authenticated access with audit trails for accountability, 
    and maintains compliance with HIPAA PCI-DSS and NIST 800-171 physical access control requirements. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$ValueName = "NoLockScreenCamera"
$ValueData = 1

# If the key doesn't exist, create it
If (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Camera access from lock screen has been disabled."
