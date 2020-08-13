FROM ubuntu:xenial
MAINTAINER David Johns <david.johns@icewire.ca>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q \
    && apt-get install -qy \
    curl \
    texlive-full \
    python-pygments gnuplot \
    make git \
    && rm -rf /var/lib/apt/lists/*

ENV HOME /data
WORKDIR /data

VOLUME ["/data"]

RUN curl -SL https://www.icewire.ca/installFiles/inkscapeANDicemaker.tar.gz > /tmp/inkscapeANDicemaker.tar.gz \
&& cd /tmp \
&& tar -xzf /tmp/inkscapeANDicemaker.tar.gz \
&& rm /tmp/inkscapeANDicemaker.tar.gz \
&& mv /tmp/inkscapeANDicemaker/icemaker /usr/local/bin/. \
&& mv /tmp/inkscapeANDicemaker/Inkscape-4035a4f-x86_64.AppImage /usr/local/bin/. \
&& echo '#!/bin/sh\nInkscape-4035a4f-x86_64.AppImage --appimage-extract-and-run $@'>/usr/local/bin/inkscape \
&& chmod 755 /usr/local/bin/icemaker \
&& chmod 755 /usr/local/bin/Inkscape-4035a4f-x86_64.AppImage \
&& chmod 755 /usr/local/bin/inkscape 
