FROM       node:6
MAINTAINER Stevie "https://github.com/yzm629"

RUN npm config set registry https://registry.npm.taobao.org && \
    curl https://install.meteor.com/ | sh

#ENV http_proxy=http://10.0.75.1:1080 \
#    https_proxy=http://10.0.75.1:1080

CMD ["node"]
