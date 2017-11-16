@echo off
set res="F"
if "%1" == "Enable" set res="T"
if "%1" == "enable" set res="T"
if "%1" == "Disable" set res="T"
if "%1" == "disable" set res="T"
if %res%=="T" (
echo "Set Automatic Updates to %1"
if "%PROCESSOR_ARCHITECTURE%" == "x86" (
"%PROGRAMFILES%\Ping Identity\PingID\AutoUpdatesSetup.exe" %*
) else (
"%PROGRAMFILES(x86)%\Ping Identity\PingID\AutoUpdatesSetup.exe" %*
)) else (
echo "Error: %1 is not a valid input, only Enable or Disable can be selected"
)