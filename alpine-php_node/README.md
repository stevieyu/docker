#php && node

```shell
$ docker build t apn .

$ docker run -it --rm -p 80:80 -v $PWD:/home -w /home apn php -S 0.0.0.0:80

$ docker exec -it {container_id} sh
```
