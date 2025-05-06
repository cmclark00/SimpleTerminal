@echo off
echo Building SimpleTerminal for aarch64...
echo.
echo NOTE: You need to have an aarch64 cross-compiler installed and in your PATH
echo.

REM Check if we have mingw32-make available
where mingw32-make >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ERROR: mingw32-make not found in PATH
    echo Please install MSYS2, MinGW, or another make system for Windows
    exit /b 1
)

REM Check if we can find an aarch64 compiler
where aarch64-linux-gnu-gcc >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo WARNING: aarch64-linux-gnu-gcc not found in PATH
    echo You may need to install a cross-compiler or adjust the CROSS_COMPILE variable
)

REM Build the project
set UNION_PLATFORM=aarch64
mingw32-make

echo.
if %ERRORLEVEL% equ 0 (
    echo Build completed successfully. The binary is in the build/ directory.
) else (
    echo Build failed with error code %ERRORLEVEL%
)

pause 