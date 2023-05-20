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
for /f %%A in ('copy /Z "%~dpf0" nul') do set "CR=%%A"
:start
call :show %i%
<nul set /p="...........!p!%%............ !CR!"
ping -n 1 127.0.0.1 > NUL
set /a i = i + 1
if /i %i% leq 250 goto start

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
set /a p=(%1*100)/250
title !p!%% Done
exit /b
endlocal
