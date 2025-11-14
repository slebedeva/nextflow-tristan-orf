#!/bin/bash

# build image independent of wave containers
docker build -t crc1678inf/transcript_transformer:v1.0.1 .
# push to dockerhub
docker login
docker push crc1678inf/transcript_transformer:v1.0.1
