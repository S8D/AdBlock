@echo off
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/Den', '%cd%\Den.txt') }"
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/ipDen', '%cd%\ipDen.txt') }"
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/Chuyen', '%cd%\Chuyen.txt') }"
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/Choang', '%cd%\Choang.txt') }"
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://bom.to/trang', '%cd%\Trang.txt') }"
powershell -command "restart-service dnscrypt-proxy -force"
powershell -command "restart-service DNSCrypt -force"