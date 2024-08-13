#!/bin/bash

curl -OsSfL https://github.com/stevieyu/docker/raw/master/devpod-code-server/Dockerfile && \
curl -OsSfL https://github.com/stevieyu/docker/raw/master/devpod-code-server/settings.json

docker build -t dcs .

# chmod -R a+rw $PWD
# docker run --rm -d -p 8080:8080 -v $PWD:/workspace dcs 
