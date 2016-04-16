FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
#RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
#RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list

    # required to use add-apt-repository
RUN buildDeps='software-properties-common'; \
    set -x && \
    apt-get update && apt-get install -y $buildDeps --no-install-recommends && \
    # use WebUpd8 PPA
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update -y && \
    # automatically accept the Oracle license
    echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java9-installer oracle-java9-set-default
ENV JAVA_HOME /usr/lib/jvm/java-9-oracle

# Build-Variables
ENV ANDROID_SDK_FILE android-sdk_r24.4.1-linux.tgz
ENV ANDROID_SDK_URL https://dl.google.com/android/${ANDROID_SDK_FILE}
ENV ANDROID_BUILD_TOOLS_VERSION 23.0.3
ENV ANDROID_APIS android-21
# Set Environment Variables
ENV ANT_HOME /usr/share/ant
ENV MAVEN_HOME /usr/share/maven
ENV GRADLE_HOME /usr/share/gradle
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS_VERSION
ENV PATH $PATH:$ANT_HOME/bin
ENV PATH $PATH:$MAVEN_HOME/bin
ENV PATH $PATH:$GRADLE_HOME/bin
WORKDIR "/opt"
RUN apt-get update -y && \
    # install 32-bit dependencies require by the android sdk
    dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y libncurses5:i386 libstdc++6:i386 zlib1g:i386 && \
    # install curl Ant and Gradle
    apt-get install -y curl ant gradle && \
    # Installs Android SDK
    curl -sL ${ANDROID_SDK_URL} | tar xz -C . && \
    echo y | android update sdk -a -u -t platform-tools,${ANDROID_APIS},build-tools-${ANDROID_BUILD_TOOLS_VERSION} -s --proxy-host android-mirror.bugly.qq.com --proxy-port 8080

RUN apt-get update && \
    apt-get install -y python make build-essential apt-transport-https lsb-release && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo 'deb https://deb.nodesource.com/node_4.x wily main' > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs && \
    npm config set registry https://registry.npm.taobao.org

RUN npm install -g node-gyp ionic@beta cordova --registry=http://registry.npm.taobao.org

ENTRYPOINT ["ionic"] 