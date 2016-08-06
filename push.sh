#!/bin/bash
set -e

IMAGE_NAME=voronenko/vault

echo "- Pushing Docker Image ${IMAGE_NAME}:"
docker push ${IMAGE_NAME}
