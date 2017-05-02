FROM debian:jessie

USER root

#labeling
LABEL maintainer="netiotedge@hilscher.com" \ 
      version="V1.0.0.1" \
      description="Desktop (DVI) for NIOT-E-TIJCX-GB-RE"

#version
ENV HILSCHERNETIOTEDGE_DESKTOP_VERSION 1.0.0.1

#install xserver, desktop and login manager
RUN apt-get update \
    && apt-get -y install --no-install-recommends xserver-xorg \
    && apt-get -y install --no-install-recommends xinit \
    && apt-get -y install xfce4 xfce4-terminal \
    && mkdir /etc/X11/xorg.conf.d 
    
#install mouse support configuration file    
COPY "./files-to-copy-to-image/10-input.conf" "/etc/X11/xorg.conf.d"
COPY "./files-to-copy-to-image/event.sh" "/home"

#set the entrypoint
ENTRYPOINT ["/bin/bash /home/event.sh"]
