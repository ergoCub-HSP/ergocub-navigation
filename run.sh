#!/bin/bash
NAME=simonemiche/ergocub_ros2 # replace by the name of your image
TAG=ecub_first_year_demo # the tag of your built image (ecub_first_year_demo for ergoCubGazeboV1 or first_year_demo for stickBot)

sudo xhost +
sudo docker run \
    --network=host --privileged \
    -it \
    --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix${DISPLAY} --device /dev/dri/card0:/dev/dri/card0 \
    ${NAME}:${TAG} bash
