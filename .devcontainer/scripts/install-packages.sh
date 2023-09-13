#!/usr/bin/env -S bash -e

export ACCEPT_EULA=Y
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    wget \
    software-properties-common

# Run install apt-utils to avoid debconf warning then verify presence of other common developer tools and dependencies
PACKAGE_LIST="apt-utils \
    build-essential \
    vim"

echo "Packages to verify are installed: ${PACKAGE_LIST}"
apt-get -y install --no-install-recommends ${PACKAGE_LIST} 2> >( grep -v 'debconf: delaying package configuration, since apt-utils is not installed' >&2 )

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
