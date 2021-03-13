FROM vvakame/review

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
    texlive-generic-recommended
