# Fix Lightburn for Snapmaker 2.0
https://github.com/Snapmaker/Snapmaker2-Controller/commit/12c89a8ee99a712360e08004cfa645c3bc27a841

Was an attempt to fix the firmware to work with inline power settings and the 10W laser.
However, the code was misread and the commit was made which changes the way that the machine
expects to get inline power commands.

This script should fix the output file from lightburn to allow for it to run on SnapMaker machines
which are running the firmware with the mistaken change.

# HOW TO USE

## Windows
### Install
  1. Download the folder by going to "Code" > "Download ZIP"
  2. Extract the contents to a folder
  3. Move the folder to `C:\Tools\` (so you should have a `Fix Lightburn for Snapmaker 2.0` folder in your `C:\Tools\` directory)
  4. Right click on `_Add Context Menu.bat`, choose "Run as administrator", and agree to the prompt

### Usage
  1. Right click on a `.nc` (e.g. "myFile.nc") file and choose "Fix Lightburn file for Snapmaker 2.0"
  2. A "myFile - fixed.nc" will be created in the directory

### Usage (without installation)
  1. Drag and drop a `.nc` (e.g. "myFile.nc") file onto `fix_nc.bat` 
  2. A "myFile - fixed.nc" will be created in the directory

### Uninstall
  1. Right click on `_Delete Context Menu.bat`, choose "Run as administrator", and agree to the prompt

## Mac/Linux
### Installation
  1. Download the folder by going to "Code" > "Download ZIP"
  2. Extract the contents to a folder

### Usage
  1. Pass a file to `fix_nc_mac.sh`, e.g. `./fix_nc_mac.sh myFile.nc`
  2. A "myFile - fixed.nc" will be created in the directory

# CONTRIBUTING

If someone wants to go and make an automator script to allow right click fix on mac, I'm happy to accept pull requests.
