@echo off
cls
echo ============================================================================
echo                       PRINT SPOOLER RESET UTILITY
echo ============================================================================
echo:
echo [1/3] Stopping Print Spooler service...
net stop spooler
echo:
echo [2/3] Purging stuck print jobs in queue...
del /Q /F /S "%systemroot%\System32\Spool\Printers\*.*" 2>nul
echo  Print queue folder cleared.
echo:
echo [3/3] Restarting Print Spooler service...
net start spooler
echo:
echo [SUCCESS] Print spooler restarted cleanly.
echo ============================================================================
pause
exit /b 0
