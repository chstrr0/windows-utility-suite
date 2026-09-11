@echo off
cls
echo ============================================================================
echo                          NETWORK DIAGNOSTICS SUITE
echo ============================================================================
echo:
echo [1/4] Displaying IP Configuration...
ipconfig /all | findstr /C:"Host Name" /C:"IPv4 Address" /C:"Subnet Mask" /C:"Default Gateway" /C:"DNS Servers"
echo:
echo [2/4] Flushing DNS Resolver Cache...
ipconfig /flushdns
echo:
echo [3/4] Testing Connectivity to Gateway and Internet...
ping -n 2 8.8.8.8 >nul
if %ERRORLEVEL% EQU 0 goto NET_OK
goto NET_FAIL

:NET_OK
echo  [SUCCESS] Internet connectivity verified (8.8.8.8).
goto NET_NEXT

:NET_FAIL
echo  [WARNING] Failed to reach Internet (8.8.8.8).
goto NET_NEXT

:NET_NEXT
echo:
echo [4/4] Active Network Adapters Status:
powershell -Command "Get-NetAdapter | Where-Object Status -eq 'Up' | Select-Object Name, InterfaceDescription, LinkSpeed | Format-Table -AutoSize"
echo:
echo ============================================================================
pause
exit /b 0
