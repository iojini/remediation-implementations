# Programmatic Vulnerability Remediations

## Remediations Table

| STIG ID | Description                   | Language   | Link                                                     |
|------------------|-------------------------------|------------|----------------------------------------------------------|
| WN10-00-000031            | Utilizes BitLocker PIN for pre-boot authentication | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-00-000031.ps1) |
| WN10-AC-000005            | Configures account lockout duration to 15 minutes | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AC-000005.ps1) |
| WN10-AC-000020            | Configures password history to 24 passwords | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AC-000020.ps1) |
| WN10-AU-000005            | Maintains an audit trail of account logon credential validation failures | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AU-000005.ps1) |
| WN10-AU-000010            | Maintains an audit trail of account logon credential validation successes | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AU-000010.ps1) |
| WN10-AU-000082            | Maintains an audit trail of file share successes | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AU-000082.ps1) |
| WN10-AU-000500            | Configures the application event log size to 32768 KB | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AU-000500.ps1) |
| WN10-AU-000585            | Maintains an audit trail of process creation auditing failures | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AU-000585.ps1) |
| WN10-CC-000005            | Disables camera access from the lock screen | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000005.ps1) |
| WN10-CC-000010            | Disables lock screen slide show | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000010.ps1) |
| WN10-CC-000052            | Configures prioritization of ECC Curves with longer key lengths | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000052.ps1) |
| WN10-CC-000066            | Adds command line data to process creation event logs | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000066.ps1) |
| WN10-CC-000090            | Reprocesses group policy objects even if they have not changed | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000090.ps1) |
| WN10-CC-000155            | Disables solicited remote assistance | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000155.ps1) |
| WN10-CC-000175            | Disables the application compatibility program inventory | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000175.ps1) |
| WN10-CC-000205            | Configures Windows Telemetry to Basic | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000205.ps1) |
| WN10-CC-000235            | Prevents bypassing of Windows Defender SmartScreen | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000235.ps1) |
| WN10-CC-000295            | Prevents attachments from being downloaded from RSS feeds | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000295.ps1) |
| WN10-CC-000310            | Prevents users from changing installation options | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000310.ps1) |
| WN10-CC-000326            | Enables PowerShell script block logging | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000326.ps1) |
| WN10-CC-000330            | Disables basic authentication for WinRM client | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000330.ps1) |
| WN10-CC-000345            | Disables basic authentication for WinRM service | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000345.ps1) |
| WN10-CC-000360            | Disables digest authentication for the WinRM client | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-CC-000360.ps1) |
| WN10-CC-000370            | Configures account lockout duration to 15 minutes | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AC-000005.ps1) |
| WN10-SO-000030            | Utilizes BitLocker PIN for pre-boot authentication | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-00-000031.ps1) |
| WN10-SO-000245            | Configures account lockout duration to 15 minutes | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AC-000005.ps1) |
| WN10-SO-000250            | Configures account lockout duration to 15 minutes | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AC-000005.ps1) |
| WN10-SO-000255            | Utilizes BitLocker PIN for pre-boot authentication | PowerShell | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-00-000031.ps1) |
| WN10-UR-000010            | Configures account lockout duration to 15 minutes | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AC-000005.ps1) |
| WN10-UR-000030            | Configures account lockout duration to 15 minutes | PowerShell       | [View Remediation](https://github.com/iojini/remediation-implementations/blob/main/STIGS/WN10-AC-000005.ps1) |
