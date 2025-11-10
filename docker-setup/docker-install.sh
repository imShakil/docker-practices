#!/bin/bash

set -e

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh ./get-docker.sh
fi

if ! docker info &> /dev/null; then
    echo "Docker daemon is not running. Starting docker service..."
    systemctl enable --now docker
fi

echo "Docker version: $(docker --version)"
echo "Docker is installed and running..."

# Add current user to docker group
usermod -aG docker $USER
usermod -aG docker ec2-user 2>/dev/null || true
usermod -aG docker ubuntu 2>/dev/null || true
