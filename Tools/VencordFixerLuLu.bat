@echo off
title Vencord Fix time :3
setlocal
set url = "https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9050/DiscordSetup.exe"
:discordInstaller
SET /P hasDiscordInstaller=Do you already have the discord installer? (Y/N)
IF /I "%hasDiscordInstaller%" NEQ "N" GOTO skipDownload
IF /I "%hasDiscordInstaller%" NEQ "Y" GOTO downloadInstaller
::yeah these are backwards, bite me

:downloadInstaller
powershell curl -O --output-directory %UserProfile%\Downloads\DiscordSetup.exe %url%  

:skipDownload
taskkill /f /t /im Discord.exe
rmdir %localappdata%\Discord /s /q
echo Deleted DiscordFolder
start %UserProfile%\Downloads\DiscordSetup.exe

cls
echo Discord installer was fixed up and should have opened...
TIMEOUT 3
echo waiting 7 seconds for first startup
TIMEOUT 7
GOTO VencordInstaller

:VencordInstaller
cls
echo 5 more seconds JUST IN CASE
TIMEOUT 5
taskkill /f /t /im Discord.exe
SET /P useVencordInstaller=Install Vencord Now? (Y/N)
IF /I "%useVencordInstaller%" NEQ "Y" GOTO skipVenInstall
IF /I "%useVencordInstaller%" NEQ "N" GOTO runVenInstaller
:: again, backwards, bite me ;3

:runVenInstaller
powershell iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Vencord/Installer/main/install.ps1'))

:skipVenInstall
cls
echo :3
TIMEOUT 30