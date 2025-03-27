#!/bin/bash
set -e  # Exit on any error

echo "Updating package list..."
apt-get update || true

echo "Installing required packages (Make and Wget)..."
apt-get install --yes make=4* wget || {
    echo "Failed to install required packages. Retrying..."
    apt-get install --yes make=4* wget
}

echo "Installing Hugo v0.115.4..."
HUGO_VERSION="0.115.4"
HUGO_TAR="hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"
HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_TAR}"

# Cleanup function in case of failure
cleanup() {
    rm -f "$HUGO_TAR"
}
trap cleanup EXIT

# Download and install Hugo
wget -q "$HUGO_URL" -O "$HUGO_TAR"
tar -xf "$HUGO_TAR" hugo
mv hugo /usr/local/bin/hugo
rm "$HUGO_TAR"

echo "Verifying installations..."
command -v make >/dev/null 2>&1 && echo "✅ Make installed successfully" || { echo "❌ Make installation failed"; exit 1; }
command -v wget >/dev/null 2>&1 && echo "✅ Wget installed successfully" || { echo "❌ Wget installation failed"; exit 1; }
hugo version || { echo "❌ Hugo installation failed"; exit 1; }

# Ensure Makefile exists before running make build
if [ ! -f Makefile ]; then
    echo "❌ Error: Makefile not found! Cannot run 'make build'."
    exit 1
fi

echo "Running 'make build'..."
if ! make build; then
    echo "❌ 'make build' failed. Check logs above for details."
    exit 1
fi

# Verify ./dist directory exists and is not empty
if [ ! -d "./dist" ] || [ -z "$(ls -A ./dist 2>/dev/null)" ]; then
    echo "❌ Error: 'make build' did not generate ./dist directory correctly."
    exit 1
fi

echo "✅ Setup complete! The website is generated in './dist'."
exit 0  # Ensure successful exit
