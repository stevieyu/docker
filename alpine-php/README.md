#mini php 5.6.17

```shell
$ docker build t alpine_php .

$ docker run -it --rm -p 80:80 -v $PWD:/home -w /home alpine_php php -S 0.0.0.0:80

$ docker exec -it {container_id} sh
```
