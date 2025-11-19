<#
.SYNOPSIS
    This PowerShell script disables solicited remote assistance.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000155  

.DESCRIPTION
    Security Rationale: Solicited Remote Assistance allows users to grant remote screen viewing and 
    control to anyone, creating a primary vector for tech support scams and social engineering attacks. 
    Disabling this prevents attackers posing as IT support from gaining full system access, stops tech 
    support scam operations that cause billions in annual losses, eliminates credential theft through 
    screen monitoring during remote sessions, prevents ransomware deployment via compromised assistance 
    connections, blocks data exfiltration by malicious helpers, and ensures remote support occurs only 
    through controlled enterprise tools with proper authentication and audit logging. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$ValueName = "fAllowToGetHelp"
$ValueData = 0

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Solicited Remote Assistance is now disabled."
