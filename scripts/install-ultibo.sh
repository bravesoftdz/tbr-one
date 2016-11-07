#!/bin/bash
set -x

#if exist c:\Ultibo goto :installed

    appveyor AddMessage "installing ultibo 1.2.009"
    curl -fsSL -o ultibo-installer.exe https://github.com/ultibohub/Core/releases/download/1.2.009/Ultibo-Core-1.2.009-Cucumber.exe
    ultibo-installer /verysilent
    ls /c/Ultibo
    appveyor AddMessage "building ultibo rtl using __buildrtl.bat from 1.2.185"
    curl -fsSL -o ultibo-rtl-update.zip https://github.com/ultibohub/Core/archive/master.zip
    ls *.zip
#   7z x -oultibo-rtl-update ultibo-rtl-update.zip
#   dir ultibo-rtl-update\Core-master\source\rtl\ultibo
#   dir c:\Ultibo\Core\fpc\3.1.1\source\rtl\ultibo
#   rd /s /q c:\Ultibo\Core\fpc\3.1.1\source\rtl\ultibo
#   xcopy /s /i ultibo-rtl-update\Core-master\source\rtl\ultibo c:\Ultibo\Core\fpc\3.1.1\source\rtl\ultibo
#   dir c:\Ultibo\Core\fpc\3.1.1\source\rtl\ultibo
#   copy scripts\__buildrtl.bat c:\Ultibo\Core\fpc\3.1.1\source
#   cd c:\Ultibo\Core\fpc\3.1.1\source
#   setlocal
#   call __buildrtl.bat
#   endlocal
    cd /c/projects/tbr-one

#:installed
