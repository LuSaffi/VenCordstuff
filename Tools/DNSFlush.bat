@echo off
cls
netsh winsock reset
netsh int ip reset
netsh advfirewall reset
ipconfig / flushdns
ipconfig / release
ipconfig / renew
taskkill /f /IM explorer.exe
start explorer.exe
echo Success!
pause