<#
.SYNOPSIS
    This PowerShell script configures the "Back up files and directories" user right to only include the Administrators group.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-UR-000030  

.SECURITY RATIONALE
    The "Back up files and directories" privilege allows users to bypass normal
    file permissions and access ANY file on the system, including encrypted or
    restricted data. Limiting this to Administrators prevents:
    - Unauthorized data exfiltration disguised as backups
    - Privilege escalation attacks
    - Insider threats from compromised standard user accounts 
#>

# Export current security policy
$secpolPath = "$env:TEMP\secpol.cfg"
secedit /export /cfg $secpolPath | Out-Null

# Read the configuration
$secpolContent = Get-Content $secpolPath

# Define the SID for Administrators group
# S-1-5-32-544 = Administrators
$allowedGroups = "*S-1-5-32-544"

# Update the SeBackupPrivilege setting
$newContent = $secpolContent -replace "SeBackupPrivilege\s*=.*", "SeBackupPrivilege = $allowedGroups"

# If the setting doesn't exist, add it
if ($secpolContent -notmatch "SeBackupPrivilege") {
    $newContent += "`nSeBackupPrivilege = $allowedGroups"
}

# Save the modified configuration
$newContent | Set-Content $secpolPath

# Apply the modified security policy
secedit /configure /db C:\Windows\security\local.sdb /cfg $secpolPath /areas USER_RIGHTS | Out-Null

# Clean up temp file
Remove-Item $secpolPath -Force

Write-Host "'Back up files and directories' user right has been configured to include only Administrators." -ForegroundColor Green

# Verify the setting
Write-Host "`nVerifying configuration:" -ForegroundColor Cyan
Write-Host "Run 'secpol.msc' and navigate to Security Settings > Local Policies > User Rights Assignment" -ForegroundColor Cyan
Write-Host "to verify 'Back up files and directories' contains only:" -ForegroundColor Cyan
Write-Host "  - Administrators" -ForegroundColor Yellow

# Apply group policy update
gpupdate /force
