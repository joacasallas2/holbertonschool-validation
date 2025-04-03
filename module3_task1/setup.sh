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

## Install Wget and curl
echo "Installing wget and curl..."
apt-get install --yes wget*  curl || {
    echo "Failed to install wget or curl. Retrying..."
    apt-get install --yes wget* curl
}

## Install yq
echo "Installing yq..."
YQ_VERSION="v4.35.2"
YQ_BINARY="yq_linux_amd64"
YQ_URL="https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/${YQ_BINARY}"

curl -fsSL "$YQ_URL" -o /usr/local/bin/yq
chmod +x /usr/local/bin/yq
echo "✅ yq installed successfully!"

## Install Hugo
echo "Installing hugo v0.115.4..."
wget https://github.com/gohugoio/hugo/releases/download/v0.115.4/hugo_extended_0.115.4_Linux-64bit.tar.gz
tar -xvf hugo_extended_0.115.4_Linux-64bit.tar.gz
mv hugo /usr/local/bin/
rm hugo_extended_0.115.4_Linux-64bit.tar.gz

# Cleanup function in case of failure
cleanup() {
    rm -f hugo_extended_0.115.4_Linux-64bit.tar.gz
}
trap cleanup EXIT

echo "Verifying installations..."
command -v make >/dev/null 2>&1 && echo "✅ Make installed successfully" || { echo "❌ Make installation failed"; exit 1; }
command -v wget >/dev/null 2>&1 && echo "✅ Wget installed successfully" || { echo "❌ Wget installation failed"; exit 1; }
command -v yq >/dev/null 2>&1 && echo "✅ yq installed successfully" || { echo "❌ yq installation failed"; exit 1; }
hugo version || { echo "❌ Hugo installation failed"; exit 1; }


echo "All dependencies installed!"

echo "Current directory: $(pwd)"
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
