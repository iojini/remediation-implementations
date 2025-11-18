<#
.SYNOPSIS
    This PowerShell script sets the registry value to prevent users from ignoring Windows Defender SmartScreen filter warnings in Microsoft Edge.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000235

.DESCRIPTION
    Security Rationale: Windows Defender SmartScreen analyzes file reputation and warns about 
    potentially malicious downloads, but users frequently bypass warnings due to warning fatigue, 
    social engineering, or task focus. Preventing bypass of SmartScreen file warnings blocks malware 
    downloads from phishing campaigns, stops drive-by downloads of unverified executables, prevents 
    ransomware delivery through fake software updates, protects against social engineering attacks 
    that pressure users to ignore warnings, and ensures cloud-based threat intelligence is enforced 
    rather than left to user judgment. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter"
$ValueName = "PreventOverrideAppRepUnknown"
$ValueData = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "SmartScreen override for unverified files in Microsoft Edge is now disabled."
