FROM       ubuntu:latest
MAINTAINER Stevie "https://github.com/yzm629"

ENV FILENAME=flutter_linux_v1.5.4-hotfix.2-stable \
	FLUTTER_PATH=/flutter/bin \
	PUB_CACHE_BIN=/flutter/.pub-cache/bin \
	DART_PATH=/flutter/bin/cache/dart-sdk/bin \
	PUB_HOSTED_URL=https://pub.flutter-io.cn \
	FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

RUN sed -i -E 's/(archive|security).ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
	&& apt-get update \
    && apt-get install -y git curl unzip libglu1-mesa xz-utils lib32stdc++6 \
    && curl -O https://storage.flutter-io.cn/flutter_infra/releases/stable/linux/$FILENAME.tar.xz \
    && tar -vxf $FILENAME.tar.xz \
    && rm -rf $FILENAME.tar.xz \
    && echo 'export PATH=$PATH:$FLUTTER_PATH:$PUB_CACHE_BIN:$DART_PATH' >> ~/.bashrc

CMD flutter doctor