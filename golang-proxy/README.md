1. `docker build --build-arg HTTPS_PROXY=http://192.168.199.100:1087 -t golang-proxy .`
2. 运行 `docker run --rm -it -p 9999:9999 -v $PWD/source:/root/source golang-proxy`
3. 打开浏览器