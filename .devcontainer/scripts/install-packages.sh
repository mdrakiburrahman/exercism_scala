#!/usr/bin/env -S bash -e

export ACCEPT_EULA=Y
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y \
    apt-transport-https \
    apt-utils \
    build-essential \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common \
    vim \
    wget

echo "Installing yq..."
VERSION=v4.25.1
BINARY=yq_linux_386
sudo wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY} -O /usr/bin/yq \
    && sudo chmod +x /usr/bin/yq

# Clean up
sudo apt-get autoremove -y \
&& sudo apt-get clean -y \
&& sudo rm -rf /var/lib/apt/lists/* \
&& sudo rm -rf /tmp/downloads
