FROM openjdk:8-jre-slim

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
    wget

ENV REDPEN_VERSION=1.9.0
RUN wget -q https://github.com/redpen-cc/redpen/releases/download/redpen-${REDPEN_VERSION}/redpen-${REDPEN_VERSION}.tar.gz -O - | tar xz \
    && cp -av redpen-distribution-${REDPEN_VERSION}/* /usr/local/ \
    && rm -rf redpen-distribution-${REDPEN_VERSION}

ENV PATH $PATH:/usr/local/bin
