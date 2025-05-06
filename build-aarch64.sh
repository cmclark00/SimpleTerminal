#!/bin/sh
# This script can be run in Git Bash on Windows or in a Linux shell

# Check OS type
case "$(uname -s)" in
    MINGW*|MSYS*)
        echo "Running on Windows (MSYS/MinGW)"
        # Windows-specific instructions:
        echo "To build for aarch64 on Windows:"
        echo "1. Install a suitable cross-compiler (e.g., through MSYS2 or as a standalone toolchain)"
        echo "2. Add the toolchain bin directory to your PATH"
        echo "3. Run: UNION_PLATFORM=aarch64 CROSS_COMPILE=aarch64-linux-gnu- mingw32-make"
        echo ""
        echo "NOTE: You may need to modify makefiles/config-aarch64.mk to match your toolchain setup"
        ;;
    *)
        # Linux or other Unix-like OS
        PLATFORM=aarch64
        echo "Building for $PLATFORM..."
        
        # Check if aarch64 toolchain is installed
        if ! command -v aarch64-linux-gnu-gcc >/dev/null 2>&1; then
            echo "aarch64-linux-gnu-gcc not found, please install a suitable toolchain"
            echo "For Ubuntu/Debian: sudo apt-get install gcc-aarch64-linux-gnu"
            exit 1
        fi
        
        # Build using the aarch64 toolchain
        UNION_PLATFORM=aarch64 make
        
        echo "Build complete. The binary is in the build/ directory."
        ;;
esac 