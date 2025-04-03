#!/bin/bash

# Exit script on error
set -e

# Update package list
echo "Updating package list..."
apt-get update || true

## Install Make
echo "Installing make..."
apt-get install --yes make=4* || {
    echo "Failed to install Make. Retrying..."
    apt-get install --yes make=4*
}

## Install Wget
echo "Installing wget..."
apt-get install --yes wget* || {
    echo "Failed to install wget. Retrying..."
    apt-get install --yes wget*
}

## Install Hugo
echo "Installing hugo v0.115.4..."
wget https://github.com/gohugoio/hugo/releases/download/v0.115.4/hugo_extended_0.115.4_Linux-64bit.tar.gz
tar -xvf hugo_extended_0.115.4_Linux-64bit.tar.gz
mv hugo /usr/local/bin/
rm hugo_extended_0.115.4_Linux-64bit.tar.gz



# Run make build to reproduce the error
echo "Running 'make build'..."
make build
