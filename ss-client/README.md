```sh
docker run --rm -d -p 8388:8388 -p 8388:8388/udp -e METHOD=aes-256-cfb -e PASSWORD=12345678 --name ss-server shadowsocks/shadowsocks-libev

docker build -t ss-client .

docker run --rm -d -p 8118:8118 -p 8110:8110 -p 8110:8110/udp  -e SERVER_ADDR=1.1.1.1 -e SERVER_PORT=8388 -e PASSWORD=12345678 -e METHOD=aes-256-cfb ss-client 
```