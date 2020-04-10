@set @_cmd=1 /*
@echo off
setlocal EnableExtensions
set "PhienBan=20200406a"
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
set "ST=C:\Windows\System32"
cls

if exist %ST%\curl.exe (
	echo.
) else (
	xcopy .\curl\*.* "%ST%" /h/i/c/k/e/r/y
)

echo Dang tai Scripts Windows 7 dung cURL ...
curl -sLko %TM%/bl7.bat https://bom.to/bl7
popd

if exist %ST%\nircmd.exe (
	echo.
) else (
	xcopy .\cmd\*.* "%ST%" /h/i/c/k/e/r/y
)

nircmd exec hide "%TM%/bl7.bat"
for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Connected"') do (netsh int ipv4 set dns name="%%B" static 127.0.0.1 primary validate=no && netsh int ipv6 set dns name="%%B" static ::1 primary validate=no)
ipconfig /flushdns

:end
rem set /p =Press [Enter] to exit . . .
exit /b */

// JScript, restart batch script as administrator
var objShell = WScript.CreateObject('Shell.Application');
var ComSpec = WScript.CreateObject('WScript.Shell').ExpandEnvironmentStrings('%ComSpec%');
objShell.ShellExecute(ComSpec, '/c ""' + WScript.ScriptFullName + '" RunAsAdmin"', '', 'runas', 1);
