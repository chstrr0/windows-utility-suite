@echo off
cls
echo ============================================================================
echo                    WINDOWS HEALTH AND SYSTEM REPAIR
echo ============================================================================
echo  This tool performs:
echo   1. SFC Scan (System File Checker) - Fixes corrupted system files
echo   2. DISM Scan (Deployment Image Servicing) - Repairs Windows Component Store
echo:
echo  NOTE: Scans can take 10-20 minutes depending on your disk speed.
echo ============================================================================
echo:
set "CONFIRM="
set /p CONFIRM="Do you want to proceed with system repair scan? (Y/N): "

if /I "%CONFIRM%"=="Y" goto DO_HEALTH_CHECK
goto CANCELLED

:DO_HEALTH_CHECK
echo:
echo [1/2] Running System File Checker (SFC Scan)...
sfc /scannow
echo:
echo [2/2] Running DISM Component Store Health Check and Repair...
dism /online /cleanup-image /restorehealth
echo:
echo [SUCCESS] Health check script sequence finished.
goto END

:CANCELLED
echo:
echo [INFO] Health Repair cancelled by user.

:END
echo ============================================================================
pause
exit /b 0