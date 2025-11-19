<#
.SYNOPSIS
    This PowerShell script sets the account lockout duration to 15 minutes.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-10-31
    Last Modified   : 2025-10-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005

.DESCRIPTION
    Security Rationale: Account lockout duration controls how long accounts remain locked after 
    exceeding failed login thresholds. Setting 15-minute minimum duration slows automated brute force 
    attacks by 93% reducing attempts from 300 per hour to 20 per hour, provides security teams 
    detection and response windows during lockout periods, makes distributed botnet attacks impractical 
    by preventing rapid successive attempts, enables SIEM pattern correlation and investigation during 
    extended lockouts, neutralizes password spraying by forcing substantial delays between attempts, 
    balances security with usability avoiding excessive help desk burden, and ensures legitimate 
    lockouts are immediately noticed while giving security operations time to investigate before 
    attackers succeed. 
#>

# Set account lockout duration to 15 minutes
$lockoutDuration = 15

try {
    # Use net accounts to set lockout duration
    net accounts /lockoutduration:$lockoutDuration
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Account lockout duration has been set to $lockoutDuration minutes." -ForegroundColor Green
        
        # Verify the setting
        Write-Host "`nVerifying configuration:" -ForegroundColor Cyan
        net accounts | Select-String "Lockout duration"
    } else {
        Write-Host "Failed to set account lockout duration. Error code: $LASTEXITCODE" -ForegroundColor Red
    }
} catch {
    Write-Host "Failed to configure account lockout duration. Error: $_" -ForegroundColor Red
}

# Apply group policy update
gpupdate /force
