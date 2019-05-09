#!/usr/bin/env bash
image=hollywood
version=latest

docker build -t ivonet/${image}:${version} .
if [ "$?" -eq 0 ]; then
    docker push ivonet/${image}:${version}
fi