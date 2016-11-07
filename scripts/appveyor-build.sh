#!/bin/bash
set -x

set PROJECT=/c/Projects/tbr-one

mkdir kernels

function compileExampleRPi2 {
    cd $PROJECT/subreo/ultibohub/Examples/$1-$2/RPi2
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
    cp -a kernel7.img /c/Projects/tbr-one/kernels/$1-$2.kernel7.img
}

compileExampleRPi2 01 HelloWorld
compileExampleRPi2 02 Blinker
compileExampleRPi2 03 ScreenOutput

cd $PROJECT

appveyor AddMessage "zip artifacts"
7z a tbr-one-build.zip kernels/*.img

