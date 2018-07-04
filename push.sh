#!/bin/bash
set -e

VAULT_VERSION=${1:-0.6.0}
IMAGE_NAME=voronenko/vault:${VAULT_VERSION}

echo "- Pushing Docker Image ${IMAGE_NAME}"
docker push ${IMAGE_NAME}
