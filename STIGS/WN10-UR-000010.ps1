<#
.SYNOPSIS
    This PowerShell script configures the "Access this computer from the network" user right to only include Administrators and Remote Desktop Users groups.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-UR-000010  

.DESCRIPTION
    Security Rationale: The "Access this computer from the network" privilege controls who can 
    connect to the system over the network to access shared resources like file shares, printers, 
    and remote administration tools. Limiting this to Administrators and Remote Desktop Users 
    helps to prevents lateral movement attacks, unauthorized network share access, privilege 
    escalation attacks, and insider threats from compromised standard user accounts. 
#>

# Export current security policy
$secpolPath = "$env:TEMP\secpol.cfg"
secedit /export /cfg $secpolPath | Out-Null

# Read the configuration
$secpolContent = Get-Content $secpolPath

# Define the SIDs for the allowed groups
# S-1-5-32-544 = Administrators
# S-1-5-32-555 = Remote Desktop Users
$allowedGroups = "*S-1-5-32-544,*S-1-5-32-555"

# Update the SeNetworkLogonRight setting
$newContent = $secpolContent -replace "SeNetworkLogonRight\s*=.*", "SeNetworkLogonRight = $allowedGroups"

# If the setting doesn't exist, add it
if ($secpolContent -notmatch "SeNetworkLogonRight") {
    $newContent += "`nSeNetworkLogonRight = $allowedGroups"
}

# Save the modified configuration
$newContent | Set-Content $secpolPath

# Apply the modified security policy
secedit /configure /db C:\Windows\security\local.sdb /cfg $secpolPath /areas USER_RIGHTS | Out-Null

# Clean up temp file
Remove-Item $secpolPath -Force

Write-Host "'Access this computer from the network' user right has been configured to include only Administrators and Remote Desktop Users." -ForegroundColor Green

# Verify the setting
Write-Host "`nVerifying configuration:" -ForegroundColor Cyan
Write-Host "Run 'secpol.msc' and navigate to Security Settings > Local Policies > User Rights Assignment" -ForegroundColor Cyan
Write-Host "to verify 'Access this computer from the network' contains only:" -ForegroundColor Cyan
Write-Host "  - Administrators" -ForegroundColor Yellow
Write-Host "  - Remote Desktop Users" -ForegroundColor Yellow

# Apply group policy update
gpupdate /force
