<#
.SYNOPSIS
    This PowerShell script disables Digest authentication for the WinRM client.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000360  

.DESCRIPTION
    Security Rationale: Digest authentication uses the weak MD5 hashing algorithm which has known 
    vulnerabilities and can be cracked with modern hardware. Disabling Digest authentication for 
    WinRM prevents man-in-the-middle attacks where attackers intercept and crack authentication hashes, 
    stops replay attacks using captured credentials, eliminates the risk of credential theft during 
    remote management sessions, and forces the use of stronger authentication methods like Kerberos 
    or certificate-based authentication. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
$ValueName = "AllowDigest"
$ValueData = 0

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "WinRM client Digest authentication is now disabled."
