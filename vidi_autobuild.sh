#!/bin/bash
echo "Trying to autobuild ViDi..."

#QT check
QTV="version "
if echo `qmake-qt4 -version` | grep -q "$QTV"; then
    echo "[+] Qt5 found!"
elif echo `qmake -v` | grep -q "$QTV"; then
    echo "[+] Qt5 found!"
else
    echo "[-] Qt5 NOT found!"
    echo "Install qt-sdk first"
    exit -1
fi

CMAKE_VER=`cmake --version`
CMAKEV="cmake version"
if echo "$CMAKE_VER" | grep -q "$CMAKEV"; then
    echo "[+] CMake found!"
else
    echo "[-] CMake NOT found!"
    echo "Install cmake first"
    exit -1
fi

mkdir ViDi
cd ViDi
git clone --recursive https://github.com/hasherezade/ViDi.git
echo "[+] ViDi cloned"
mv ViDi src
mkdir build
echo "[+] build directory created"
cd build
cmake -G "Unix Makefiles" ../src/
make
cd ..
cp build/vidi/vidi ./
echo "[+] Success! ViDi is here:"
pwd
