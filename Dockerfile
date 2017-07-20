FROM debian:jessie

USER root

#labeling
LABEL maintainer="netiotedge@hilscher.com" \ 
      version="V1.0.0.2" \
      description="Desktop (DVI) for NIOT-E-TIJCX-GB-RE"

#version
ENV HILSCHERNETIOTEDGE_DESKTOP_VERSION 1.0.0.2

#install xserver, desktop, login manager, web browser
RUN apt-get update \
    && apt-get -y install --no-install-recommends xserver-xorg \
    && apt-get -y install --no-install-recommends xinit \
    && apt-get -y install xfce4 xfce4-terminal \
    && apt-get -y install iceweasel \
    && mkdir /etc/X11/xorg.conf.d 
    
#install mouse support configuration file    
COPY "./files-to-copy-to-image/10-input.conf" "/etc/X11/xorg.conf.d"
COPY "./files-to-copy-to-image/event.sh" "/"

RUN chmod +x /event.sh

#set the entrypoint
ENTRYPOINT ["/event.sh"]
