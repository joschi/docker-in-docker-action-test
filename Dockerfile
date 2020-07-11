FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV TZ UTC
RUN set -ex && \
  apt-get update -q && \
  apt-get install -y -q --no-install-recommends git lsb-release apt-transport-https ca-certificates curl gnupg-agent software-properties-common && \
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
  add-apt-repository "deb https://deb.nodesource.com/node_12.x $(lsb_release -cs) main" && \
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
  apt-get update -q && \
  apt-get install -y -q --no-install-recommends docker-ce docker-ce-cli containerd.io nodejs
