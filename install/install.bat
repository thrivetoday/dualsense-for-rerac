@echo off
setlocal
rem Installs the DualSense build of rerac.exe over the official ReRAC 0.3.6, keeping the original as rerac.exe.original.
set "DEST=%LOCALAPPDATA%\rerac\versions\official\v0.3.6-alpha"
if not exist "%DEST%\rerac.exe" (
  echo ReRAC 0.3.6 was not found in:
  echo   %DEST%
  echo Install 0.3.6 with the ReRAC Launcher first, or copy rerac.exe there by hand.
  pause
  exit /b 1
)
tasklist /fi "imagename eq rerac.exe" | find /i "rerac.exe" >nul && (
  echo Close ReRAC first, then run this again.
  pause
  exit /b 1
)
if not exist "%DEST%\rerac.exe.original" copy /y "%DEST%\rerac.exe" "%DEST%\rerac.exe.original" >nul
copy /y "%~dp0rerac.exe" "%DEST%\rerac.exe" >nul || (
  echo Could not copy rerac.exe.
  pause
  exit /b 1
)
echo DualSense support installed. Start ReRAC from the launcher as usual.
echo Settings: Options ^> Port Options (scroll down). To undo, run uninstall.bat.
pause
