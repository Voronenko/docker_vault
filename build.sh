#!/bin/bash
set -e

IMAGE_NAME=voronenko/vault

echo "- Build Docker Image ${IMAGE_NAME}:"
docker build -t=${IMAGE_NAME} .
