@echo off
cls
echo ============================================================================
echo                      SECURITY AND DEFENDER STATUS
echo ============================================================================
echo:
echo [1/3] Windows Defender Status:
powershell -Command "Get-MpComputerStatus | Select-Object AntivirusEnabled, RealTimeProtectionEnabled, AntivirusSignatureLastUpdated | Format-List"
echo:
echo [2/3] Windows Firewall Profiles Status:
netsh advfirewall show allprofiles state
echo:
echo [3/3] Listening Ports and Active Connections Summary:
netstat -ano | findstr /C:"LISTENING" | findstr /V "127.0.0.1"
echo:
echo ============================================================================
pause
exit /b 0
