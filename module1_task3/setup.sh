#!/bin/bash
set -e
echo "Updating package list..."
apt-get update || true
echo "Installing Make..."
apt-get install --yes make=4* || {
    echo "Failed to install Make. Retrying ..."
    apt-get install --yes make=4*
}
echo "Installing Make..."
apt-get install --yes make=4* || {
    echo "Failed to install Make. Retrying ..."
    apt-get install --yes make=4*
}
echo "Running 'make build'..."
make build
