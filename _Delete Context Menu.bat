@ECHO OFF

ECHO Removing Registry Keys
REG DELETE HKCR\SystemFileAssociations\.nc\shell\snapmakerlightburn /f

ECHO.
ECHO Context Menu Removed
Pause
