FROM ubuntu as base

RUN find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/mirror.sjtu.edu.cn/g'


FROM base as deb

#https://pkg.cloudflareclient.com/
RUN apt update && apt install -y curl lsb-core gnupg \
    && curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list \
    && apt autoremove -y curl lsb-core gnupg && apt clean -y && rm -rf /var/lib/apt/lists/*

FROM base

COPY --from=deb /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
COPY --from=deb /etc/apt/sources.list.d/cloudflare-client.list /etc/apt/sources.list.d/cloudflare-client.list

#https://snail007.goproxyauth.com/goproxy/manual/zh/
RUN apt update && apt install -y curl wget \
    && bash -c "$(curl -s -L https://mirrors.goproxyauth.com/https://github.com/snail007/goproxy/blob/master/install_auto.sh)" @ cn \
    && apt autoremove -y curl wget && apt clean -y && rm -rf /var/lib/apt/lists/*

#https://developers.cloudflare.com/warp-client/get-started/linux/
RUN apt update && apt install -y cloudflare-warp \
    && apt clean -y && rm -rf /var/lib/apt/lists/*

ADD start.sh .

CMD "bash start.sh"
