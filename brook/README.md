# Brook
VPN on Linux/MacOS/Windows, maybe you can use it for games
[docs](https://github.com/txthinking/brook)

```
# build 
docker build -t brook .

# run server
docker run -d -p 9999:9999 --name brook-server brook --debug server -l :9999 -p password

# run client
docker run --rm -d -p 5080:5080 --name brook-client brook --debug client -l :5080 -i 0.0.0.0 -s 47.244.144.198:9999 -p password

# run client for http
docker run --rm -d -p 5081:5081 --name brook-client brook --debug client -l :5081 -i 0.0.0.0 -s 47.244.144.198:9999 -p password --http

---

# run server
docker run -d -p 9999:9999 --name brook-server stevie/docker:brook --debug server -l :9999 -p password

# run client
docker run --rm -d -p 5080:5080 --name brook-client stevie/docker:brook --debug client -l :5080 -i 0.0.0.0 -s 47.244.144.198:9999 -p password

# run client for http
docker run --rm -d -p 5081:5081 --name brook-client stevie/docker:brook --debug client -l :5081 -i 0.0.0.0 -s 47.244.144.198:9999 -p password --http
```