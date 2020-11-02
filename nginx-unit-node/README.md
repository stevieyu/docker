# Nginx Unit

不可用

## use

```sh
#编译
docker build -t nginx-unit-node .

#标准运行
docker run -d --name nginx-unit-node -p 8020:8020  nginx-unit-node

#开放 http 接口运行
docker run -d --name nginx-unit-node -p 8010:8010 -p 8020:8020 nginx-unit-node --no-daemon --control 0.0.0.0:8010
```

## generate host

```sh
curl -X PUT \
  http://127.0.0.1:8010/config \
  -H 'Content-Type: application/json' \
  -d '{
    "listeners": {
        "*:8020": {
            "application": "nodejs"
        }
    },
    "applications": {
        "nodejs": {
            "type": "nodejs",
            "processes": 20,
            "root": "/var/www",
            "index": "index.js"
        }
    }
}'
```