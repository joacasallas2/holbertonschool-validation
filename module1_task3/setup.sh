#!/bin/bash
set -e
apt-get update
echo "Installing Hugo and Make..."
apt-get install --yes hugo=0.92* make=4*
echo "Running 'make build'..."
make build
