<#
.SYNOPSIS
    This PowerShell script sets the registry value to prevent attachments from being downloaded from RSS feeds.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000295  

.DESCRIPTION
    Security Rationale: RSS feeds can automatically download file attachments without user awareness, 
    creating a malware delivery vector. Preventing automatic attachment downloads stops compromised 
    feeds from silently delivering malicious executables, blocks drive-by malware distribution through 
    trusted news sources, prevents mass infections when legitimate feeds are hijacked, requires user 
    interaction before files are downloaded, and provides opportunity to verify attachment legitimacy 
    and scan for threats before opening. 
#>

$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds"
$ValueName = "DisableEnclosureDownload"
$ValueData = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the required registry value
New-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -PropertyType DWord -Force | Out-Null

Write-Host "Downloading attachments from RSS feeds is now prevented."
