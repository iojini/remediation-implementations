<#
.SYNOPSIS
    This PowerShell script sets the registry value to prevent users from changing installation options.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000310  

.DESCRIPTION
    Security Rationale: Allowing users to modify installation options enables security control bypass 
    through installing to unprotected locations, disabling security features, or selecting dangerous 
    components. Preventing installation option changes stops DLL hijacking attacks in user-writable 
    directories, prevents application whitelisting bypass, ensures consistent security configurations 
    across the organization, blocks privilege escalation through malicious installation paths, and 
    maintains administrator control over security-relevant installation parameters. 
#>


$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$ValueName = "EnableUserControl"
$ValueData = 0

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "User control over Windows Installer options is now disabled."
