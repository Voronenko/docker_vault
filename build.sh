#!/bin/bash
set -e

VAULT_VERSION=${1:-0.6.0}
IMAGE_NAME=voronenko/vault:${VAULT_VERSION}

echo "- Build Docker Image ${IMAGE_NAME}"
docker build -t=${IMAGE_NAME} --build-arg VAULT_VERSION=${VAULT_VERSION} .
