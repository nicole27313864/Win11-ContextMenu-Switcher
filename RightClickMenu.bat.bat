@echo off
title Windows �k��������u��
:: �ҥ� ANSI �䴩�]Windows 10+�^
reg query "HKCU\Console" /v VirtualTerminalLevel >nul 2>&1 || reg add "HKCU\Console" /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul

:: �w�q�C��N�X
set "YELLOW=[33m"
set "CYAN=[36m"
set "RED=[31m"
set "GREEN=[32m"
set "RESET=[0m"

:menu
cls
echo %YELLOW%==============================
echo �п�ܭn�������k����˦�:
echo.
echo %CYAN%1. ������ Windows 10 �ǲο��
echo 2. �����^ Windows 11 �s�����
echo 0. ���}
echo %YELLOW%==============================%RESET%
set /p choice=�п�J�Ʀr��� Enter:

if "%choice%"=="1" goto win10
if "%choice%"=="2" goto win11
if "%choice%"=="0" exit
echo %RED%��J���~�A�Э��s��J%RESET%
pause
goto menu

:win10
echo %GREEN%���b������ Windows 10 �ǲΥk����...%RESET%
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
goto restart

:win11
echo %GREEN%���b��_ Windows 11 �s���k����...%RESET%
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
goto restart

:restart
echo.
echo %YELLOW%�n�ߧY���s�Ұʡu�ɮ��`�ޡv���]�w�ͮĶ�? (Y/N)%RESET%
set /p restartChoice=
if /i "%restartChoice%"=="Y" (
    echo %GREEN%���b���s�Ұ� Explorer...%RESET%
    taskkill /f /im explorer.exe
    start explorer.exe
    echo %GREEN%�]�w����!%RESET%
) else (
    echo %YELLOW%�Ф�ʭ��s�Ұʩεn�X/���}�����]�w�ͮ�%RESET%
)
pause
exit
