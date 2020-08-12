#!/bin/sh
IMAGE=icewire314/latexinkice:ubuntu
exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" "$@"
