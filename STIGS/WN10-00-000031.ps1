<#
.SYNOPSIS
    This PowerShell script sets the required registry values for BitLocker startup PIN enforcement.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031  

.DESCRIPTION
    Security Rationale: BitLocker with TPM-only automatically unlocks drives at boot allowing anyone 
    with physical access to reach Windows login screen and exploit vulnerabilities. Requiring pre-boot 
    PIN provides two-factor authentication combining hardware TPM possession with knowledge factor, 
    prevents stolen or lost devices from booting past encryption barrier, protects against evil maid 
    attacks installing malware during brief physical access, mitigates Windows login bypass techniques, 
    ensures HIPAA PCI-DSS and NIST 800-171 compliance for data at rest protection, safeguards 
    classified information trade secrets and patient records on mobile devices, and creates defense in 
    depth with separate pre-boot and OS-level authentication barriers. 
#>


$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Ensure the registry path exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set required BitLocker PIN values for pre-boot authentication
New-ItemProperty -Path $RegPath -Name "UseAdvancedStartup" -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $RegPath -Name "UseTPMPIN" -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $RegPath -Name "UseTPMKeyPIN" -Value 1 -PropertyType DWord -Force | Out-Null

Write-Host "BitLocker PIN pre-boot authentication settings have been remediated for compliance."
