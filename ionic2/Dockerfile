FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
#RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y curl build-essential apt-transport-https lsb-release openjdk-8-jre openjdk-8-jdk

#nodejs
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo 'deb https://deb.nodesource.com/node_4.x wily main' > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs python make

#nodejs tools
RUN npm config set registry https://registry.npm.taobao.org && \
    npm i -g --unsafe-perm node-gyp ionic@beta cordova --registry=https://registry.npm.taobao.org

RUN apt-get install -y gcc-multilib libncurses5 lib32z1 lib32stdc++6 zlib1g ant gradle wget

# Build-Variables
ENV ANDROID_SDK_FILE android-sdk_r24.4.1-linux.tgz
ENV ANDROID_SDK_URL https://dl.google.com/android/${ANDROID_SDK_FILE}
ENV ANDROID_BUILD_TOOLS_VERSION 23.0.2
ENV ANDROID_APIS android-10,android-15,android-16,android-17,android-18,android-19,android-20,android-21,android-22,android-23

# Set Environment Variables
ENV ANT_HOME /usr/share/ant
ENV MAVEN_HOME /usr/share/maven
ENV GRADLE_HOME /usr/share/gradle
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS_VERSION
ENV PATH $PATH:$ANT_HOME/bin
ENV PATH $PATH:$MAVEN_HOME/bin
ENV PATH $PATH:$GRADLE_HOME/bin
#android
WORKDIR "/opt"
RUN curl -sL ${ANDROID_SDK_URL} | tar xz -C . && \
    echo y | android update sdk -a -u -t platform-tools,${ANDROID_APIS},build-tools-${ANDROID_BUILD_TOOLS_VERSION}
    
CMD ["node"]
