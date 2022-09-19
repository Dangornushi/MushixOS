#!/bin/bash

xhost +
docker run --privileged \
    -it \
    --mount type=bind,source="$(pwd)",target=/home/vscode/workspace \
    --user vscode \
    --network=host \
    -e DISPLAY=$DISPLAY \
    ghcr.io/sarisia/mikanos \
    /bin/bash
