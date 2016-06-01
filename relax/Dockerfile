FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#https://github.com/relax/relax

RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y curl build-essential python make libvips-dev && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get update && \ 
    apt-get install -y nodejs && \
    npm config set registry https://registry.npm.taobao.org && \
    npm install -g node-gyp sharp --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist
#http://sharp.readthedocs.io/en/stable/install/
RUN curl -s https://raw.githubusercontent.com/lovell/sharp/master/preinstall.sh | bash -

RUN git clone https://github.com/relax/relax.git /root/relax && \
    cd /root/relax && \
    npm i

WORKDIR /root/relax



CMD ["node"]
