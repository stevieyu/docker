FROM alpine

ENV PATH=/root/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH

RUN find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/mirror.sjtu.edu.cn/g' \
    # && apt update && apt install -y curl git \
    && apk add --no-cache curl git bash \
    && curl -sSfL https://install.determinate.systems/nix | sh -s -- install linux --no-confirm --init none \
    # && nix profile install nixpkgs#devbox \
    && curl -sSfL https://get.jetify.com/devbox | bash -s -- -f && devbox -h \
    && echo 'ok'

RUN echo 'substituters = https://mirror.sjtu.edu.cn/nix-channels/store https://cache.nixos.org/' >> /etc/nix/nix.conf

WORKDIR /WORKDIR

CMD "/usr/local/bin/devbox -h"
