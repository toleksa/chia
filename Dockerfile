# Dockerfile

#FROM alpine
#RUN apk add --no-cache --virtual build-deps build-base python3-dev py3-pip
#RUN apk add --no-cache py3-pip py3-miniupnpc py3-setproctitle py3-cffi py3-wheel py3-cryptography 
#RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ cargo
FROM python:3.9.5-slim-buster
#RUN pip install --extra-index-url https://hosted.chia.net/simple/ chia-blockchain==1.0.5
RUN pip install --extra-index-url https://hosted.chia.net/simple/ chia-blockchain
RUN ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime

EXPOSE 8444
STOPSIGNAL SIGTERM

WORKDIR /chia
RUN mkdir -p /root/.chia
RUN ln -sd /chia/mainnet /root/.chia/mainnet
RUN mkdir -p /root/.local/share
RUN ln -sd /chia/python_keyring /root/.local/share/python_keyring
CMD /usr/local/bin/chia start all ; sleep infinity

