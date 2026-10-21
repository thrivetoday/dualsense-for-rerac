@echo off
setlocal
rem Puts the official ReRAC 0.3.6 rerac.exe back (saved by install.bat as rerac.exe.original).
set "DEST=%LOCALAPPDATA%\rerac\versions\official\v0.3.6-alpha"
if not exist "%DEST%\rerac.exe.original" (
  echo No saved original found in:
  echo   %DEST%
  echo Reinstall 0.3.6 from the ReRAC Launcher to get the official rerac.exe back.
  pause
  exit /b 1
)
tasklist /fi "imagename eq rerac.exe" | find /i "rerac.exe" >nul && (
  echo Close ReRAC first, then run this again.
  pause
  exit /b 1
)
move /y "%DEST%\rerac.exe.original" "%DEST%\rerac.exe" >nul
echo The official ReRAC 0.3.6 is back.
pause
