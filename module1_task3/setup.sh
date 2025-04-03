#!/bin/bash

# Exit script on error
set -e

# Update package list
echo "Updating package list..."
apt-get update

## Install Hugo
apt-get install --yes hugo=0.92*

## Install Make
apt-get install --yes make=4*

# Run make build to reproduce the error
echo "Running 'make build'..."
make build

