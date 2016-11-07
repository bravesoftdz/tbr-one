#!/bin/bash
set -x

mkdir output
mkdir github.com
mkdir github.com/ultibohub
cd github.com/ultibohub
git clone https://github.com/ultibohub/Examples

function compileExampleRPi2 {
    cd Examples/$1-$2/RPi2
    appveyor AddMessage "compiling ultibo example $1-$2 - pi2"
    /c/Ultibo/Core/fpc/3.1.1/bin/i386-win32/fpc \
     -B \
     -Tultibo \
     -Parm \
     -CpARMV7A \
     -WpRPI2B \
     @/c/Ultibo/Core/fpc/3.1.1/bin/i386-win32/RPI2.CFG \
     -O2 \
     $2.lpr
    cp -a kernel7.img /c/Projects/tbr-one/output/$1-kernel7.img
}

compileExampleRPi2 01 HelloWorld
compileExampleRPi2 02 Blinker
compileExampleRPi2 03 ScreenOutput

cd /c/Projects/tbr-one

appveyor AddMessage "zip artifacts"
7z a tbr-one-build.zip output/*.img

