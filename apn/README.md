#alpine && php && node && composer && node-gyp && gulp

```shell
docker build t apn .

docker run -it --rm -p 80:80 -v $PWD:/home -w /home apn php -S 0.0.0.0:80

docker run -it --rm -p 9000:9000 -v $PWD:/var/www/html -w /var/www/html apn php-fpm -F

docker exec -it {container_id} sh
```
