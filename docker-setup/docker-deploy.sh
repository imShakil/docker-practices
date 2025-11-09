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

echo "Creating Dockerfile"
cat > Dockerfile << EOF
FROM nginx:alpine
COPY index.html /usr/share/nginx/html
EOF

echo "Download static website"
wget https://raw.githubusercontent.com/pravinmishraaws/Azure-Static-Website/refs/heads/main/index.html


if [ -f "index.html" ]; then
    echo "index.html downloaded successfully."
    echo "Building Docker image..."
    docker build -t imshakil/static-web .
    echo "Docker image built successfully."
    docker images
    echo "Running Docker container..."
    docker run -d --name st-web -p 80:80 imshakil/static-web
    echo "Static website is deployed on port 80"
    echo "docker commands to set status" 
    docker ps
else
    echo "Failed to download index.html."
    exit 1
fi
