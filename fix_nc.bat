ECHO OFF
CLS
IF [%1] == [] GOTO :no_file

:fix_file
ECHO Fixing file to work with SM firmware 
powershell -ExecutionPolicy Bypass -File "%~dp0\fix_nc.ps1" %1
ECHO Fixed
PAUSE

:quit
EXIT

:no_file
CLS
ECHO No file found. Next time drag and drop .nc file onto %0
ECHO.
PAUSE
EXIT