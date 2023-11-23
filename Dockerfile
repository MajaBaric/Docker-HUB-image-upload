FROM jenkins/jenkins:2.414.3-jdk17

USER root

RUN apt-get update && apt-get install -y lsb-release

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  	https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  	signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  	https://download.docker.com/linux/debian \
  	$(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins

RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"



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
