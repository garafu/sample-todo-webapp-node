#!/bin/bash

# Install dependencies
apt-get update
apt-get install -y curl netcat mysql-client
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs

# Install the application
npm ci

# Copy the configuration file
cp /app/data/client.cnf /etc/mysql/my.cnf

# Make the entrypoint script executable
chmod +x /app/entrypoint.sh

