@echo off
cls
echo ============================================================================
echo                       NETWORK DRIVE RE-MAPPER UTILITY
echo ============================================================================
echo:
echo Existing Mapped Drives:
net use
echo:
set "REMAP_CONFIRM="
set /p REMAP_CONFIRM="Do you want to disconnect existing mapped drives and remap? (Y/N): "
if /I "%REMAP_CONFIRM%"=="Y" goto DO_REMAP
goto END

:DO_REMAP
echo:
echo Disconnecting stale network connections...
net use * /delete /yes

echo:
echo Remapping Corporate Shares...
echo [INFO] Custom drive mapping commands completed. (Update script with your server UNC paths)

echo:
echo Updated Mapped Drives:
net use

:END
echo:
echo ============================================================================
pause
exit /b 0
