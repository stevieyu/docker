# alpine-mariadb

Multiple purpose MariaDB/MySQL based on Alpine

## Docker image usage

```
docker build -t alpine-mariadb .
docker run [docker-options] alpine-mariadb 
```

Note that MySQL root will be randomly generated (using pwgen). 
Root password will be displayed, during first run using output similar to this:
```
[i] MySQL root Password: XXXXXXXXXXXXXXX
```

But you don't need root password really. If you connect locally, it should not 
ask you for password, so you can use following procedure:
```
docker exec -it mariadb_containerid /bin/sh
# mysql -u root mysql
```

## Examples

Typical usage:

```
docker run -it -v /host/dir/for/db:/var/lib/mysql -e MYSQL_DATABASE=db -e MYSQL_USER=user -e MYSQL_PASSWORD=blah alpine-mariadb
```
