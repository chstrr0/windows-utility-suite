@echo off
TITLE Windows Utility Automation Suite v1.0
COLOR 0A
SETLOCAL EnableDelayedExpansion

cd /d "%~dp0"

:CHECK_ADMIN
net session >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    COLOR 0C
    echo Administrator rights required. Please right-click main.bat and Run as administrator.
    pause
    exit /b 1
)

:MENU
cls
COLOR 0A
echo ============================================================================
echo                     WINDOWS UTILITY AUTOMATION SUITE v1.0
echo ============================================================================
echo  [1] Network Diagnostics        - IP, DNS Flush, Ping Test, Routing
echo  [2] Active Directory and Domain - User Info, Logon Server, Group Memberships
echo  [3] Network Drive Re-Mapper    - Clear and Remap Shares
echo  [4] System and Hardware Audit   - Serial, Asset Tag, OS Specs, Uptime
echo  [5] Print Spooler Reset        - Clear Stuck Queue and Restart Service
echo  [6] System Temp and Cache Clean - Purge Temp Files, DNS, Windows Update Cache
echo  [7] Group Policy Refresh       - Force GPUpdate and Display Applied Policies
echo  [8] Security and Defender Status - Antivirus, Firewall, Open Ports
echo  [9] Software Inventory Audit   - List Installed Programs and Version Info
echo  [10] Windows Health Repair     - SFC Scan and DISM Image Repair
echo ----------------------------------------------------------------------------
echo  [X] Exit Suite
echo ============================================================================
set "CHOICE="
set /p CHOICE="Select an option [1-10 or X]: "

if "%CHOICE%"=="1"  call "%~dp0tools\net-diag.bat"
if "%CHOICE%"=="2"  call "%~dp0tools\domain-check.bat"
if "%CHOICE%"=="3"  call "%~dp0tools\remap-shares.bat"
if "%CHOICE%"=="4"  call "%~dp0tools\sys-info.bat"
if "%CHOICE%"=="5"  call "%~dp0tools\reset-spooler.bat"
if "%CHOICE%"=="6"  call "%~dp0tools\clean-cache.bat"
if "%CHOICE%"=="7"  call "%~dp0tools\update-policy.bat"
if "%CHOICE%"=="8"  call "%~dp0tools\security-check.bat"
if "%CHOICE%"=="9"  call "%~dp0tools\software-audit.bat"
if "%CHOICE%"=="10" call "%~dp0tools\win-health.bat"
if /I "%CHOICE%"=="X" exit /b 0

goto MENU
