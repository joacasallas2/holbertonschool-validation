#!/bin/bash
set -e
echo "Updating package list..."
apt-get update || true
echo "Installing Hugo and Make..."
apt-get install --yes hugo=0.92* make=4* || {
    echo "Failed to install or Make. Retrying ..."
}
echo "Running 'make build'..."
make build
