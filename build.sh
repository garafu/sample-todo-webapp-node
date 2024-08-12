#!/bin/bash

cd ~

apt-get update
apt-get install -y curl netcat mysql-client

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs
npm ci

cp /app/data/client.cnf /etc/mysql/my.cnf

chmod +x /app/entrypoint.sh

