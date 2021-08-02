# Dockerfile

FROM python:3.9.5-slim-buster
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

