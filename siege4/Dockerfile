FROM       ubuntu:devel
MAINTAINER Stevie https://github.com/yzm629


# Set environment vars
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    SIEGE_VERSION=4.0.4

# Create app dir
WORKDIR /root

# Install and build Siege from source
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
	set -ex && \
        buildDeps=' \
                build-essential \
                libssl-dev \
                curl \
        ' && \
        runDeps=' \
                ca-certificates \
                libssl1.0.0 \
        ' && \
        apt-get update && \
        apt-get install -y --no-install-recommends $buildDeps $runDeps && \
        curl -O http://download.joedog.org/siege/siege-${SIEGE_VERSION}.tar.gz && \
        tar -xvzf siege-${SIEGE_VERSION}.tar.gz && \
        cd siege-${SIEGE_VERSION} && \
        ./configure && \
        make && \
        make install && \
        cd /root && \
        apt-get purge -y --auto-remove $buildDeps && \
        rm -rf /var/lib/apt/lists/* /root/siege-${SIEGE_VERSION}*

# App command
ENTRYPOINT ["siege"]
CMD ["--help"]