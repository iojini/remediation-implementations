<#
.SYNOPSIS
    This PowerShell script disables slide shows on the lock screen.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000010

.DESCRIPTION
    Security Rationale: Lock screen slide shows display images from the Pictures folder to anyone 
    with physical proximity when the workstation is locked. Disabling this prevents exposure of 
    screenshots containing confidential business data, stops display of patient medical records that 
    violate HIPAA, eliminates classified information leaks to unauthorized personnel, prevents social 
    engineering reconnaissance from personal photos revealing family and home details, protects against 
    accidental display of credentials or network diagrams, and ensures sensitive information remains 
    accessible only to authenticated users. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$ValueName = "NoLockScreenSlideshow"
$ValueData = 1

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Lock screen slide show has been disabled as required by policy."
