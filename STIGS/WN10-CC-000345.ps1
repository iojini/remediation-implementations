<#
.SYNOPSIS
    This PowerShell script disables Basic authentication for the WinRM service.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000345  

.DESCRIPTION
    Security Rationale: Basic authentication transmits credentials as base64-encoded text which is 
    trivially decoded, not encrypted. Disabling Basic authentication for WinRM prevents immediate 
    credential exposure through network sniffing, stops attackers from instantly decoding captured 
    administrator passwords, eliminates man-in-the-middle attacks that reveal credentials in plain text, 
    and forces the use of strong authentication methods like Kerberos or certificates that never 
    transmit passwords over the network. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"
$ValueName = "AllowBasic"
$ValueData = 0

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "WinRM service Basic authentication is now disabled."
