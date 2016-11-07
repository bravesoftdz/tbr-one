#!/bin/bash
set -x

rm -rf kernels
mkdir kernels

function compileExampleRPi2 {
    pushd subrepo/ultibohub/Examples/$1-$2/RPi2
    appveyor AddMessage "compiling ultibo example $1-$2 - pi2"
    /c/Ultibo/Core/fpc/3.1.1/bin/i386-win32/fpc \
     -B \
     -Tultibo \
     -Fu../.. \
     -Parm \
     -CpARMV7A \
     -WpRPI2B \
     @/c/Ultibo/Core/fpc/3.1.1/bin/i386-win32/RPI2.CFG \
     -O2 \
     $2.lpr
    popd
    cp -a subrepo/ultibohub/Examples/$1-$2/RPi2/kernel7.img kernels/$1-$2.kernel7.img
}

compileExampleRPi2 01 HelloWorld
compileExampleRPi2 02 Blinker
compileExampleRPi2 03 ScreenOutput

appveyor AddMessage "zip artifacts"
rm -f tbr-one-build.zip
7z a tbr-one-build.zip kernels/*.img > 7z.log
