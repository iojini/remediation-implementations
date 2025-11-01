<#
.SYNOPSIS
    This PowerShell script configures the "Change the system time" user right to only include Administrators, LOCAL SERVICE, and NT SERVICE\autotimesvc.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-UR-000035  

.USAGE
    PS C:\> .\STIG-ID-WN10-UR-000035.ps1 
#>

# Export current security policy
$secpolPath = "$env:TEMP\secpol.cfg"
secedit /export /cfg $secpolPath | Out-Null

# Read the configuration
$secpolContent = Get-Content $secpolPath

# Define the SIDs and service accounts for the allowed groups
# S-1-5-32-544 = Administrators
# S-1-5-19 = LOCAL SERVICE
# NT SERVICE\autotimesvc = Windows Time Service (added in v1909)
$allowedGroups = "*S-1-5-32-544,*S-1-5-19,*S-1-5-80-3880718306-3832830129-1677859214-2598158968-1052248003"

# Update the SeSystemtimePrivilege setting
$newContent = $secpolContent -replace "SeSystemtimePrivilege\s*=.*", "SeSystemtimePrivilege = $allowedGroups"

# If the setting doesn't exist, add it
if ($secpolContent -notmatch "SeSystemtimePrivilege") {
    $newContent += "`nSeSystemtimePrivilege = $allowedGroups"
}

# Save the modified configuration
$newContent | Set-Content $secpolPath

# Apply the modified security policy
secedit /configure /db C:\Windows\security\local.sdb /cfg $secpolPath /areas USER_RIGHTS | Out-Null

# Clean up temp file
Remove-Item $secpolPath -Force

Write-Host "'Change the system time' user right has been configured correctly." -ForegroundColor Green

# Verify the setting
Write-Host "`nVerifying configuration:" -ForegroundColor Cyan
Write-Host "Run 'secpol.msc' and navigate to Security Settings > Local Policies > User Rights Assignment" -ForegroundColor Cyan
Write-Host "to verify 'Change the system time' contains only:" -ForegroundColor Cyan
Write-Host "  - Administrators" -ForegroundColor Yellow
Write-Host "  - LOCAL SERVICE" -ForegroundColor Yellow
Write-Host "  - NT SERVICE\autotimesvc (if Windows 10 v1909 or later)" -ForegroundColor Yellow

# Apply group policy update
gpupdate /force
