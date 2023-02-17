#!/bin/bash
NAME=simonemiche/ergocub_ros2 # replace by the name of your image
TAG=first_year_demo # the tag of your built image

sudo xhost +
sudo docker run \
    --network=host --privileged \
    -it \
    --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} --device /dev/dri/card0:/dev/dri/card0 \
    ${NAME}:${TAG} bash
