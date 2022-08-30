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
echo.
set choix=
set /p choix= Merci de bien vouloir faire un choix : 
if %choix% == 1 goto break
if %choix% == 2 goto manual
goto break

:manual
cls
echo 1. Installation des visual c++
echo 0. retour au menu principal
echo.
set /p choix= Merci de bien vouloir faire un choix : 
::debug
echo %choix%

:break
exit /b