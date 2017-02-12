FROM       node:alpine
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk add --update ruby python zsh vim git curl && \

#zsh 配置
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \

#npm配置
    npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=https://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=https://npm.taobao.org/mirrors/phantomjs && \
	npm config set sqlite3_binary_site=http://npm.taobao.org/mirrors/sqlite3 && \
    npm config set electron_mirror=http://npm.taobao.org/mirrors/electron/ && \
    
#全局安装
    npm i -g yarn vue-cli browser-sync pm2 whistle && \
    
#yarn镜像配置
    yarn config set registry 'https://registry.npm.taobao.org'

CMD ["zsh"]