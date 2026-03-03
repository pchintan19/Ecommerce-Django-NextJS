#!/bin/bash

echo "Pulling latest code..."
git pull origin main

echo "Stopping old containers..."
docker stop frontend-container || true
docker stop backend-container || true

docker rm frontend-container || true
docker rm backend-container || true

echo "Removing old images..."
docker rmi ecommerce-frontend || true
docker rmi ecommerce-backend || true

echo "Building backend..."
cd backend
docker build -t ecommerce-backend .

echo "Building frontend..."
cd ../frontend
docker build -t ecommerce-frontend .

echo "Starting backend..."
docker run -d -p 8000:8000 --name backend-container ecommerce-backend

echo "Starting frontend..."
docker run -d -p 3000:3000 --name frontend-container ecommerce-frontend

echo "Deployment Completed Successfully 🚀"
