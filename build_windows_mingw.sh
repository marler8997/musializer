#!/bin/sh

set -xe

mkdir -p ./build/
x86_64-w64-mingw32-windres ./musializer.rc -O coff -o ./build/musializer.res
x86_64-w64-mingw32-gcc -mwindows -Wall -Wextra -ggdb -Iraylib-4.5.0_win64_mingw-w64/include/  -o ./build/musializer.exe ./src/plug.c ./src/ffmpeg_windows.c ./src/musializer.c ./build/musializer.res -Lraylib-4.5.0_win64_mingw-w64/lib/ -lraylib -lwinmm -lgdi32 -static
cp -r ./resources ./build
cp -r ./musializer-logged.bat ./build/
