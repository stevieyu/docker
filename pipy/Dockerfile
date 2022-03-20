FROM alpine:latest as builder
LABEL maintainer="Kevein Liu<khas@flomesh.io>"

ENV  pkg_prefix              /usr/local
ENV  pkg_confdir	     /etc/pipy
ENV  pkg_bindir              ${pkg_prefix}/bin
ENV  CXX       		     clang++
ENV  CC			     clang

ARG VERSION
ENV VERSION=${VERSION}

ARG REVISION
ENV REVISION=${REVISION}

ARG COMMIT_ID
ENV CI_COMMIT_SHA=${COMMIT_ID}

ARG COMMIT_DATE
ENV CI_COMMIT_DATE=${COMMIT_DATE}

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache --virtual .build-deps openssh-client cmake clang alpine-sdk linux-headers autoconf automake libtool tiff jpeg zlib zlib-dev pkgconf nasm file musl-dev nodejs npm

ADD https://cdn.jsdelivr.net/gh/stevieyu/stevieyu.github.io/.npmrc ~/.npmrc
ADD https://ghproxy.com/https://github.com/flomesh-io/pipy/archive/refs/heads/main.zip main.zip

RUN apk add --no-cache unzip yarn util-linux && \
    unzip main.zip && \
    mv pipy-main pipy

RUN cd pipy \
        && rm -fr build \
        && mkdir build \
        && yarn install \
	    && yarn run build \
        && cd build \
	&& export CI_COMMIT_SHA \
        && export CI_COMMIT_TAG=${VERSION}-${REVISION} \
        && export CI_COMMIT_DATE \
        && cmake -DPIPY_GUI=ON -DPIPY_TUTORIAL=ON -DCMAKE_BUILD_TYPE=Release .. \
        && make -j$(getconf _NPROCESSORS_ONLN) \
        && mkdir ${pkg_confdir} \
        && cp /pipy/bin/pipy ${pkg_bindir} \
	&& apk del .build-deps


FROM alpine:latest as prod
COPY --from=builder /pipy/bin/pipy /usr/local/bin/pipy
COPY --from=builder /etc/pipy /etc/pipy
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache ca-certificates libstdc++ libcap su-exec tar curl busybox-extras iptables tzdata socat logrotate && \
    adduser -Su 1340 pipy \
    && chmod -R g=u /usr/local/bin/pipy /etc/pipy \
    && chown -R pipy:0 /usr/local/bin/pipy /etc/pipy 

COPY docker-entrypoint.sh /docker-entrypoint.sh

USER pipy
EXPOSE 6000
STOPSIGNAL SIGQUIT

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["pipy", "docker-start"]