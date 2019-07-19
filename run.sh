#!/bin/bash

docker container rm -f scipy-geo-maps 1>/dev/null 2>&1

mkdir -p /docker/jovyan

chown -R 1000:1000 /docker/jovyan

docker run --name scipy-geo-maps -d --restart=always \
  -p 80:8888 \
  -v /docker/jovyan:/home/jovyan \
  mrbits/scipy-geo-maps:latest

sleep 10

docker logs scipy-geo-maps
