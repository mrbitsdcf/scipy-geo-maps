#!/bin/sh

chown -R jovyan:jovyan /home/jovyan

exec "$@"
