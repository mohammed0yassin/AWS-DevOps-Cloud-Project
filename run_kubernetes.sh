#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# dockerpath=<your docker ID/path>
dockerpath="yassin226/housingprice"

# Run the Docker Hub container with kubernetes
kubectl run housingprice\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=housingprice

# List kubernetes pods
kubectl get pods

# Forward the container port to a host
kubectl port-forward housingprice 8000:80
