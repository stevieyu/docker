[go-shadowsocks2](https://github.com/shadowsocks/go-shadowsocks2)

build:
```sh
docker build -t ss2 .
```

Server:
```sh
docker run --rm -d -p 8488:8488 --name ss2 ss2 -s 'ss://AEAD_CHACHA20_POLY1305:your-password@:8488' -verbose
```

Client:
```sh
docker run --rm -d -p 1080:1080 --name ss2 ss2 -c 'ss://AEAD_CHACHA20_POLY1305:your-password@[server_address]:8488' -verbose
```

###### SIP003插件（实验性）
Server:
```sh
docker run --rm -d -p 8488:8488 --name ss2 ss2 -s 'ss://AEAD_CHACHA20_POLY1305:your-password@:8488' -verbose -plugin v2ray -plugin-opts "server"
```

Client:
```sh
docker run --rm -d -p 1080:1080 --name ss2 ss2 -c 'ss://AEAD_CHACHA20_POLY1305:your-password@[server_address]:8488' -verbose -socks :1080 -u -plugin v2ray
```