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

.USAGE
    PS C:\> .\STIG-ID-WN10-AC-000020.ps1 
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
