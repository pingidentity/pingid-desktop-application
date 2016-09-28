@echo off
set res="F"
if "%1" == "Enable" set res="T"
if "%1" == "enable" set res="T"
if "%1" == "Disable" set res="T"
if "%1" == "disable" set res="T"
if %res%=="T" (
echo "Set Automatic Updates to %1"
if "%PROCESSOR_ARCHITECTURE%" == "x86" (
reg add HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Prefs\com\pingidentity\pingid\pctoken\/P/R/O/D/U/C/T/I/O/N /v autoupdatemode /t REG_SZ /d %1
) else (
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\JavaSoft\Prefs\com\pingidentity\pingid\pctoken\/P/R/O/D/U/C/T/I/O/N /v autoupdatemode /t REG_SZ /d %1
)) else (
echo "Error: %1 is not a valid input, only Enable or Disable can be selected"
)
