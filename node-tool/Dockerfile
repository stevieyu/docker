FROM       node:alpine
MAINTAINER Stevie yzm629@gmail.com

WORKDIR ~

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk add --no-cache ruby python && \

#npm配置
    npm config set registry http://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=http://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs && \
	npm config set sqlite3_binary_site=http://npm.taobao.org/mirrors/sqlite3 && \
    npm config set electron_mirror=http://npm.taobao.org/mirrors/electron/ && \
    
#yarn镜像配置
    yarn config set registry 'http://registry.npm.taobao.org' && \
    yarn global add browser-sync whistle vue-cli quasar-cli ionic @angular/cli && \

    npm cache clean --force && \
    yarn cache clean

EXPOSE 3000 3001

CMD ["zsh"]