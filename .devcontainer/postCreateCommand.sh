#!/bin/sh

# Update and Upgrade Linux Debian
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y xdg-utils
sudo apt-get update && sudo apt-get install -y net-tools

echo "Installing needed package(s)....."
node --version
pnpm --version
npm --version
yarn --version
protoc --version
dapr version
echo "Done version verifications and installing needed package(s)....."