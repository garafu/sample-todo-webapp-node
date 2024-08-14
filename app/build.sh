#!/bin/bash

# Install dependencies
apt-get update
apt-get install -y curl
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs

# Install the application
npm ci

# Make the entrypoint script executable
chmod +x /app/entrypoint.sh

