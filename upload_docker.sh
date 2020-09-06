#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# dockerpath=<your docker ID/path>
dockerpath=yassin226/webserver

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login
docker tag webserver:1.0 $dockerpath

# Push image to a docker repository
docker push $dockerpath