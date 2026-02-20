#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# --- Configuration ---
PROJECT_NAME="System-Programming-Services"
BUILD_DIR="build"
INSTALL_DIR="dist"
BUILD_TYPE="Release" # Can be Debug, Release, RelWithDebInfo
GENERATOR="Ninja"

echo "-------------------------------------------------------"
echo " Building $PROJECT_NAME with $GENERATOR ($BUILD_TYPE)"
echo "-------------------------------------------------------"

# 1. Clean previous builds if requested
if [[ "$1" == "clean" ]]; then
    echo "Cleaning old build files..."
    rm -rf $BUILD_DIR $INSTALL_DIR
fi

conan install . --output-folder=$BUILD_DIR --build=missing -s build_type=Release

# 2. Configure the system
# We use -DCMAKE_EXPORT_COMPILE_COMMANDS=ON for IDE support
cmake -G "$GENERATOR" \
      -S . \
      -B $BUILD_DIR \
      -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

# 3. Build the project
# Ninja automatically detects the number of CPU cores
echo "Starting compilation..."
cmake --build $BUILD_DIR --parallel $(nproc)

# 4. Success Message
echo "-------------------------------------------------------"
echo "Build Successful!"
echo "Binary location: $BUILD_DIR/bin/"
echo "To run: ./$BUILD_DIR/bin/worker"
echo "-------------------------------------------------------"