@echo off
cls
echo ============================================================================
echo                      ACTIVE DIRECTORY AND DOMAIN INFO
echo ============================================================================
echo:
echo  Computer Name:    %COMPUTERNAME%
echo  Current User:     %USERNAME%
echo  Workstation State: %USERDOMAIN%
echo:

systeminfo | findstr /C:"Domain:" | findstr /I "WORKGROUP" >nul
if %ERRORLEVEL% EQU 0 goto IS_WORKGROUP
goto IS_DOMAIN

:IS_WORKGROUP
echo ----------------------------------------------------------------------------
echo  [STATUS] Standalone PC detected (WORKGROUP mode).
echo  Active Directory queries skipped to prevent domain timeout errors.
echo ----------------------------------------------------------------------------
goto END

:IS_DOMAIN
echo ----------------------------------------------------------------------------
echo Domain User Account Details:
echo ----------------------------------------------------------------------------
net user %USERNAME% /domain 2>nul

echo:
echo Workstation Network Configuration:
net config workstation | findstr /C:"Computer name" /C:"User name" /C:"Workstation domain" /C:"Logon domain"
goto END

:END
echo:
echo ============================================================================
pause
exit /b 0
