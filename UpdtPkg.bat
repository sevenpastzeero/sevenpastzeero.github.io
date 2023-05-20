@echo off
title Pacakge.bz2 Builder
color 1e
mode con:cols=40 lines=20


echo ----------------------------
echo -Rebuilding packages list...-
echo ----------------------------

bin\dpkg-scanpackages debs -m -o Packages

:NEW_STEP
REM We display a point without carriage return.
echo|set /p=лл
REM Operation to execute
ping localhost -n 1 > nul
set /a i = i + 1
if /i %i% leq 13 goto NEW_STEP

echo.
echo ----------------------------
echo -Creating Packages.bz2.....-
echo ----------------------------

bin\7za a Packages.bz2 Packages > NUL:
bin\zstd -fqq Packages -o Packages.zst > NUL:
del /F Packages

REM bin\bzip2 -zf Packages

echo -Finished..................-
echo ----------------------------
echo.
pause