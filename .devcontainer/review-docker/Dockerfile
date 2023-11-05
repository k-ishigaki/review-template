FROM vvakame/review:5.1

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list \
    && apt-get update && apt-get install -y --no-install-recommends \
    texlive-generic-recommended='2018.20190227-2' \
    && apt-get clean && rm -rf /var/lib/apt/lists/*; \
