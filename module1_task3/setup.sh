#!/bin/bash

# Exit script on error
set -e

# Update package list
echo "Updating package list..."
apt-get update || true

## Install Hugo
echo "Installing hugo..."
apt-get install --yes hugo=0.92* || {
    echo "Failed to install Hugo. Retrying..."
    apt-get install --yes hugo=0.92*
}

## Install Make
echo "Installing make..."
apt-get install --yes make=4* || {
    echo "Failed to install Make. Retrying..."
    apt-get install --yes make=4*
}

# Run make build to reproduce the error
echo "Running 'make build'..."
make build
