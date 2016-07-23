FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

ENV COW_INSTALLDIR="/root"

RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y curl && \
    curl -L git.io/cow | bash

EXPOSE 7777

CMD ["/root/cow"]
