from jketterl/codecserver:latest


RUN apt-get update && \
    apt-get --yes install --no-install-recommends git-core build-essential ca-certificates debhelper cmake libprotobuf-dev protobuf-compiler && \
    git clone https://github.com/szechyjs/mbelib.git && \
    cd mbelib  && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr .. && \
    make && \
    make install && \
    cd .. && \
    git clone https://github.com/fventuri/codecserver-mbelib-module.git && \
    cd codecserver-mbelib-module && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr .. && \
    make && \
    make install && \
    cd .. && \
    apt-get -y purge --autoremove git-core build-essential ca-certificates debhelper cmake libprotobuf-dev protobuf-compiler && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /mbelib && \
    rm -rf /codecserver-mbelib-module

COPY codecserver.conf /etc/codecserver/codecserver.conf