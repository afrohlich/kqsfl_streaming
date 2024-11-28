FROM ubuntu:20.04

RUN apt update && apt install \
   ubuntu-desktop

RUN add-apt-repository ppa:obsproject/obs-studio \
    apt update \
    apt install ffmpeg obs-studio