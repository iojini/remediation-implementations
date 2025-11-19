<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.DESCRIPTION
    Security Rationale: Inadequate Application event log size causes rapid log wraparound where 
    critical security events are overwritten before investigation. Configuring 32 MB minimum capacity 
    prevents loss of application-based attack evidence like SQL injection and web exploits, preserves 
    malware execution and crash indicators, retains complete forensic timelines during incidents, 
    maintains security tool detection events from antivirus and DLP solutions, supports compliance 
    requirements for log retention, prevents attackers from using log flooding to destroy evidence of 
    initial compromise, and ensures adequate capacity for high-volume security events during active 
    attacks. 
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName = "MaxSize"
$valueData = 32768  # 0x00008000 in hexadecimal

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the MaxSize value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message
Write-Host "Registry value '$valueName' set to '$valueData' at '$registryPath'."
