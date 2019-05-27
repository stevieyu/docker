# Brook
VPN on Linux/MacOS/Windows, maybe you can use it for games
[docs](https://github.com/txthinking/brook)

```
# run server
docker run -d -p 9999:9999 --name brook-server server -l :9999 -p password

# run client
docker run -d -p 5080:5080 --name brook-client client -l 127.0.0.1:5080 -i 127.0.0.1 -s server_address:port -p password

# run client for http
docker run -d -p 5080:5080 --name brook-client client -l 127.0.0.1:5080 -i 127.0.0.1 -s server_address:port -p password --http
```