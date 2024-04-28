#!/bin/bash

LICENSE_KEY=v0C9V6l5-5qtX864a-5n1a0Dd2

warp-svc > /var/log/warp.log &
(
    sleep 1
    if [ -n "$LICENSE_KEY" ]; then
    	warp-cli -v --accept-tos registration license $LICENSE_KEY
    else
        warp-cli -v --accept-tos registration new
    fi
    sleep 1
    warp-cli --accept-tos mode proxy && \
    warp-cli --accept-tos proxy port 8080 && \
    warp-cli --accept-tos connect && \
    warp-cli --accept-tos status
    # warp-cli --accept-tos disconnect
)
# proxy sps -S socks -T tcp -P 127.0.0.1:8080 -t tcp -p :18080 -h aes-192-cfb -j pass & \
# curl -x http://127.0.0.1:18080 ip-api.com/line\?lang=zh-CN
