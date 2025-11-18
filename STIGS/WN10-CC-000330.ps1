<#
.SYNOPSIS
    This PowerShell script disables Basic authentication for the WinRM client.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000330  

.DESCRIPTION
    Security Rationale: Basic authentication transmits credentials as base64-encoded text which is 
    trivially decoded, not encrypted. Disabling Basic authentication for WinRM client prevents 
    credential exposure when connecting to remote systems, stops rogue server attacks that capture 
    administrator passwords, eliminates man-in-the-middle attacks through protocol downgrade, protects 
    against DNS spoofing scenarios, and forces the use of strong authentication methods like Kerberos 
    or certificates that never transmit passwords over the network. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
$ValueName = "AllowBasic"
$ValueData = 0

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "WinRM client Basic authentication is now disabled."
