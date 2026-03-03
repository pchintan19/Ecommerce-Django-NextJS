#!/bin/bash

echo "Pulling latest code..."
git pull origin main

echo "Stopping existing containers..."
docker compose down

echo "Building and starting containers..."
docker compose up -d --build

echo "Deployment completed successfully 🚀"
