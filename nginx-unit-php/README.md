# Nginx Unit


## use

```sh
#编译
docker build -t nginx-unit-php .

#标准运行
docker run -d --name nginx-unit-php -p 8020:8020  nginx-unit-php

#开放 http 接口运行
docker run -d --name nginx-unit-php -p 8010:8010 -p 8020:8020 nginx-unit-php --no-daemon --control 0.0.0.0:8010
```

## generate host

```sh
curl -X PUT \
  http://127.0.0.1:8010/config \
  -H 'Content-Type: application/json' \
  -d '{
    "listeners": {
        "*:8020": {
            "application": "php"
        }
    },
    "applications": {
        "php": {
            "type": "php",
            "processes": 20,
            "root": "/var/www",
            "index": "index.php"
        }
    }
}'
```