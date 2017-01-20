## General use

```sh
docker run --rm -it -p 8100:8100 -v $PWD:/root/data:rw -w /root/data node-tool
```

## use whistle

```sh
docker run --rm -it -p 8899:8899 -p 8900:8900 node-tool w2 start
```