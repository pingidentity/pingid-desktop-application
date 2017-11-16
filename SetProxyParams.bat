@echo off
set _argcActual=0
set validator="F"

echo.

for %%i in (%*) do set /A _argcActual+=1

if %_argcActual% EQU 0 goto:_USAGE

if %_argcActual% EQU 1 (
    if "%1" EQU "Disable" (
       set validator="T"       
    )
    if "%1" EQU "disable" (
        set validator="T"        
    )
    goto:_SET
)

if %_argcActual% EQU 2 (
    set validator="T"
    goto:_SET 
)

if %_argcActual% EQU 3 (
        if "%3" EQU "r" set validator="T"
        if "%3" EQU "-r" set validator="T" 
        if "%3" EQU "R" set validator="T"
        if "%3" EQU "-R" set validator="T"
        if "%3" EQU "restrictive" set validator="T"
        if "%3" EQU "Restrictive" set validator="T" 
	goto:_SET
)

if %_argcActual% EQU 4 (
    set validator="T"
    goto:_SET
)

if %_argcActual% EQU 5 (
        if "%5" EQU "r" set validator="T"
        if "%5" EQU "-r" set validator="T" 
        if "%5" EQU "R" set validator="T"
        if "%5" EQU "-R" set validator="T"
        if "%5" EQU "restrictive" set validator="T"
        if "%5" EQU "Restrictive" set validator="T" 
	goto:_SET
)

:_SET
if %validator% EQU "T" (
    echo "Set Proxy Parameters to: %*"
    if "%PROCESSOR_ARCHITECTURE%" EQU "x86" (
        "%PROGRAMFILES%\Ping Identity\PingID\ProxyHelperSetup.exe" %*
        goto:_END
    ) else (
        "%PROGRAMFILES(x86)%\Ping Identity\PingID\ProxyHelperSetup.exe" %*
        goto:_END
    )
) else (
    goto:_USAGE
)

:_USAGE
echo "Usage: enter proxy host and port separated by whitespace. If your proxy requires authentication add username and password as third and fourth parameters. If you want to disable the proxy - enter "disable" as only parameter. If you want to use proxy in restrictive mode add "-r" as the last parameter. "

:_END
echo.