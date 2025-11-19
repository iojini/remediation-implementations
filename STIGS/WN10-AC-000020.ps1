<#
.SYNOPSIS
    This PowerShell script sets the password history to 24 passwords.

.NOTES
    Author          : Irene Ojini
    LinkedIn        : https://www.linkedin.com/in/iojini/
    GitHub          : https://github.com/iojini
    Date Created    : 2025-11-01
    Last Modified   : 2025-11-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000020  

.DESCRIPTION
    Security Rationale: Users naturally resist password changes and will alternate between a small 
    set of passwords if allowed, completely undermining security policies. Enforcing 24 password 
    history prevents password reuse after compromise requiring 6+ years before reuse is possible, 
    ensures effective breach remediation by permanently retiring stolen credentials, eliminates 
    password pattern predictability that attackers exploit, prevents rapid password cycling to 
    circumvent security policies, maintains PCI-DSS HIPAA and NIST compliance for password reuse 
    prevention, and forces genuine password rotation rather than superficial changes between familiar 
    passwords. 
#>

try {
    net accounts /uniquepw:24
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Password history has been set to 24 passwords remembered." -ForegroundColor Green
        
        # Verify the setting
        Write-Host "`nVerifying configuration:" -ForegroundColor Cyan
        net accounts | Select-String "Length of password history maintained"
    } else {
        Write-Host "Failed to set password history. Error code: $LASTEXITCODE" -ForegroundColor Red
    }
} catch {
    Write-Host "Failed to configure password history. Error: $_" -ForegroundColor Red
}
