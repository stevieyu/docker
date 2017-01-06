FROM       node:alpine
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \

#npm配置
    npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=https://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=https://npm.taobao.org/mirrors/phantomjs && \
    
#全局安装
    npm i -g yarn vue-cli angular-cli@latest browser-sync ionic pm2 && \
    
#yarn镜像配置
    yarn config set registry 'https://registry.npm.taobao.org'

CMD ["sh"]