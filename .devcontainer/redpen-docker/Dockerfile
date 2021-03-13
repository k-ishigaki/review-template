FROM openjdk:8-jre-slim

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
    sudo \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV REDPEN_VERSION=1.10.0
RUN wget -q https://github.com/redpen-cc/redpen/releases/download/redpen-${REDPEN_VERSION}/redpen-${REDPEN_VERSION}.tar.gz -O - | tar xz \
    && cp -av redpen-distribution-${REDPEN_VERSION}/* /usr/local/ \
    && rm -rf redpen-distribution-${REDPEN_VERSION}

ENV PATH $PATH:/usr/local/bin

RUN echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/developer && \
    chmod u+s `which groupadd` `which useradd` && \
    { \
    echo '#!/bin/sh -e'; \
    echo 'getent group `id -g` || groupadd --gid `id -g` developer'; \
    echo 'getent passwd `id -u` || useradd --uid `id -u` --gid `id -g` --home-dir /root developer'; \
    echo 'exec "$@"'; \
    } > /entrypoint && chmod +x /entrypoint
ENTRYPOINT [ "/entrypoint" ]
