@echo off
cls
echo ============================================================================
echo                       SYSTEM TEMP AND CACHE CLEANER
echo ============================================================================
echo:
echo [1/4] Purging User Temp Directory...
del /q /f /s "%TEMP%\*.*" 2>nul
rmdir /s /q "%TEMP%" 2>nul
mkdir "%TEMP%" 2>nul

echo [2/4] Purging Windows System Temp...
del /q /f /s "%systemroot%\Temp\*.*" 2>nul

echo [3/4] Clearing DNS Cache...
ipconfig /flushdns >nul

echo [4/4] Cleaning Windows Update Download Cache...
net stop wuauserv >nul 2>&1
del /q /f /s "%systemroot%\SoftwareDistribution\Download\*.*" 2>nul
net start wuauserv >nul 2>&1

echo:
echo [SUCCESS] System temporary files and caches cleared.
echo ============================================================================
pause
exit /b 0
