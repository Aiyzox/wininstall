@echo off

:start
cls
echo "__        __ _          ___              _          _  _ "
echo "\ \      /  (_)  _ __  |_ _| _ __   ___ | |_  __ _ | || |"
echo " \ \ /\ / / | | | '_ \  | | | '_ \ / __|| __|/ _` || || |"
echo "  \ V  V /  | | | | | | | | | | | \ __ \\ ||  (_| || || |"
echo "   \_/\_/   |_| |_| |_||___||_| |_||___/ \__|\__,_||_||_|"
echo. 
echo Bienvenue sur WinInstall !
echo. 
echo 1. Installation automatique
echo 2. Installation manuelle
echo 0. Quitter le programme

echo.
set choix=
set mode=
set /p choix= Merci de bien vouloir faire un choix : 
if %choix% == 0 goto break
if %choix% == 1 goto break
if %choix% == 2 goto manual
goto break

:manual
cls
set mode=manual
echo 1. Installation des visual c++
echo 2. Installation des applications recommandees
echo 0. retour au menu principal
echo.
set /p choix= Merci de bien vouloir faire un choix : 
if %choix% == 0 goto start
if %choix% == 1 goto c++
if %choix% == 2 goto winget
goto break

:c++
cls
timeout 3
cls
echo Installation des visual c++...
set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))
if "%IS_X64%" == "1" goto c++64
echo 2005...
start /wait ./bin/vcredist2005_x86.exe /q
echo 2008...
start /wait ./bin/vcredist2008_x86.exe /qb
echo 2010...
start /wait ./bin/vcredist2010_x86.exe /passive /norestart
echo 2012...
start /wait ./bin/vcredist2012_x86.exe /passive /norestart
echo 2013...
start /wait ./bin/vcredist2013_x86.exe /passive /norestart
echo 2015, 2017 ^& 2019...
start /wait ./bin/vcredist2015_2017_2019_2022_x86.exe /passive /norestart
if "%mode%"=="manual" goto manual

:c++64
echo 2005...
start /wait ./bin/vcredist2005_x86.exe /q
start /wait ./bin/vcredist2005_x64.exe /q
echo 2008...
start /wait ./bin/vcredist2008_x86.exe /qb
start /wait ./bin/vcredist2008_x64.exe /qb
echo 2010...
start /wait ./bin/vcredist2010_x86.exe /passive /norestart
start /wait ./bin/vcredist2010_x64.exe /passive /norestart
echo 2012...
start /wait ./bin/vcredist2012_x86.exe /passive /norestart
start /wait ./bin/vcredist2012_x64.exe /passive /norestart
echo 2013...
start /wait ./bin/vcredist2013_x86.exe /passive /norestart
start /wait ./bin/vcredist2013_x64.exe /passive /norestart
echo 2015, 2017 ^& 2019 ^& 2022...
start /wait ./bin/vcredist2015_2017_2019_2022_x86.exe /passive /norestart
start /wait ./bin/vcredist2015_2017_2019_2022_x64.exe /passive /norestart
if "%mode%"=="manual" goto manual

:winget
cls
timeout 3
cls
echo Installation des applications recommandees...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
pause
choco install firefox
choco install 7zip
choco install vlc
choco install sumatrapdf
choco install dotnet
choco install notepadplusplus
if "%mode%"=="manual" goto manual

:break
exit /b