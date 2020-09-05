#!/usr/bin/env bash

docker build -t webserver:1.0 .

docker image ls

docker run -p 8000:80 webserver:1.0