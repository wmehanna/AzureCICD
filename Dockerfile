# Use Ubuntu as a base image
FROM ubuntu:20.04

# Install necessary tools
RUN apt-get update && \
    apt-get install -y docker.io git curl apt-transport-https ca-certificates lsb-release gnupg && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/2.18.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app
