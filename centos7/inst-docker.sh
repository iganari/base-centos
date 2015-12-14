#!/bin/bash

curl -sSL https://get.docker.com/ | sh
service docker start
docker run hello-world
