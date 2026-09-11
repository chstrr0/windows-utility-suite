@echo off
cls
echo ============================================================================
echo                     INSTALLED SOFTWARE INVENTORY
echo ============================================================================
echo:
echo Fetching installed applications (this may take a few seconds)...
echo:
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall', 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall' -ErrorAction SilentlyContinue | ForEach-Object { try { Get-ItemProperty $_.PsPath -ErrorAction Stop } catch {} } | Where-Object { $_.DisplayName } | Select-Object DisplayName, DisplayVersion, Publisher | Sort-Object DisplayName | Format-Table -AutoSize"
echo:
echo ============================================================================
pause
exit /b 0