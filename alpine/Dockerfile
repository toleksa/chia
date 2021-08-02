# Dockerfile

FROM alpine:edge
RUN apk add --no-cache --virtual .build-deps build-base python3-dev py3-pip libffi-dev bluez-dev \
        bzip2-dev \
        coreutils \
        dpkg-dev dpkg \
        expat-dev \
        findutils \
        gcc \
        gdbm-dev \
        libc-dev \
        libffi-dev \
        libnsl-dev \
        libtirpc-dev \
        linux-headers \
        make \
        ncurses-dev \
        openssl-dev \
        pax-utils \
        readline-dev \
        sqlite-dev \
        tcl-dev \
        tk \
        tk-dev \
        util-linux-dev \
        xz-dev \
        zlib-dev \
        cmake \
        git
RUN apk add --no-cache py3-pip py3-miniupnpc py3-setproctitle py3-cffi py3-wheel py3-cryptography 
#RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ cargo
RUN apk add --no-cache cargo
RUN pip install --extra-index-url https://hosted.chia.net/simple/ chia-blockchain
RUN apk del --no-network .build-deps
RUN ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime

EXPOSE 8444
STOPSIGNAL SIGTERM

RUN mkdir -p /chia
RUN mkdir -p /root/.chia
RUN ln -sd /chia/mainnet /root/.chia/mainnet
RUN mkdir -p /root/.local/share
RUN ln -sd /chia/python_keyring /root/.local/share/python_keyring
CMD /usr/local/bin/chia start all ; sleep infinity

