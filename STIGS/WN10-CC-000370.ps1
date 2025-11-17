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

.SECURITY_RATIONALE
    The convenience PIN must be disabled because:
    - PINs use a limited character set (0-9) making them vulnerable to brute force
    - Typical PINs are 4-6 digits vs 8+ character passwords with complexity
    - PIN keyspace: 10^6 (1 million) combinations for 6-digit PIN
    - Password keyspace: 94^8 (6+ quadrillion) combinations for 8-character complex password
    - PINs are susceptible to shoulder surfing and observation attacks
    - Automated tools like "Password Stuffer" can rapidly attempt PIN combinations

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
