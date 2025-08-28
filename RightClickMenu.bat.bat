@echo off
title Windows ¥kÁä¿ï³æ¤Á´«¤u¨ã
:: ±Ò¥Î ANSI ¤ä´©¡]Windows 10+¡^
reg query "HKCU\Console" /v VirtualTerminalLevel >nul 2>&1 || reg add "HKCU\Console" /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul

:: ©w¸qÃC¦â¥N½X
set "YELLOW=[33m"
set "CYAN=[36m"
set "RED=[31m"
set "GREEN=[32m"
set "RESET=[0m"

:menu
cls
echo %YELLOW%==============================
echo ½Ð¿ï¾Ü­n¤Á´«ªº¥kÁä¿ï³æ¼Ë¦¡:
echo.
echo %CYAN%1. ¤Á´«¦¨ Windows 10 ¶Ç²Î¿ï³æ
echo 2. ¤Á´«¦^ Windows 11 ·s¦¡¿ï³æ
echo 0. Â÷¶}
echo %YELLOW%==============================%RESET%
set /p choice=½Ð¿é¤J¼Æ¦r«á«ö Enter:

if "%choice%"=="1" goto win10
if "%choice%"=="2" goto win11
if "%choice%"=="0" exit
echo %RED%¿é¤J¿ù»~¡A½Ð­«·s¿é¤J%RESET%
pause
goto menu

:win10
echo %GREEN%¥¿¦b¤Á´«¦¨ Windows 10 ¶Ç²Î¥kÁä¿ï³æ...%RESET%
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
goto restart

:win11
echo %GREEN%¥¿¦b«ì´_ Windows 11 ·s¦¡¥kÁä¿ï³æ...%RESET%
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
goto restart

:restart
echo.
echo %YELLOW%­n¥ß§Y­«·s±Ò°Ê¡uÀÉ®×Á`ºÞ¡vÅý³]©w¥Í®Ä¶Ü? (Y/N)%RESET%
set /p restartChoice=
if /i "%restartChoice%"=="Y" (
    echo %GREEN%¥¿¦b­«·s±Ò°Ê Explorer...%RESET%
    taskkill /f /im explorer.exe
    start explorer.exe
    echo %GREEN%³]©w§¹¦¨!%RESET%
) else (
    echo %YELLOW%½Ð¤â°Ê­«·s±Ò°Ê©Îµn¥X/­«¶}¾÷Åý³]©w¥Í®Ä%RESET%
)
pause
exit
