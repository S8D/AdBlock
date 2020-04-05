@set @_cmd=1 /*
@echo off
setlocal EnableExtensions
set "PhienBan=20200405a"
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
