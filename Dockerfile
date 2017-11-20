FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget python

ADD ardupilot /ardupilot
ENV USER root
ENV DEBIAN_FRONTEND noninteractive
RUN echo 'APT::Get::Assume-Yes "true";'> /etc/apt/apt.conf.d/90forceyes && \
    echo 'APT::Get::force-yes "true";' >> /etc/apt/apt.conf.d/90forceyes && \
    apt-get install -y cmake git gcc-arm-none-eabi gawk python-pip lsb-release sudo && \
    cd /ardupilot && bash Tools/scripts/install-prereqs-ubuntu.sh
#make px4-v2
WORKDIR /ardupilot
ADD compile.sh /ardupilot/
RUN chmod a+x /ardupilot/compile.sh