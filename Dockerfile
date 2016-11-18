FROM phusion/baseimage
MAINTAINER Zac Heacker <zac.heacker@gmail.com>

# phusion baseimage with my_init
# install atom
# install anaconda
# install hydrogen pre-reqs
# install hydrogen
# setup hydrogen with anaconda kernel

# phusion baseimage init
CMD ["/sbin/my_init"]

# environment variables from jess/atom & anaconda3
ENV  LANG=C.UTF-8 \
     LC_ALL=C.UTF-8 \
     ATOM_VERSION=1.11.0

# install stuff for atom/anaconda
RUN apt-get update && apt-get install -y \
     bzip2 \
     ca-certificates \
     curl \
     g++ \
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
     libzmq3-dev \
     wget \
     xdg-utils \
     --no-install-recommends \
     && rm -rf /var/lib/apt/lists/* \

# install atom
#RUN
     && buildDeps=' \
     		ca-certificates \
     		curl \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sSL https://github.com/atom/atom/releases/download/v${ATOM_VERSION}/atom-amd64.deb -o /tmp/atom-amd64.deb \
	&& dpkg -i /tmp/atom-amd64.deb \
	&& rm -rf /tmp/*.deb \
#	&& apt-get purge -y --auto-remove $buildDeps \

# install anaconda (v3)
#RUN
     && echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
     && curl -sSL https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh -o /tmp/anaconda.sh \
     && /bin/bash /tmp/anaconda.sh -b -p /opt/conda \
     && rm /tmp/anaconda.sh \

#RUN
     && apm install hydrogen \


# final cleanup - from phusion/baseimage
#RUN
     && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH /opt/conda/bin:$PATH

# ENTRYPOINT [ "atom", "--foreground" ]
