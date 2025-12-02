@echo off
:menu
cls
echo ==============================
echo    BitLocker Management Menu
echo ==============================
echo 1. Turn ON BitLocker (Encrypt drive)
echo 2. Turn OFF BitLocker (Decrypt drive)
echo 3. Check BitLocker Status
echo 4. Suspend BitLocker Protection
echo 5. Resume BitLocker Protection
echo 6. Lock Drive
echo 7. Unlock Drive (Password)
echo 8. Unlock Drive (Recovery Key)
echo 9. Add Password Protector
echo 10. Remove Protector (by type)
echo 11. Exit
echo.
set /p option=Choose an option (1-11): 

if "%option%"=="1" goto turn_on
if "%option%"=="2" goto turn_off
if "%option%"=="3" goto status
if "%option%"=="4" goto suspend
if "%option%"=="5" goto resume
if "%option%"=="6" goto lock_drive
if "%option%"=="7" goto unlock_password
if "%option%"=="8" goto unlock_recovery
if "%option%"=="9" goto add_password
if "%option%"=="10" goto remove_protector
if "%option%"=="11" goto end

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

:lock_drive
set /p drive=Enter the drive letter to LOCK (e.g., D): 
manage-bde -lock %drive%: -forcedismount
pause
goto menu

:unlock_password
set /p drive=Enter the drive letter to UNLOCK (e.g., D): 
manage-bde -unlock %drive%: -password
pause
goto menu

:unlock_recovery
set /p drive=Enter the drive letter to UNLOCK (e.g., D): 
set /p key=Enter the 48-digit recovery key: 
manage-bde -unlock %drive%: -RecoveryPassword %key%
pause
goto menu

:add_password
set /p drive=Enter the drive letter to ADD password protector (e.g., C): 
manage-bde -protectors -add %drive%: -password
pause
goto menu

:remove_protector
set /p drive=Enter the drive letter to REMOVE protector from (e.g., C): 
echo Protector types can be: Password, RecoveryPassword, TPM, NumericalPassword, etc.
set /p ptype=Enter the Protector Type to remove: 
manage-bde -protectors -delete %drive%: -type %ptype%
pause
goto menu

:end
echo Exiting...
exit
