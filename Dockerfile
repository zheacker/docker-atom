FROM centos:7
MAINTAINER Zac Heacker <zac.heacker@gmail.com>

ENV ATOM_VERSION 1.11.2

RUN yum update -y && yum install -y \
     git \
     gconf2 \
     gconf-service \
     gvfs-bin \
     libasound2 \
     libcap2 \
     libgconf-2-4 \
     libgnome-keyring-dev \
     libgtk2.0-0 \
     libnotify4 \
     libnss3 \
     libxtst6 \
     xdg-utils \

# RUN curl -sSL https://github.com/atom/atom/releases/download/v${ATOM_VERSION}/atom.x86_64.rpm -o /tmp/atom64.rpm

CMD /bin/bash
