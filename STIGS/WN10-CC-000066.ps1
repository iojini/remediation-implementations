<#
.SYNOPSIS
    This PowerShell script sets the registry value to include command line data in process creation events.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000066

.DESCRIPTION
    Security Rationale: Modern attacks heavily use command-line tools and living-off-the-land binaries 
    where seeing only the process name provides insufficient context for detection. Including command 
    line arguments in process creation logs reveals obfuscated PowerShell attacks with encoded commands, 
    exposes malicious parameters used with legitimate Windows tools, enables detection of fileless 
    malware operating entirely in memory, provides complete forensic timeline reconstruction during 
    incident response, and captures decoded content of obfuscated commands that would otherwise appear 
    benign when only the executable name is logged. 
#>

$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"
$ValueName = "ProcessCreationIncludeCmdLine_Enabled"
$ValueData = 1

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Command line data will now be included in process creation events."
