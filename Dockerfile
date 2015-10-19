#
# Motion with RTSP support
# Platform: 64bit
# Version: 0.2
# Author: Matthias Ga
#

FROM debian

# install basic
RUN \
  apt-get update && apt-get install -y \
  git-core \
  build-essential

RUN \
  apt-get install -y \
  autoconf \
  automake \
  pkgconf \
  libtool \
  libjpeg62-turbo-dev \
  libzip-dev

# install lib av
RUN \
  apt-get install -y \
  libavformat-dev \
  libavcodec-dev \
  libavutil-dev \
  libav-tools \
  libswscale-dev

# build and install
RUN git clone https://github.com/Mr-Dave/motion.git
WORKDIR /motion
#RUN \
RUN autoreconf -fiv 
RUN ./configure && \
  make && \
  make install

# entrypoint.sh
RUN mkdir /init
RUN cp -R /usr/local/etc/motion /init
ADD entrypoint.sh /entrypoint.sh

# share: conf, A
RUN mkdir /motion-data
VOLUME ["/usr/local/etc/motion", "/motion-data", "/motion-log"]

EXPOSE 8080-8084

# clean up
RUN apt-get clean

WORKDIR /
ENTRYPOINT ["/entrypoint.sh"]



