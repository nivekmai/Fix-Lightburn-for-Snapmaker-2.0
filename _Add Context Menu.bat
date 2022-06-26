@ECHO OFF

ECHO Creating Context Menu Registry Keys
REG ADD HKCR\SystemFileAssociations\.nc\shell\snapmakerlightburn /d "Fix Lightburn file for Snapmaker 2.0" /f > NUL
REG ADD HKCR\SystemFileAssociations\.nc\shell\snapmakerlightburn\command /d "\"C:\Tools\Fix Lightburn for Snapmaker 2.0\fix_nc.bat\" \"%%1\"" /f > NUL

ECHO.
ECHO Completed...

PAUSE
