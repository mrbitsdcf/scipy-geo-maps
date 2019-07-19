#!/bin/bash

docker container rm -f scypi-geo-maps 1>/dev/null 2>&1

docker run --name scypi-geo-maps -d --restart=always \
  -p 80:8888 \
  -v /docker/jovyan:/home/jovyan \
  mrbits/scypi-geo-maps:lastest

docker logs scypi-geo-maps
