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
    wget \
    openjdk-8-jdk

echo "Installing yq..."
VERSION=v4.25.1
BINARY=yq_linux_386
sudo wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY} -O /usr/bin/yq \
    && sudo chmod +x /usr/bin/yq

echo "Installing Apache Spark..."
sudo wget https://archive.apache.org/dist/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz && \
    tar -xvf spark-3.3.1-bin-hadoop3.tgz && \
    sudo mkdir /opt/spark && \
    sudo mv spark-3.3.1-bin-hadoop3/* /opt/spark && \
    rm spark-3.3.1-bin-hadoop3.tgz && \
    rm -rf spark-3.3.1-bin-hadoop3

# Clean up
sudo apt-get autoremove -y \
&& sudo apt-get clean -y \
&& sudo rm -rf /var/lib/apt/lists/* \
&& sudo rm -rf /tmp/downloads
