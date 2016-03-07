FROM       beevelop/android-nodejs:v4
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
# RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
#RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list

RUN npm config set registry https://registry.npm.taobao.org && \
    npm install -g --unsafe-perm ionic@beta cordova@6.0.0 --registry=https://registry.npm.taobao.org
    
CMD ["node"]
