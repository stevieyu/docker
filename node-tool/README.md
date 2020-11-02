## General use

```sh
docker run --rm -it -p 8100:8100 -v $PWD:/root/data:rw -w /root/data node-tool
```

## use whistle

- w2 start

- nodejs之创建最小docker镜像:http://www.tuicool.com/articles/BZJFBfM

```sh
docker run --rm -it -p 8899:8899 -p 8900:8900 -p 8901:8901 node-tool
```