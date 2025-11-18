<#
.SYNOPSIS
    This PowerShell script disables the convenience PIN sign-in feature.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370  

.DESCRIPTION
    Security Rationale: The convenience PIN feature allows users to sign in with a short PIN 
    instead of a password, significantly weakening authentication security. Disabling this prevents 
    brute force attacks against short PINs with limited combinations, eliminates shoulder surfing 
    risks where PINs are easily observed, stops password stuffing attacks using common PIN patterns, 
    and ensures users authenticate with full-strength complex passwords instead of easily compromised 
    4-6 digit PINs.

.IMPACT
    Users will need to authenticate using their full domain credentials instead of a PIN.
    This may increase login time but significantly improves security posture.
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$ValueName = "AllowDomainPINLogon"
$ValueData = 0

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Convenience PIN sign-in is now disabled."
