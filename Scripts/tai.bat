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
set "ST=C:\Windows\System32"
cls

if exist %ST%\curl.exe (
	echo.
	echo Dang tai bo loc DNSCrypt-Proxy ...
	echo.
	echo Dang tai Trang.txt ...
	curl -sLko %TM%/Trang.txt https://bom.to/trang
	echo Dang tai Den.txt ...
	curl -sLko %TM%/Den.txt https://bom.to/Den
	echo Dang tai ipDen.txt ...
	curl -sLko %TM%/ipDen.txt https://bom.to/ipDen
	echo Dang tai Chuyen.txt ...
	curl -sLko %TM%/Chuyen.txt https://bom.to/Chuyen
	echo Dang tai Choang.txt ...
	curl -sLko %TM%/Choang.txt https://bom.to/Choang
	goto :chaylai
) else (
	xcopy .\curl\*.* "%ST%" /h/i/c/k/e/r/y
)

if exist %ST%\wget.exe (
	echo.
	echo Dang tai bo loc DNSCrypt-Proxy ...
	echo.
	echo Dang tai Trang.txt ...
	wget -q --no-check-certificate https://bom.to/trang -O "C:\ProgramData\DNS\Trang.txt"
	echo Dang tai Den.txt ...
	wget -q --no-check-certificate https://bom.to/Den -O "C:\ProgramData\DNS\Den.txt"
	echo Dang tai ipDen.txt ...
	wget -q --no-check-certificate https://bom.to/ipDen -O "C:\ProgramData\DNS\ipDen.txt"
	echo Dang tai Chuyen.txt ...	
	wget -q --no-check-certificate https://bom.to/Chuyen -O "C:\ProgramData\DNS\Chuyen.txt"
	echo Dang tai Choang.txt ...
	wget -q --no-check-certificate https://bom.to/Choang -O "C:\ProgramData\DNS\Choang.txt"
	goto :chaylai
)

if exist %ST%\powershell.exe (
	echo.
	echo Dang tai bo loc DNSCrypt-Proxy ...
	echo.
	echo Dang tai Trang.txt ...
	powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/trang', '%cd%\Trang.txt') }"
	echo Dang tai Den.txt ...
	powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/Den', '%cd%\Den.txt') }"
	echo Dang tai ipDen.txt ...
	powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/ipDen', '%cd%\ipDen.txt') }"
	echo Dang tai Chuyen.txt ...	
	powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/Chuyen', '%cd%\Chuyen.txt') }"
	echo Dang tai Choang.txt ...
	powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/Choang', '%cd%\Choang.txt') }"
	goto :chaylai
)

:chaylai
echo Dang khoi dong lai DNSCrypt-Proxy ...
echo.
dns.exe -service stop
dns.exe -service start
popd
echo.
echo Cam on ban da dung DNSCrypt-Proxy.

:end
rem set /p =Press [Enter] to exit . . .
exit /b */

// JScript, restart batch script as administrator
var objShell = WScript.CreateObject('Shell.Application');
var ComSpec = WScript.CreateObject('WScript.Shell').ExpandEnvironmentStrings('%ComSpec%');
objShell.ShellExecute(ComSpec, '/c ""' + WScript.ScriptFullName + '" RunAsAdmin"', '', 'runas', 1);
