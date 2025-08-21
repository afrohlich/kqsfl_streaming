#!/bin/bash

# Build and run the KQSFL Overlay Docker container

set -e

echo "Building KQSFL Overlay Docker image..."

# Build the Docker image
docker build -t kqsfl-overlay:latest .

echo "Docker image built successfully!"
echo ""
echo "To run the container:"
echo "  docker run -p 3000:3000 kqsfl-overlay:latest"
echo ""
echo "Or using docker-compose:"
echo "  docker-compose up -d"
echo ""
echo "The application will be available at http://localhost:3000"