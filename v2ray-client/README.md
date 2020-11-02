```
docker run --rm -it -p 8521:8521 -v $PWD/server.json:/root/v2ray/config.json vc

docker run --rm -it -p 8521:8521 -v $PWD/server.json:/etc/v2ray/config.json v2ray/official
```