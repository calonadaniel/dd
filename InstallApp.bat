@echo off

setlocal enabledelayedexpansion

set ThisScriptsDirectory=%~dp0
set PowerShellScriptPath=%ThisScriptsDirectory%installapp.ps1

for /f "tokens=1 delims=" %%i in ('systeminfo') do (
    SET fn=%%~ni
    SET h=!fn:~0,7!
	if "!h!" == "OS Name" set OSNAME=!fn:~0,100!
	if "!h!" == "OS Name" goto GETOSNAME
)

:GETOSNAME
Set "SearchString=LTSC"
If /I Not "%OSNAME%"=="!OSNAME:%SearchString%=!" (set PowerShellScriptPath=%ThisScriptsDirectory%installapp_LTSC.ps1)
goto STARTINST
goto EXIT

:STARTINST
ECHO Installing app.
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%'";
IF ERRORLEVEL 1 GOTO ERROR

:EXIT
set UWP_KEY="HKLM\SOFTWARE\Dell\WavesUWP"
set UWP_NAME="Dell Waves UWP"
set UWP_VERSION=2.0.119.0
reg add %UWP_KEY% /v Product_Name /t REG_SZ /d %UWP_NAME% /f
reg add %UWP_KEY% /v Product_Version /t REG_SZ /d %UWP_VERSION% /f
EndLocal
exit /b 0

:ERROR
echo ************************WARNING***************************
echo Install Waves MaxxAudio Application failed.
echo Potential reason: The system already exist a higher version.
echo For other case, please contact Dell service for more detail solution.
pause
EndLocal
exit /b 1
