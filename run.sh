#!/bin/bash

docker container rm -f scipy-geo-maps 1>/dev/null 2>&1

docker run --name scipy-geo-maps -d --restart=always \
  -p 80:8888 \
  -v /docker/jovyan:/home/jovyan \
  mrbits/scipy-geo-maps:latest

sleep 10

docker logs scipy-geo-maps
