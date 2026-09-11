@echo off
cls
echo ============================================================================
echo                        SYSTEM AND HARDWARE AUDIT
echo ============================================================================
echo:
echo  OS Name and Version:
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"System Boot Time"
echo:
echo  Hardware and Bios Information:
wmic bios get serialnumber, manufacturer, smbiosbiosversion /format:list 2>nul
wmic csproduct get name, vendor, identifyingnumber /format:list 2>nul
echo:
echo  CPU and Memory Summary:
wmic cpu get name, maxclockspeed, numberofcores /format:list 2>nul
powershell -Command "Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum | ForEach-Object { 'Total RAM: ' + [math]::round($_.Sum / 1GB, 2) + ' GB' }"
echo:
echo  Disk Drives Space Status:
powershell -Command "Get-Volume | Where-Object DriveLetter -ne $null | Select-Object DriveLetter, FileSystemLabel, @{Name='Size(GB)';Expression={[math]::round($_.Size/1GB,2)}}, @{Name='Free(GB)';Expression={[math]::round($_.SizeRemaining/1GB,2)}} | Format-Table -AutoSize"
echo:
echo ============================================================================
pause
exit /b 0
