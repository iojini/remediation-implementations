<#
.SYNOPSIS
    This PowerShell script sets the registry value to prioritize ECC curves with longer key lengths first.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000052  

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000052.ps1 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"
$ValueName = "EccCurves"
$ValueData = [string[]]@("NistP384","NistP256")

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the REG_MULTI_SZ value for prioritized ECC curves
Set-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData

Write-Host "ECC curve order prioritized: NistP384, NistP256."
