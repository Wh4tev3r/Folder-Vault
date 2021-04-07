@echo off
mode 45,25
set pass=aa
if exist "LockedPrivateFolder2475927251584827464322021911910411824214043070532338" goto unlock
if not exist Private-Folder goto MDPrivateFolder
:confirm
color 0a
echo Are you sure to lock this folder? (Y/n)
set/p "cu=>"
if %cu% == Y goto lock
if %cu% == y goto lock
if %cu% == n goto endout
if %cu% == N goto endout
echo Invalid choice.
goto confirm
:lock
ren Private-Folder "LockedPrivateFolder2475927251584827464322021911910411824214043070532338"
attrib +h +s "LockedPrivateFolder2475927251584827464322021911910411824214043070532338"
echo Folder locked
goto endout
:unlock
color 09
set "psCommand=powershell -Command "$pword = read-host 'Enter password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
      [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
        for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
)
if not %password%== %pass% goto fail1
attrib -h -s "LockedPrivateFolder2475927251584827464322021911910411824214043070532338"
ren "LockedPrivateFolder2475927251584827464322021911910411824214043070532338" Private-Folder
echo Folder Unlocked successfully
goto endin
:fail1
color 4f
cls
echo Invalid password
timeout /t 1 >nul
color 09
cls
goto unlock1
:unlock1
set "psCommand=powershell -Command "$pword = read-host 'Enter password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
      [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
        for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
)
if not %password%== %pass% goto fail2
attrib -h -s "LockedPrivateFolder2475927251584827464322021911910411824214043070532338"
ren "LockedPrivateFolder2475927251584827464322021911910411824214043070532338" Private-Folder
echo Folder Unlocked successfully
goto endin
:fail2
color 4f
cls
echo Invalid password
timeout /t 1 >nul
color 09
cls
goto unlock2
:unlock2
set "psCommand=powershell -Command "$pword = read-host 'Enter password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
      [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
        for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
)
if not %password%== %pass% goto fail3
attrib -h -s "LockedPrivateFolder2475927251584827464322021911910411824214043070532338"
ren "LockedPrivateFolder2475927251584827464322021911910411824214043070532338" Private-Folder
echo Folder Unlocked successfully
goto endin
:fail3
cls
color 4f
echo Password Invalid
goto endout
:MDPrivateFolder
md Private-Folder
cd %appdata%
md Folder-Vault
cd Folder-Vault
md reports
cd reports
md This-Place-Filled-With-Login-Reports
echo Setup finished
goto endout
:endin
timeout /t 1 >nul
cd %appdata%\Folder-Vault\reports
echo Someone login in %time%/%date% >Log-%time%
exit
:endout
timeout /t 1 >nul
exit
