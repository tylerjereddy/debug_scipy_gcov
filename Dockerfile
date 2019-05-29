FROM i386/ubuntu:bionic
RUN apt-get -y update && apt-get -y install \
    curl \
    python3.6-dev \
    python3.6 \
    python3-distutils \
    pkg-config \
    libpng-dev \
    libjpeg8-dev \
    libfreetype6-dev
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.6 get-pip.py && \
    pip3 --version && \
    pip3 install setuptools wheel numpy cython==0.29.2 pytest pytest-timeout pytest-xdist pytest-env pytest-faulthandler pytest-cov Pillow mpmath matplotlib gcovr --user && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install g++-5 gcc-5 gfortran-5 wget mono-complete && \
    cd .. && \
    mkdir openblas && cd openblas && \
    wget https://3f23b170c54c2533c070-1c8a9b3114517dc5fe17b7c3f8c63a43.ssl.cf2.rackcdn.com/openblas-v0.3.3-186-g701ea883-manylinux1_i686.tar.gz && \
    tar zxvf openblas-v0.3.3-186-g701ea883-manylinux1_i686.tar.gz && \
    cp -r ./usr/local/lib/* /usr/lib && \
    cp ./usr/local/include/* /usr/include && \
    ln -sf /usr/bin/gfortran-5 /usr/bin/gfortran && \
    ln -sf /usr/bin/gcc-5 /usr/bin/gcc && \
    ln -sf /usr/bin/gcov-5 /usr/bin/gcov && \
    ln -sf /usr/bin/g++-5 /usr/bin/g++ && \
    cd ..
RUN wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe && \
    mono nuget.exe install ReportGenerator
