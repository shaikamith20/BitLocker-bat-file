@echo off
:menu
cls
echo ===========================
echo   BitLocker Management Menu
echo ===========================
echo 1. Turn ON BitLocker (Encrypt drive)
echo 2. Turn OFF BitLocker (Decrypt drive)
echo 3. Check BitLocker Status
echo 4. Suspend BitLocker Protection
echo 5. Resume BitLocker Protection
echo 6. Exit
echo.
set /p option=Choose an option (1-6):

if "%option%"=="1" goto turn_on
if "%option%"=="2" goto turn_off
if "%option%"=="3" goto status
if "%option%"=="4" goto suspend
if "%option%"=="5" goto resume
if "%option%"=="6" goto end

echo Invalid option. Try again.
pause
goto menu

:turn_on
set /p drive=Enter the drive letter to ENABLE BitLocker (e.g., C):
manage-bde -on %drive%:
pause
goto menu

:turn_off
set /p drive=Enter the drive letter to DISABLE BitLocker (decrypt) (e.g., C):
manage-bde -off %drive%:
pause
goto menu

:status
set /p drive=Enter the drive letter to CHECK status (e.g., C):
manage-bde -status %drive%:
pause
goto menu

:suspend
set /p drive=Enter the drive letter to SUSPEND BitLocker protection (e.g., C):
manage-bde -protectors -disable %drive%:
pause
goto menu

:resume
set /p drive=Enter the drive letter to RESUME BitLocker protection (e.g., C):
manage-bde -protectors -enable %drive%:
pause
goto menu

:end
echo Exiting...
exit
