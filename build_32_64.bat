@echo off  

set Work_Dir=D:/workdir
set Src_Dir=winpthreads

:Build32bit  
echo Building 32-bit version...  
rd /s /q .\out32\  
cmake -S ./%Src_Dir% -B out32 -G "MinGW Makefiles" -D CMAKE_C_FLAGS="-m32"  
if %errorlevel% neq 0 (  
    echo CMake failed for 32-bit build.  
    pause  
    exit /b %errorlevel%  
)  
cd ./out32  
echo "%Work_Dir%/mingw32/bin/mingw32-make.exe"
"%Work_Dir%/mingw32/bin/mingw32-make.exe" -f .\Makefile  
if %errorlevel% neq 0 (  
    echo Make failed for 32-bit build.  
    pause  
    exit /b %errorlevel%  
)  
cd ..  
  
:Build64bit  
echo Building 64-bit version...  
rd /s /q .\out64\  
cmake -S ./%Src_Dir% -B out64 -G "MinGW Makefiles" -D CMAKE_C_FLAGS="-m64"  
if %errorlevel% neq 0 (  
    echo CMake failed for 64-bit build.  
    pause  
    exit /b %errorlevel%  
)  
cd out64  
"%Work_Dir%/mingw64/bin/mingw32-make.exe" -f .\Makefile  
if %errorlevel% neq 0 (  
    echo Make failed for 64-bit build.  
    pause  
    exit /b %errorlevel%  
)  
cd ..   

echo Done building both 32-bit and 64-bit and aarch64 versions.  
pause
