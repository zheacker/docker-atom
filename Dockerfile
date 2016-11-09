FROM phusion/baseimage
MAINTAINER Zac Heacker <zac.heacker@gmail.com>

CMD ["/sbin/my_init"]

ENV  LANG=C.UTF-8 \
     LC_ALL=C.UTF-8 \
     ATOM_VERSION=1.11.0

RUN apt-get update && apt-get install -y \
     bzip2 \
     ca-certificates \
     curl \
     git \
     gconf2 \
     gconf-service \
     gvfs-bin \
     libasound2 \
     libcap2 \
     libgconf-2-4 \
     libglib2.0-0 \
     libgnome-keyring-dev \
     libgtk2.0-0 \
     libnotify4 \
     libnss3 \
     libsm6 \
     libxext6 \
     libxrender1 \
     libxtst6 \
     wget \
     xdg-utils \
     --no-install-recommends \
     && rm -rf /var/lib/apt/lists/*

RUN buildDeps=' \
     		ca-certificates \
     		curl \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sSL https://github.com/atom/atom/releases/download/v${ATOM_VERSION}/atom-amd64.deb -o /tmp/atom-amd64.deb \
	&& dpkg -i /tmp/atom-amd64.deb \
	&& rm -rf /tmp/*.deb \
	&& apt-get purge -y --auto-remove $buildDeps

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT [ "atom", "--foreground" ]
