FROM ubuntu

RUN find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g'

ADD https://gitlab.com/Misaka-blog/warp-script/-/raw/main/files/warp-yxip/warp-linux-amd64 warp
RUN chmod +x warp

ADD https://hub.gitmirror.com/https://github.com/ViRb3/wgcf/releases/download/v2.2.22/wgcf_2.2.22_linux_amd64 wgcf
RUN chmod +x wgcf

# WGCF_LICENSE_KEY="5r1Z7vu6-6J2q0Kl1-p8Hs947x" /wgcf register --accept-tos -n clash

RUN apt update && apt install -y curl \
    && curl https://g.stevie.top/github.com/XIU2/CloudflareSpeedTest/releases/latest/download/CloudflareST_linux_amd64.tar.gz | tar -zx

CMD /warp
