FROM i386/ubuntu:bionic
RUN apt-get -y update && apt-get -y install \
    curl \
    python3.6-dev \
    python3.6 \
    python3-distutils
