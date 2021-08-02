#!/bin/bash

docker stop chia
docker rm chia

docker run -it -p 8444:8444 --name chia --mount type=bind,source=/storage/chia,target=/chia chia:latest bash
