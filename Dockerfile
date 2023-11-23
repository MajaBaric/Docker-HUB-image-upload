FROM ubuntu as builder

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
	python3 \
	cmake \
	make \
	software-properties-common \
	build-essential \
	git \
	ca-certificates \
	ninja-build \
	libtbb-dev \
	libpcre3-dev \
	zlib1g-dev \
	g++-11 && \
    apt-get clean

COPY . /root/

WORKDIR /root
