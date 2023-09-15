# Grabs VS Code's devcontainer base image for Ubuntu 20.04
FROM mcr.microsoft.com/vscode/devcontainers/base:focal

# Copy library scripts to execute
COPY scripts/*.sh /tmp/scripts/

# Run chmod +x on all scripts to make them executable
RUN find /tmp/scripts -name "*.sh" -exec chmod +x {} \;

# Install necessary ubuntu package dependencies
RUN /tmp/scripts/install-packages.sh

# Switch from root to non-root user
USER vscode
