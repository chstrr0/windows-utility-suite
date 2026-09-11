@echo off
cls
echo ============================================================================
echo                     GROUP POLICY REFRESH AND AUDIT
echo ============================================================================
echo:
echo [1/2] Forcing immediate Group Policy update...
gpupdate /force
echo:
echo [2/2] Generating Group Policy Applied Summary...
gpresult /R | findstr /C:"Applied Group Policy Objects" /C:"OS Configuration" /C:"Domain Name"
echo:
echo ============================================================================
pause
exit /b 0
