#!/bin/bash
set -x

mkdir output
mkdir github.com
mkdir github.com/ultibohub
cd github.com/ultibohub
git clone https://github.com/ultibohub/Examples
cd Examples/01-HelloWorld/RPi2

appveyor AddMessage "ultibo example 01 - pi2 - kernel7.img"
/c/Ultibo/Core/fpc/3.1.1/bin/i386-win32/fpc \
 -B \
 -Tultibo \
 -Parm \
 -CpARMV7A \
 -WpRPI2B \
 @/c/Ultibo/Core/fpc/3.1.1/bin/i386-win32/RPI2.CFG \
 -O2 \
 HelloWorld.lpr
cp -a kernel7.img /c/Projects/tbr-one/output/01-kernel7.img

appveyor AddMessage "zip artifacts"
cd /c/Projects/tbr-one/output
7z a ../kernel7.img.zip kernel7.img >> 7z.log
cd ..

