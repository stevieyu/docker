# Brook
VPN on Linux/MacOS/Windows, maybe you can use it for games
[docs](https://github.com/txthinking/brook)

```
# build 
docker build -t brook .

# run server
docker run -d -p 9999:9999 --name brook-server --debug brook server -l :9999 -p password

# run client
docker run -d -p 5080:5080 --name brook-client --debug brook client -l :5080 -i 0.0.0.0 -s 119.29.205.85:9999 -p password

# run client for http
docker run -d -p 5080:5080 --name brook-client --debug brook client -l :5080 -i 0.0.0.0 -s server_address:port -p password --http
```