#!/bin/bash

echo "Building testit container..."
cd /dtrontestit/docker
docker build --no-cache -t testit:latest .
