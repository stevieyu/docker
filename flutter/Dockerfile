FROM       ubuntu:latest
MAINTAINER Stevie "https://github.com/yzm629"

ENV FLUTTER_PATH=/flutter/bin \
	PUB_CACHE_BIN=/root/.pub-cache/bin \
	DART_PATH=/flutter/bin/cache/dart-sdk/bin \
	PUB_HOSTED_URL=https://pub.flutter-io.cn \
	FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

ENV PATH=$PATH:$FLUTTER_PATH:$PUB_CACHE_BIN:$DART_PATH

RUN sed -i -E 's/(archive|security).ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
	&& apt-get update \
    && apt-get install -y git curl unzip libglu1-mesa xz-utils lib32stdc++6 \
    && git clone --depth=2 https://github.com/flutter/flutter.git \
    && flutter doctor -v

CMD flutter doctor