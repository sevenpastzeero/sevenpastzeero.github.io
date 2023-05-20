@echo off
title Pacakge.bz2 Builder
color 1e
mode con:cols=40 lines=20
setlocal enabledelayedexpansion

echo ----------------------------
echo -Rebuilding package list...-
echo ----------------------------

start /B bin\dpkg-scanpackages debs -o Packages

set i=1
FOR /l %%a in (1,1,200) do set j=!j!²
FOR /l %%a in (1,1,200) do set j=!j!
(Set /P j=!j!) < NUL
:start
call :show %i%
:put the command in the next line
ping -n 1 127.0.0.1 > NUL
set /a i = i + 1
if /i %i% leq 200 goto start

echo.
echo ----------------------------
echo -Creating Packages.bz2.....-
echo ----------------------------

bin\7za a Packages.bz2 Packages > NUL:
del /F Packages

echo -Finished..................-
echo ----------------------------
echo.
pause

:show
(Set /P j=Û) < NUL
set /a p=(%1*100)/200
title !p!%% Done
exit /b
endlocal
