FROM ubuntu:groovy

RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
RUN apt-get update && apt-get -y install build-essential autoconf libtool git-core wget
RUN apt-get -y build-dep imagemagick libmagickcore-dev libde265 libheif

RUN cd /usr/src/ && git clone https://github.com/strukturag/libde265.git
RUN cd /usr/src/libde265 && ./autogen.sh && ./configure && make && make install

RUN cd /usr/src/ && git clone https://github.com/strukturag/libheif.git
RUN cd /usr/src/libheif && ./autogen.sh && ./configure && make && make install

RUN cd /usr/src/ && wget https://www.imagemagick.org/download/ImageMagick.tar.gz && tar xf ImageMagick.tar.gz && cd ImageMagick-7* && ./configure --with-heic=yes && make && make install && ldconfig

ADD includes /