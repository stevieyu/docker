[goproxy](https://github.com/snail007/goproxy)

```sh
docker build -t goproxy .

# socks5 代理
docker run --rm -it --name goproxy -p 38080:38080 goproxy socks -t tcp -p ":38080" --debug

# http 代理
docker run --rm -it --name goproxy -p 38080:38080 goproxy http -t tcp -p ":38080" --debug

# socks5 二级代理(加密) 代理服务器
docker run --rm -it --name goproxy -p 38080:38080 goproxy socks -t tls -m -p ":38080" -C proxy.crt -K proxy.key --debug

# socks5 二级代理(加密) 本地
docker run --rm -it --name goproxy1 -p 8080:8080 goproxy socks -t tcp -p ":8080" -T tls -M -P "192.168.199.74:38080" -C proxy.crt -K proxy.key --debug
```