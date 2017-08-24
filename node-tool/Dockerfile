FROM       node:alpine
MAINTAINER Stevie yzm629@gmail.com

WORKDIR ~

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    echo http://mirrors.ustc.edu.cn/alpine/edge/testing >> /etc/apk/repositories && \
	apk add --no-cache git ruby python zsh make && \

#zsh 配置
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \

#npm配置
    npm config set registry http://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=http://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs && \
	npm config set sqlite3_binary_site=http://npm.taobao.org/mirrors/sqlite3 && \
    npm config set electron_mirror=http://npm.taobao.org/mirrors/electron/ && \
    
#yarn镜像配置
    yarn config set registry 'http://registry.npm.taobao.org' && \
    npm i browser-sync whistle vue-cli quasar-cli ionic @angular/cli sails && \

    npm cache clean --force && \
    yarn cache clean

EXPOSE 3000 3001 8899

CMD ["zsh"]