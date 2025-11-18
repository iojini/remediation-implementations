<#
.SYNOPSIS
    This PowerShell script sets the registry value to enable PowerShell script block logging.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000326  

.DESCRIPTION
    Security Rationale: PowerShell is the primary tool used by attackers for fileless malware, 
    living-off-the-land techniques, and post-exploitation activities. Enabling script block logging 
    records the actual decoded content of PowerShell commands and scripts, providing visibility into 
    obfuscated attacks, documenting malware execution chains, enabling incident response timeline 
    reconstruction, detecting credential theft and lateral movement, and creating forensic evidence 
    for investigation of compromises that operate entirely in memory without touching disk. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$ValueName = "EnableScriptBlockLogging"
$ValueData = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "PowerShell script block logging is now enabled."
