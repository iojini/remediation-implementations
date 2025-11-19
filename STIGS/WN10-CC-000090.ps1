<#
.SYNOPSIS
    This PowerShell script sets the registry value to ensure Group Policy objects are reprocessed even if they haven't changed.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000090

.DESCRIPTION
    Security Rationale: Without reprocessing, attackers who gain temporary administrative access can 
    disable security controls locally and those malicious changes persist until the Group Policy Object 
    is modified. Enabling reprocessing ensures unauthorized modifications are automatically reversed 
    at every refresh cycle, prevents ransomware from permanently disabling Windows Defender, removes 
    backdoor administrator accounts within two hours, restores disabled audit logging and firewall 
    settings, limits the attack window for privilege escalation, and maintains continuous security 
    baseline enforcement without requiring GPO changes. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
$ValueName = "NoGPOListChanges"
$ValueData = 0

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Group Policy will now be reprocessed even if objects have not changed."
